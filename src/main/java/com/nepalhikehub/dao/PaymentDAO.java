package com.nepalhikehub.dao;

import com.nepalhikehub.model.Payment;
import com.nepalhikehub.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentDAO {
    
    // Create payment
    public boolean createPayment(Payment payment) {
        String sql = "INSERT INTO payments (booking_id, amount, payment_method, payment_status, payment_date, transaction_ref) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setInt(1, payment.getBookingId());
            pstmt.setBigDecimal(2, payment.getAmount());
            pstmt.setString(3, payment.getPaymentMethod());
            pstmt.setString(4, payment.getPaymentStatus());
            pstmt.setDate(5, payment.getPaymentDate());
            pstmt.setString(6, payment.getTransactionRef());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    payment.setPaymentId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get payment by ID
    public Payment getPaymentById(int paymentId) {
        String sql = "SELECT * FROM payments WHERE payment_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, paymentId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractPaymentFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get payment by booking ID
    public Payment getPaymentByBookingId(int bookingId) {
        String sql = "SELECT * FROM payments WHERE booking_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, bookingId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractPaymentFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get all payments
    public List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM payments ORDER BY payment_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                payments.add(extractPaymentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    // Get payments by user ID (joined query)
    public List<Payment> getPaymentsByUserId(int userId) {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT p.* FROM payments p " +
                     "JOIN bookings b ON p.booking_id = b.booking_id " +
                     "WHERE b.user_id = ? " +
                     "ORDER BY p.payment_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                payments.add(extractPaymentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    // Get payments by status
    public List<Payment> getPaymentsByStatus(String status) {
        List<Payment> payments = new ArrayList<>();
        String sql = "SELECT * FROM payments WHERE payment_status = ? ORDER BY payment_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                payments.add(extractPaymentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }
    
    // Update payment status
    public boolean updatePaymentStatus(int paymentId, String status) {
        String sql = "UPDATE payments SET payment_status = ? WHERE payment_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            pstmt.setInt(2, paymentId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Update payment status by booking ID
    public boolean updatePaymentStatusByBookingId(int bookingId, String status) {
        String sql = "UPDATE payments SET payment_status = ? WHERE booking_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            pstmt.setInt(2, bookingId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Update payment with transaction reference
    public boolean updatePaymentTransaction(int paymentId, String transactionRef, String status) {
        String sql = "UPDATE payments SET transaction_ref = ?, payment_status = ? WHERE payment_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, transactionRef);
            pstmt.setString(2, status);
            pstmt.setInt(3, paymentId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Process payment (complete payment)
    public boolean processPayment(int bookingId, String paymentMethod, String transactionRef) {
        String sql = "UPDATE payments SET payment_status = 'paid', payment_method = ?, transaction_ref = ?, payment_date = ? WHERE booking_id = ? AND payment_status = 'pending'";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, paymentMethod);
            pstmt.setString(2, transactionRef);
            pstmt.setDate(3, new Date(System.currentTimeMillis()));
            pstmt.setInt(4, bookingId);
            
            boolean paymentUpdated = pstmt.executeUpdate() > 0;
            
            if (paymentUpdated) {
                // Also update booking status to confirmed when payment is successful
                BookingDAO bookingDAO = new BookingDAO();
                bookingDAO.confirmBooking(bookingId);
            }
            
            return paymentUpdated;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Refund payment
    public boolean refundPayment(int paymentId) {
        String sql = "UPDATE payments SET payment_status = 'refunded' WHERE payment_id = ? AND payment_status = 'paid'";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, paymentId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get total revenue
    public double getTotalRevenue() {
        String sql = "SELECT COALESCE(SUM(amount), 0) as total FROM payments WHERE payment_status = 'paid'";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
    
    // Get revenue by date range
    public double getRevenueByDateRange(String startDate, String endDate) {
        String sql = "SELECT COALESCE(SUM(amount), 0) as total FROM payments WHERE payment_status = 'paid' AND payment_date BETWEEN ? AND ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, startDate);
            pstmt.setString(2, endDate);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getDouble("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
    
    // Get monthly revenue for reports
    public List<Object[]> getMonthlyRevenue(int year) {
        List<Object[]> monthlyRevenue = new ArrayList<>();
        String sql = "SELECT MONTH(payment_date) as month, COALESCE(SUM(amount), 0) as revenue " +
                     "FROM payments WHERE payment_status = 'paid' AND YEAR(payment_date) = ? " +
                     "GROUP BY MONTH(payment_date) ORDER BY month";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, year);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Object[] row = new Object[2];
                row[0] = rs.getInt("month");
                row[1] = rs.getDouble("revenue");
                monthlyRevenue.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return monthlyRevenue;
    }
    
    // Count payments by status
    public int countPaymentsByStatus(String status) {
        String sql = "SELECT COUNT(*) as count FROM payments WHERE payment_status = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, status);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    // Delete payment (admin only)
    public boolean deletePayment(int paymentId) {
        String sql = "DELETE FROM payments WHERE payment_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, paymentId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get pending payments
    public List<Payment> getPendingPayments() {
        return getPaymentsByStatus("pending");
    }
    
    // Get paid payments
    public List<Payment> getPaidPayments() {
        return getPaymentsByStatus("paid");
    }
    
    // Extract payment from ResultSet
    private Payment extractPaymentFromResultSet(ResultSet rs) throws SQLException {
        Payment payment = new Payment();
        payment.setPaymentId(rs.getInt("payment_id"));
        payment.setBookingId(rs.getInt("booking_id"));
        payment.setAmount(rs.getBigDecimal("amount"));
        payment.setPaymentMethod(rs.getString("payment_method"));
        payment.setPaymentStatus(rs.getString("payment_status"));
        payment.setPaymentDate(rs.getDate("payment_date"));
        payment.setTransactionRef(rs.getString("transaction_ref"));
        return payment;
    }
}
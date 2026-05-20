package com.nepalhikehub.dao;

import com.nepalhikehub.model.Booking;
import com.nepalhikehub.util.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDAO {
    
    // Create booking
    public boolean createBooking(Booking booking) {
        String sql = "INSERT INTO bookings (user_id, trek_id, booking_date, trek_start_date, num_persons, special_requests, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setInt(1, booking.getUserId());
            pstmt.setInt(2, booking.getTrekId());
            pstmt.setDate(3, booking.getBookingDate());
            pstmt.setDate(4, booking.getTrekStartDate());
            pstmt.setInt(5, booking.getNumPersons());
            pstmt.setString(6, booking.getSpecialRequests());
            pstmt.setString(7, booking.getStatus());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    booking.setBookingId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get booking by ID
    public Booking getBookingById(int bookingId) {
        String sql = "SELECT b.*, t.trek_name, t.price, u.name as user_name FROM bookings b JOIN treks t ON b.trek_id = t.trek_id JOIN users u ON b.user_id = u.user_id WHERE b.booking_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, bookingId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractBookingWithDetails(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get bookings by user ID
    public List<Booking> getBookingsByUserId(int userId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, t.trek_name, t.price FROM bookings b JOIN treks t ON b.trek_id = t.trek_id WHERE b.user_id = ? ORDER BY b.booking_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Booking booking = extractBookingWithDetails(rs);
                booking.setTotalAmount(rs.getBigDecimal("price").multiply(new BigDecimal(booking.getNumPersons())));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    // Get all bookings (for admin)
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, t.trek_name, t.price, u.name as user_name FROM bookings b JOIN treks t ON b.trek_id = t.trek_id JOIN users u ON b.user_id = u.user_id ORDER BY b.booking_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Booking booking = extractBookingWithDetails(rs);
                booking.setTotalAmount(rs.getBigDecimal("price").multiply(new BigDecimal(booking.getNumPersons())));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    // Get pending bookings
    public List<Booking> getPendingBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, t.trek_name, t.price, u.name as user_name FROM bookings b JOIN treks t ON b.trek_id = t.trek_id JOIN users u ON b.user_id = u.user_id WHERE b.status = 'pending' ORDER BY b.booking_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Booking booking = extractBookingWithDetails(rs);
                booking.setTotalAmount(rs.getBigDecimal("price").multiply(new BigDecimal(booking.getNumPersons())));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    // Update booking status
    public boolean updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE booking_id = ?";
        
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
    
    // Cancel booking
    public boolean cancelBooking(int bookingId) {
        return updateBookingStatus(bookingId, "cancelled");
    }
    
    // Confirm booking
    public boolean confirmBooking(int bookingId) {
        return updateBookingStatus(bookingId, "confirmed");
    }
    
    // Get bookings by trek ID
    public List<Booking> getBookingsByTrekId(int trekId) {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT b.*, u.name as user_name FROM bookings b JOIN users u ON b.user_id = u.user_id WHERE b.trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, trekId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                bookings.add(extractBookingWithDetails(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    private Booking extractBookingWithDetails(ResultSet rs) throws SQLException {
        Booking booking = new Booking();
        booking.setBookingId(rs.getInt("booking_id"));
        booking.setUserId(rs.getInt("user_id"));
        booking.setTrekId(rs.getInt("trek_id"));
        booking.setBookingDate(rs.getDate("booking_date"));
        booking.setTrekStartDate(rs.getDate("trek_start_date"));
        booking.setNumPersons(rs.getInt("num_persons"));
        booking.setSpecialRequests(rs.getString("special_requests"));
        booking.setStatus(rs.getString("status"));
        
        try {
            booking.setTrekName(rs.getString("trek_name"));
            booking.setUserName(rs.getString("user_name"));
        } catch (SQLException e) {
            // Column might not exist in all queries
        }
        
        return booking;
    }
    
    
}
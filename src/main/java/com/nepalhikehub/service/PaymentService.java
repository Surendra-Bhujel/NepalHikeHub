package com.nepalhikehub.service;

import com.nepalhikehub.dao.PaymentDAO;
import com.nepalhikehub.model.Payment;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;

public class PaymentService {
    
    private PaymentDAO paymentDAO;
    
    public PaymentService() {
        this.paymentDAO = new PaymentDAO();
    }
    
    // Create new payment
    public boolean createPayment(int bookingId, BigDecimal amount, String paymentMethod) {
        Payment payment = new Payment();
        payment.setBookingId(bookingId);
        payment.setAmount(amount);
        payment.setPaymentMethod(paymentMethod);
        payment.setPaymentStatus("pending");
        payment.setPaymentDate(new Date(System.currentTimeMillis()));
        payment.setTransactionRef(generateTransactionRef());
        
        return paymentDAO.createPayment(payment);
    }
    
    // Process payment
    public boolean processPayment(int bookingId, String paymentMethod, String transactionRef) {
        return paymentDAO.processPayment(bookingId, paymentMethod, transactionRef);
    }
    
    // Get payment by booking ID
    public Payment getPaymentByBookingId(int bookingId) {
        return paymentDAO.getPaymentByBookingId(bookingId);
    }
    
    // Get payment by ID
    public Payment getPaymentById(int paymentId) {
        return paymentDAO.getPaymentById(paymentId);
    }
    
    // Get all payments
    public List<Payment> getAllPayments() {
        return paymentDAO.getAllPayments();
    }
    
    // Get payments by user ID
    public List<Payment> getPaymentsByUserId(int userId) {
        return paymentDAO.getPaymentsByUserId(userId);
    }
    
    // Update payment status
    public boolean updatePaymentStatus(int paymentId, String status) {
        return paymentDAO.updatePaymentStatus(paymentId, status);
    }
    
    // Refund payment
    public boolean refundPayment(int paymentId) {
        return paymentDAO.refundPayment(paymentId);
    }
    
    // Get total revenue
    public double getTotalRevenue() {
        return paymentDAO.getTotalRevenue();
    }
    
    // Get pending payments count
    public int getPendingPaymentsCount() {
        return paymentDAO.countPaymentsByStatus("pending");
    }
    
    // Get paid payments count
    public int getPaidPaymentsCount() {
        return paymentDAO.countPaymentsByStatus("paid");
    }
    
    // Generate unique transaction reference
    private String generateTransactionRef() {
        return "TXN-" + System.currentTimeMillis() + "-" + (int)(Math.random() * 10000);
    }
}
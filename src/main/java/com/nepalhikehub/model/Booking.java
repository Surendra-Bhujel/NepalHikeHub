package com.nepalhikehub.model;

import java.math.BigDecimal;
import java.sql.Date;

public class Booking {
    private int bookingId;
    private int userId;
    private int trekId;
    private Date bookingDate;
    private Date trekStartDate;
    private int numPersons;
    private String specialRequests;
    private String status;
    
    // Additional fields for joins
    private String trekName;
    private String userName;
    private BigDecimal totalAmount;
    
    public Booking() {}
    
    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public int getTrekId() { return trekId; }
    public void setTrekId(int trekId) { this.trekId = trekId; }
    
    public Date getBookingDate() { return bookingDate; }
    public void setBookingDate(Date bookingDate) { this.bookingDate = bookingDate; }
    
    public Date getTrekStartDate() { return trekStartDate; }
    public void setTrekStartDate(Date trekStartDate) { this.trekStartDate = trekStartDate; }
    
    public int getNumPersons() { return numPersons; }
    public void setNumPersons(int numPersons) { this.numPersons = numPersons; }
    
    public String getSpecialRequests() { return specialRequests; }
    public void setSpecialRequests(String specialRequests) { this.specialRequests = specialRequests; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public String getTrekName() { return trekName; }
    public void setTrekName(String trekName) { this.trekName = trekName; }
    
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    
    public BigDecimal getTotalAmount() { return totalAmount; }
    public void setTotalAmount(BigDecimal totalAmount) { this.totalAmount = totalAmount; }
}
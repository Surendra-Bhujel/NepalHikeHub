package com.nepalhikehub.model;

import java.sql.Date;

public class Review {
    private int reviewId;
    private int userId;
    private int trekId;
    private int bookingId;
    private int rating;
    private String comment;
    private Date reviewDate;
    
    // Additional fields for joins
    private String userName;
    private String trekName;
    private String userProfileImage;
    
    public Review() {}
    
    // Constructor for creating a new review
    public Review(int userId, int trekId, int bookingId, int rating, String comment) {
        this.userId = userId;
        this.trekId = trekId;
        this.bookingId = bookingId;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = new Date(System.currentTimeMillis());
    }
    
    // Getters and Setters
    public int getReviewId() { return reviewId; }
    public void setReviewId(int reviewId) { this.reviewId = reviewId; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public int getTrekId() { return trekId; }
    public void setTrekId(int trekId) { this.trekId = trekId; }
    
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
    
    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }
    
    public Date getReviewDate() { return reviewDate; }
    public void setReviewDate(Date reviewDate) { this.reviewDate = reviewDate; }
    
    public String getUserName() { return userName; }
    public void setUserName(String userName) { this.userName = userName; }
    
    public String getTrekName() { return trekName; }
    public void setTrekName(String trekName) { this.trekName = trekName; }
    
    public String getUserProfileImage() { return userProfileImage; }
    public void setUserProfileImage(String userProfileImage) { this.userProfileImage = userProfileImage; }
    
    // Helper method to get star rating as string
    public String getStarRating() {
        if (rating <= 0) return "☆☆☆☆☆";
        StringBuilder stars = new StringBuilder();
        for (int i = 0; i < rating; i++) {
            stars.append("★");
        }
        for (int i = rating; i < 5; i++) {
            stars.append("☆");
        }
        return stars.toString();
    }
}
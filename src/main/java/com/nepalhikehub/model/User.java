package com.nepalhikehub.model;

import java.sql.Timestamp;

public class User {
    private int userId;
    private int roleId;
    private String name;
    private String email;
    private String passwordHash;
    private String phone;
    private String profileImage;
    private boolean isApproved;
    private Timestamp createdAt;
    
    // Default constructor
    public User() {}
    
    // Constructor for registration
    public User(String name, String email, String passwordHash, String phone) {
        this.name = name;
        this.email = email;
        this.passwordHash = passwordHash;
        this.phone = phone;
        this.roleId = 2; // Default role: customer
        this.isApproved = true;
    }
    
    // Getters and Setters
    public int getUserId() { 
    	return userId;
    	}
    
    public void setUserId(int userId) {
    	this.userId = userId; 
    	}
    
    public int getRoleId() {
    	return roleId; 
    	}
    
    public void setRoleId(int roleId) {
    	this.roleId = roleId; 
    	}
    
    public String getName() {
    	return name; 
    	}
    
    public void setName(String name) {
    	this.name = name; 
    	}
    
    public String getEmail() {
    	return email; 
    	}
    
    public void setEmail(String email) {
    	this.email = email; 
    	}
    
    public String getPasswordHash() {
    	return passwordHash; 
    	}
    
    public void setPasswordHash(String passwordHash) {
    	this.passwordHash = passwordHash; 
    	}
    
    public String getPhone() { 
    	return phone; 
    	}
    
    public void setPhone(String phone) { 
    	this.phone = phone; 
    	}
    
    public String getProfileImage() { 
    	return profileImage; 
    	}
    
    public void setProfileImage(String profileImage) { 
    	this.profileImage = profileImage; 
    	}
    
    public boolean isApproved() {
    	return isApproved; 
    	}
    
    public void setApproved(boolean approved) { 
    	isApproved = approved; 
    	}
    
    public Timestamp getCreatedAt() { 
    	return createdAt;
    	}
    
    public void setCreatedAt(Timestamp createdAt) {
    	this.createdAt = createdAt; 
    	}
}
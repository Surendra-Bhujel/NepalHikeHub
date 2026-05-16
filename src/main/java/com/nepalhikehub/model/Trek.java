package com.nepalhikehub.model;

import java.math.BigDecimal;

public class Trek {
    private int trekId;
    private String trekName;
    private String difficulty;
    private int durationDays;
    private BigDecimal price;
    private int maxGroupSize;
    private String region;
    private String startLocation;
    private String endLocation;
    private BigDecimal distanceKm;
    private String imageUrl;
    private String description;
    private boolean isActive;
    
    public Trek() {}
    
    // Getters and Setters
    public int getTrekId() { return trekId; }
    public void setTrekId(int trekId) { this.trekId = trekId; }
    
    public String getTrekName() { return trekName; }
    public void setTrekName(String trekName) { this.trekName = trekName; }
    
    public String getDifficulty() { return difficulty; }
    public void setDifficulty(String difficulty) { this.difficulty = difficulty; }
    
    public int getDurationDays() { return durationDays; }
    public void setDurationDays(int durationDays) { this.durationDays = durationDays; }
    
    public BigDecimal getPrice() { return price; }
    public void setPrice(BigDecimal price) { this.price = price; }
    
    public int getMaxGroupSize() { return maxGroupSize; }
    public void setMaxGroupSize(int maxGroupSize) { this.maxGroupSize = maxGroupSize; }
    
    public String getRegion() { return region; }
    public void setRegion(String region) { this.region = region; }
    
    public String getStartLocation() { return startLocation; }
    public void setStartLocation(String startLocation) { this.startLocation = startLocation; }
    
    public String getEndLocation() { return endLocation; }
    public void setEndLocation(String endLocation) { this.endLocation = endLocation; }
    
    public BigDecimal getDistanceKm() { return distanceKm; }
    public void setDistanceKm(BigDecimal distanceKm) { this.distanceKm = distanceKm; }
    
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public boolean isActive() { return isActive; }
    public void setActive(boolean active) { isActive = active; }
}
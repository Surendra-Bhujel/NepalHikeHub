package com.nepalhikehub.service;

import com.nepalhikehub.dao.ReviewDAO;
import com.nepalhikehub.model.Review;

import java.sql.Date;
import java.util.List;

public class ReviewService {
    
    private ReviewDAO reviewDAO;
    
    public ReviewService() {
        this.reviewDAO = new ReviewDAO();
    }
    
    // Add a new review
    public boolean addReview(int userId, int trekId, int bookingId, int rating, String comment) {
        // Validation
        if (rating < 1 || rating > 5) {
            return false;
        }
        if (comment == null || comment.trim().isEmpty()) {
            return false;
        }
        if (comment.length() > 1000) {
            return false;
        }
        
        // Check if user already reviewed this trek
        if (reviewDAO.hasUserReviewed(userId, trekId)) {
            return false;
        }
        
        Review review = new Review(userId, trekId, bookingId, rating, comment);
        return reviewDAO.createReview(review);
    }
    
    // Get reviews for a trek
    public List<Review> getReviewsByTrekId(int trekId) {
        return reviewDAO.getReviewsByTrekId(trekId);
    }
    
    // Get reviews by user
    public List<Review> getReviewsByUserId(int userId) {
        return reviewDAO.getReviewsByUserId(userId);
    }
    
    // Get all reviews (admin)
    public List<Review> getAllReviews() {
        return reviewDAO.getAllReviews();
    }
    
    // Get recent reviews
    public List<Review> getRecentReviews(int limit) {
        return reviewDAO.getRecentReviews(limit);
    }
    
    // Update review
    public boolean updateReview(int reviewId, int rating, String comment) {
        if (rating < 1 || rating > 5) {
            return false;
        }
        if (comment == null || comment.trim().isEmpty()) {
            return false;
        }
        
        Review review = reviewDAO.getReviewById(reviewId);
        if (review == null) {
            return false;
        }
        
        review.setRating(rating);
        review.setComment(comment);
        review.setReviewDate(new Date(System.currentTimeMillis()));
        
        return reviewDAO.updateReview(review);
    }
    
    // Delete review
    public boolean deleteReview(int reviewId) {
        return reviewDAO.deleteReview(reviewId);
    }
    
    // Get average rating for a trek
    public double getAverageRatingForTrek(int trekId) {
        return reviewDAO.getAverageRatingByTrekId(trekId);
    }
    
    // Get rating distribution for a trek
    public int[] getRatingDistributionForTrek(int trekId) {
        return reviewDAO.getRatingDistributionByTrekId(trekId);
    }
    
    // Check if user can review (has completed booking)
    public boolean canUserReview(int userId, int trekId) {
        // This would typically check if the user has a completed booking for this trek
        // For now, just check if they haven't reviewed yet
        return !reviewDAO.hasUserReviewed(userId, trekId);
    }
    
    // Get top rated treks
    public List<Object[]> getTopRatedTreks(int limit) {
        return reviewDAO.getTopRatedTreks(limit);
    }
    
    // Get overall statistics
    public double getOverallAverageRating() {
        return reviewDAO.getOverallAverageRating();
    }
    
    public int getTotalReviewsCount() {
        return reviewDAO.getTotalReviewsCount();
    }
    
    public int[] getReviewsCountByRating() {
        return reviewDAO.getReviewsCountByRating();
    }
}
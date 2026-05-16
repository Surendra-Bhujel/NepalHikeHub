package com.nepalhikehub.dao;

import com.nepalhikehub.model.Review;
import com.nepalhikehub.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    
    // Create review
    public boolean createReview(Review review) {
        String sql = "INSERT INTO reviews (user_id, trek_id, booking_id, rating, comment, review_date) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setInt(1, review.getUserId());
            pstmt.setInt(2, review.getTrekId());
            pstmt.setInt(3, review.getBookingId());
            pstmt.setInt(4, review.getRating());
            pstmt.setString(5, review.getComment());
            pstmt.setDate(6, review.getReviewDate());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    review.setReviewId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get review by ID
    public Review getReviewById(int reviewId) {
        String sql = "SELECT r.*, u.name as user_name, t.trek_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "JOIN treks t ON r.trek_id = t.trek_id " +
                     "WHERE r.review_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reviewId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractReviewWithDetails(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get reviews by trek ID
    public List<Review> getReviewsByTrekId(int trekId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, u.name as user_name, u.profile_image " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "WHERE r.trek_id = ? " +
                     "ORDER BY r.review_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, trekId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                reviews.add(extractReviewWithDetails(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
    // Get reviews by user ID
    public List<Review> getReviewsByUserId(int userId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, t.trek_name " +
                     "FROM reviews r " +
                     "JOIN treks t ON r.trek_id = t.trek_id " +
                     "WHERE r.user_id = ? " +
                     "ORDER BY r.review_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Review review = extractReviewWithDetails(rs);
                review.setTrekName(rs.getString("trek_name"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
    // Get all reviews
    public List<Review> getAllReviews() {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, u.name as user_name, t.trek_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "JOIN treks t ON r.trek_id = t.trek_id " +
                     "ORDER BY r.review_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                reviews.add(extractReviewWithDetails(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
    // Get recent reviews (for dashboard)
    public List<Review> getRecentReviews(int limit) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, u.name as user_name, t.trek_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "JOIN treks t ON r.trek_id = t.trek_id " +
                     "ORDER BY r.review_date DESC LIMIT ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, limit);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                reviews.add(extractReviewWithDetails(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
    // Get reviews by rating
    public List<Review> getReviewsByRating(int rating) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT r.*, u.name as user_name, t.trek_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "JOIN treks t ON r.trek_id = t.trek_id " +
                     "WHERE r.rating = ? " +
                     "ORDER BY r.review_date DESC";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, rating);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                reviews.add(extractReviewWithDetails(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
    
    // Check if user has already reviewed a trek
    public boolean hasUserReviewed(int userId, int trekId) {
        String sql = "SELECT COUNT(*) FROM reviews WHERE user_id = ? AND trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            pstmt.setInt(2, trekId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get review by user and trek
    public Review getReviewByUserAndTrek(int userId, int trekId) {
        String sql = "SELECT r.*, u.name as user_name, t.trek_name " +
                     "FROM reviews r " +
                     "JOIN users u ON r.user_id = u.user_id " +
                     "JOIN treks t ON r.trek_id = t.trek_id " +
                     "WHERE r.user_id = ? AND r.trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, userId);
            pstmt.setInt(2, trekId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractReviewWithDetails(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Update review
    public boolean updateReview(Review review) {
        String sql = "UPDATE reviews SET rating = ?, comment = ?, review_date = ? WHERE review_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, review.getRating());
            pstmt.setString(2, review.getComment());
            pstmt.setDate(3, new Date(System.currentTimeMillis()));
            pstmt.setInt(4, review.getReviewId());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Delete review
    public boolean deleteReview(int reviewId) {
        String sql = "DELETE FROM reviews WHERE review_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, reviewId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Delete reviews by trek ID (when trek is deleted)
    public boolean deleteReviewsByTrekId(int trekId) {
        String sql = "DELETE FROM reviews WHERE trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, trekId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get average rating for a trek
    public double getAverageRatingByTrekId(int trekId) {
        String sql = "SELECT COALESCE(AVG(rating), 0) as avg_rating FROM reviews WHERE trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, trekId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return rs.getDouble("avg_rating");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
    
    // Get rating distribution for a trek
    public int[] getRatingDistributionByTrekId(int trekId) {
        int[] distribution = new int[6]; // indices 1-5 for ratings 1-5 stars
        String sql = "SELECT rating, COUNT(*) as count FROM reviews WHERE trek_id = ? GROUP BY rating";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, trekId);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                int rating = rs.getInt("rating");
                int count = rs.getInt("count");
                if (rating >= 1 && rating <= 5) {
                    distribution[rating] = count;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return distribution;
    }
    
    // Get total number of reviews
    public int getTotalReviewsCount() {
        String sql = "SELECT COUNT(*) as count FROM reviews";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    // Get average rating across all treks
    public double getOverallAverageRating() {
        String sql = "SELECT COALESCE(AVG(rating), 0) as avg_rating FROM reviews";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            if (rs.next()) {
                return rs.getDouble("avg_rating");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0.0;
    }
    
    // Get top rated treks
    public List<Object[]> getTopRatedTreks(int limit) {
        List<Object[]> topTreks = new ArrayList<>();
        String sql = "SELECT t.trek_id, t.trek_name, t.image_url, " +
                     "COALESCE(AVG(r.rating), 0) as avg_rating, " +
                     "COUNT(r.review_id) as review_count " +
                     "FROM treks t " +
                     "LEFT JOIN reviews r ON t.trek_id = r.trek_id " +
                     "WHERE t.is_active = 1 " +
                     "GROUP BY t.trek_id " +
                     "ORDER BY avg_rating DESC, review_count DESC " +
                     "LIMIT ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, limit);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Object[] row = new Object[5];
                row[0] = rs.getInt("trek_id");
                row[1] = rs.getString("trek_name");
                row[2] = rs.getString("image_url");
                row[3] = rs.getDouble("avg_rating");
                row[4] = rs.getInt("review_count");
                topTreks.add(row);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return topTreks;
    }
    
    // Get reviews count by rating
    public int[] getReviewsCountByRating() {
        int[] counts = new int[6];
        String sql = "SELECT rating, COUNT(*) as count FROM reviews GROUP BY rating";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                int rating = rs.getInt("rating");
                int count = rs.getInt("count");
                if (rating >= 1 && rating <= 5) {
                    counts[rating] = count;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return counts;
    }
    
    // Extract review with details from ResultSet
    private Review extractReviewWithDetails(ResultSet rs) throws SQLException {
        Review review = new Review();
        review.setReviewId(rs.getInt("review_id"));
        review.setUserId(rs.getInt("user_id"));
        review.setTrekId(rs.getInt("trek_id"));
        review.setBookingId(rs.getInt("booking_id"));
        review.setRating(rs.getInt("rating"));
        review.setComment(rs.getString("comment"));
        review.setReviewDate(rs.getDate("review_date"));
        
        // Set additional fields if available
        try {
            review.setUserName(rs.getString("user_name"));
        } catch (SQLException e) {
            // Column might not exist
        }
        
        try {
            review.setTrekName(rs.getString("trek_name"));
        } catch (SQLException e) {
            // Column might not exist
        }
        
        try {
            review.setUserProfileImage(rs.getString("profile_image"));
        } catch (SQLException e) {
            // Column might not exist
        }
        
        return review;
    }
}
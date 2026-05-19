package com.nepalhikehub.dao;

import com.nepalhikehub.model.Trek;
import com.nepalhikehub.util.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrekDAO {
    	
    // Create trek
    public boolean createTrek(Trek trek) {
        String sql = "INSERT INTO treks (trek_name, difficulty, duration_days, price, max_group_size, region, start_location, end_location, distance_km, image_url, description, is_active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            pstmt.setString(1, trek.getTrekName());
            pstmt.setString(2, trek.getDifficulty());
            pstmt.setInt(3, trek.getDurationDays());
            pstmt.setBigDecimal(4, trek.getPrice());
            pstmt.setInt(5, trek.getMaxGroupSize());
            pstmt.setString(6, trek.getRegion());
            pstmt.setString(7, trek.getStartLocation());
            pstmt.setString(8, trek.getEndLocation());
            pstmt.setBigDecimal(9, trek.getDistanceKm());
            pstmt.setString(10, trek.getImageUrl());
            pstmt.setString(11, trek.getDescription());
            pstmt.setBoolean(12, trek.isActive());
            
            int affectedRows = pstmt.executeUpdate();
            
            if (affectedRows > 0) {
                ResultSet rs = pstmt.getGeneratedKeys();
                if (rs.next()) {
                    trek.setTrekId(rs.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get trek by ID
    public Trek getTrekById(int trekId) {
        String sql = "SELECT * FROM treks WHERE trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, trekId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return extractTrekFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Get all active treks
    public List<Trek> getAllTreks() {
        List<Trek> treks = new ArrayList<>();
        String sql = "SELECT * FROM treks ORDER BY trek_id DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                treks.add(extractTrekFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return treks;
    }
    
    // Get active treks only
    public List<Trek> getActiveTreks() {
        List<Trek> treks = new ArrayList<>();
        String sql = "SELECT * FROM treks WHERE is_active = 1 ORDER BY trek_id DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                treks.add(extractTrekFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return treks;
    }
    
    // Search treks
    public List<Trek> searchTreks(String keyword) {
        List<Trek> treks = new ArrayList<>();
        String sql = "SELECT * FROM treks WHERE is_active = 1 AND (trek_name LIKE ? OR region LIKE ? OR description LIKE ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            String searchPattern = "%" + keyword + "%";
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            pstmt.setString(3, searchPattern);
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                treks.add(extractTrekFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return treks;
    }
    
    // Filter treks by difficulty and region
    public List<Trek> filterTreks(String difficulty, String region, String minPrice, String maxPrice) {
        List<Trek> treks = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM treks WHERE is_active = 1");
        List<Object> params = new ArrayList<>();
        
        if (difficulty != null && !difficulty.isEmpty()) {
            sql.append(" AND difficulty = ?");
            params.add(difficulty);
        }
        if (region != null && !region.isEmpty()) {
            sql.append(" AND region = ?");
            params.add(region);
        }
        if (minPrice != null && !minPrice.isEmpty()) {
            sql.append(" AND price >= ?");
            params.add(new BigDecimal(minPrice));
        }
        if (maxPrice != null && !maxPrice.isEmpty()) {
            sql.append(" AND price <= ?");
            params.add(new BigDecimal(maxPrice));
        }
        
        sql.append(" ORDER BY trek_id DESC");
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
            
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                treks.add(extractTrekFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return treks;
    }
    
    // Update trek
    public boolean updateTrek(Trek trek) {
        String sql = "UPDATE treks SET trek_name = ?, difficulty = ?, duration_days = ?, price = ?, max_group_size = ?, region = ?, start_location = ?, end_location = ?, distance_km = ?, image_url = ?, description = ?, is_active = ? WHERE trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, trek.getTrekName());
            pstmt.setString(2, trek.getDifficulty());
            pstmt.setInt(3, trek.getDurationDays());
            pstmt.setBigDecimal(4, trek.getPrice());
            pstmt.setInt(5, trek.getMaxGroupSize());
            pstmt.setString(6, trek.getRegion());
            pstmt.setString(7, trek.getStartLocation());
            pstmt.setString(8, trek.getEndLocation());
            pstmt.setBigDecimal(9, trek.getDistanceKm());
            pstmt.setString(10, trek.getImageUrl());
            pstmt.setString(11, trek.getDescription());
            pstmt.setBoolean(12, trek.isActive());
            pstmt.setInt(13, trek.getTrekId());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Delete trek (soft delete)
    public boolean deleteTrek(int trekId) {
        String sql = "UPDATE treks SET is_active = 0 WHERE trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, trekId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Hard delete trek
    public boolean hardDeleteTrek(int trekId) {
        String sql = "DELETE FROM treks WHERE trek_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, trekId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    // Get treks by region
    public List<Trek> getTreksByRegion(String region) {
        List<Trek> treks = new ArrayList<>();
        String sql = "SELECT * FROM treks WHERE region = ? AND is_active = 1";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, region);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                treks.add(extractTrekFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return treks;
    }
    
    private Trek extractTrekFromResultSet(ResultSet rs) throws SQLException {
        Trek trek = new Trek();
        trek.setTrekId(rs.getInt("trek_id"));
        trek.setTrekName(rs.getString("trek_name"));
        trek.setDifficulty(rs.getString("difficulty"));
        trek.setDurationDays(rs.getInt("duration_days"));
        trek.setPrice(rs.getBigDecimal("price"));
        trek.setMaxGroupSize(rs.getInt("max_group_size"));
        trek.setRegion(rs.getString("region"));
        trek.setStartLocation(rs.getString("start_location"));
        trek.setEndLocation(rs.getString("end_location"));
        trek.setDistanceKm(rs.getBigDecimal("distance_km"));
        trek.setImageUrl(rs.getString("image_url"));
        trek.setDescription(rs.getString("description"));
        trek.setActive(rs.getBoolean("is_active"));
        return trek;
    }
}
package com.nepalhikehub.service;

import com.nepalhikehub.dao.TrekDAO;
import com.nepalhikehub.model.Trek;
import java.util.List;

public class TrekService {
    private TrekDAO trekDAO;
    
    public TrekService() {
        this.trekDAO = new TrekDAO();
    }
    
    public boolean addTrek(Trek trek) {
        if (trek.getTrekName() == null || trek.getTrekName().isEmpty()) {
            return false;
        }
        if (trek.getPrice() == null || trek.getPrice().doubleValue() <= 0) {
            return false;
        }
        return trekDAO.createTrek(trek);
    }
    
    public Trek getTrekById(int trekId) {
        return trekDAO.getTrekById(trekId);
    }
    
    public List<Trek> getAllTreks() {
        return trekDAO.getAllTreks();
    }
    
    public List<Trek> getActiveTreks() {
        return trekDAO.getActiveTreks();
    }
    
    public List<Trek> searchTreks(String keyword) {
        if (keyword == null || keyword.isEmpty()) {
            return getActiveTreks();
        }
        return trekDAO.searchTreks(keyword);
    }
    
    public List<Trek> filterTreks(String difficulty, String region, String minPrice, String maxPrice) {
        return trekDAO.filterTreks(difficulty, region, minPrice, maxPrice);
    }
    
    public boolean updateTrek(Trek trek) {
        return trekDAO.updateTrek(trek);
    }
    
    public boolean deleteTrek(int trekId) {
        return trekDAO.deleteTrek(trekId);
    }
}
package com.nepalhikehub.controller.admin;

import com.nepalhikehub.model.Trek;
import com.nepalhikehub.service.TrekService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet("/admin/manage-treks")
public class ManageTreksServlet extends HttpServlet {
    
    private TrekService trekService;
    
    @Override
    public void init() throws ServletException {
        trekService = new TrekService();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String action = req.getParameter("action");
        
        if ("delete".equals(action)) {
            int trekId = Integer.parseInt(req.getParameter("id"));
            trekService.deleteTrek(trekId);
            resp.sendRedirect(req.getContextPath() + "/admin/manage-treks");
        } else if ("edit".equals(action)) {
            int trekId = Integer.parseInt(req.getParameter("id"));
            Trek trek = trekService.getTrekById(trekId);
            req.setAttribute("trek", trek);
            req.getRequestDispatcher("/views/admin/edit-trek.jsp").forward(req, resp);
        } else {
            req.setAttribute("treks", trekService.getAllTreks());
            req.getRequestDispatcher("/views/admin/manage-treks.jsp").forward(req, resp);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String action = req.getParameter("action");
        
        if ("add".equals(action)) {
            Trek trek = new Trek();
            trek.setTrekName(req.getParameter("trekName"));
            trek.setDifficulty(req.getParameter("difficulty"));
            trek.setDurationDays(Integer.parseInt(req.getParameter("durationDays")));
            trek.setPrice(new BigDecimal(req.getParameter("price")));
            trek.setMaxGroupSize(Integer.parseInt(req.getParameter("maxGroupSize")));
            trek.setRegion(req.getParameter("region"));
            trek.setStartLocation(req.getParameter("startLocation"));
            trek.setEndLocation(req.getParameter("endLocation"));
            trek.setDistanceKm(new BigDecimal(req.getParameter("distanceKm")));
            trek.setImageUrl(req.getParameter("imageUrl"));
            trek.setDescription(req.getParameter("description"));
            trek.setActive(true);
            
            if (trekService.addTrek(trek)) {
                req.setAttribute("successMessage", "Trek added successfully!");
            } else {
                req.setAttribute("errorMessage", "Failed to add trek");
            }
        } else if ("update".equals(action)) {
            Trek trek = new Trek();
            trek.setTrekId(Integer.parseInt(req.getParameter("trekId")));
            trek.setTrekName(req.getParameter("trekName"));
            trek.setDifficulty(req.getParameter("difficulty"));
            trek.setDurationDays(Integer.parseInt(req.getParameter("durationDays")));
            trek.setPrice(new BigDecimal(req.getParameter("price")));
            trek.setMaxGroupSize(Integer.parseInt(req.getParameter("maxGroupSize")));
            trek.setRegion(req.getParameter("region"));
            trek.setStartLocation(req.getParameter("startLocation"));
            trek.setEndLocation(req.getParameter("endLocation"));
            trek.setDistanceKm(new BigDecimal(req.getParameter("distanceKm")));
            trek.setImageUrl(req.getParameter("imageUrl"));
            trek.setDescription(req.getParameter("description"));
            trek.setActive("on".equals(req.getParameter("isActive")));
            
            if (trekService.updateTrek(trek)) {
                req.setAttribute("successMessage", "Trek updated successfully!");
            } else {
                req.setAttribute("errorMessage", "Failed to update trek");
            }
        }
        
        req.setAttribute("treks", trekService.getAllTreks());
        req.getRequestDispatcher("/views/admin/manage-treks.jsp").forward(req, resp);
    }
}
package com.nepalhikehub.controller;

import com.nepalhikehub.dao.UserDAO;
import com.nepalhikehub.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin-access")
public class AdminAccessServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        // Directly create admin user in database and login
        UserDAO userDAO = new UserDAO();
        
        // First, check if admin exists
        User admin = userDAO.getUserByEmail("admin@nepalhikehub.com");
        
        if (admin == null) {
            // Create admin if doesn't exist
            // Using simple registration
            String result = userDAO.createAdminIfNotExists();
            admin = userDAO.getUserByEmail("admin@nepalhikehub.com");
        }
        
        if (admin != null) {
            // Force login
            HttpSession session = req.getSession();
            session.setAttribute("user", admin);
            session.setAttribute("admin_logged_in", true);
            
            // Redirect to admin dashboard
            resp.sendRedirect(req.getContextPath() + "/views/admin/dashboard.jsp");
        } else {
            resp.getWriter().println("Error: Could not create or find admin user");
        }
    }
}
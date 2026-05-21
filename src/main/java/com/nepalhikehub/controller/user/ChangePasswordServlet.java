package com.nepalhikehub.controller.user;

import com.nepalhikehub.dao.UserDAO;
import com.nepalhikehub.model.User;
import com.nepalhikehub.util.PasswordEncryption;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/change-password")
public class ChangePasswordServlet extends HttpServlet {
    
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        User currentUser = (User) session.getAttribute("user");
        
        if (currentUser == null) {
            resp.sendRedirect(req.getContextPath() + "/views/auth/signin.jsp");
            return;
        }
        
        String currentPassword = req.getParameter("currentPassword");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");
        
        // Validate new password
        if (newPassword == null || newPassword.length() < 6) {
            resp.sendRedirect(req.getContextPath() + "/views/user/change-password.jsp?error=Password must be at least 6 characters");
            return;
        }
        
        // Check if new password matches confirmation
        if (!newPassword.equals(confirmPassword)) {
            resp.sendRedirect(req.getContextPath() + "/views/user/change-password.jsp?error=New passwords do not match");
            return;
        }
        
        // Verify current password
        User user = userDAO.getUserById(currentUser.getUserId());
        if (user == null || !PasswordEncryption.verifyPassword(currentPassword, user.getPasswordHash())) {
            resp.sendRedirect(req.getContextPath() + "/views/user/change-password.jsp?error=Current password is incorrect");
            return;
        }
        
        // Update password
        String newHashedPassword = PasswordEncryption.hashPassword(newPassword);
        boolean updated = userDAO.updatePassword(currentUser.getUserId(), newHashedPassword);
        
        if (updated) {
            resp.sendRedirect(req.getContextPath() + "/views/user/change-password.jsp?success=Password changed successfully");
        } else {
            resp.sendRedirect(req.getContextPath() + "/views/user/change-password.jsp?error=Failed to update password");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        resp.sendRedirect(req.getContextPath() + "/views/user/change-password.jsp");
    }
}
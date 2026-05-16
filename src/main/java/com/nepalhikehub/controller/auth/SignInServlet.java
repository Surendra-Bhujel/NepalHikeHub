package com.nepalhikehub.controller.auth;

import com.nepalhikehub.model.User;
import com.nepalhikehub.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/signin")
public class SignInServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private UserService userService;
    
    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("user") != null) {
            resp.sendRedirect(req.getContextPath() + "/home.jsp");
            return;
        }
        
        req.getRequestDispatcher("/views/auth/signin.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String rememberMe = req.getParameter("rememberMe");
        
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Please enter both email and password");
            req.getRequestDispatcher("/views/auth/signin.jsp").forward(req, resp);
            return;
        }
        
        User user = userService.signIn(email, password);
        
        if (user != null && user.isApproved()) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(30 * 60);
            
            if (rememberMe != null && rememberMe.equals("on")) {
                Cookie emailCookie = new Cookie("remembered_email", email);
                emailCookie.setMaxAge(7 * 24 * 60 * 60);
                emailCookie.setPath(req.getContextPath());
                resp.addCookie(emailCookie);
            }
            
            if (user.getRoleId() == 1) {
                resp.sendRedirect(req.getContextPath() + "/views/admin/dashboard.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home.jsp");
            }
        } else {
            req.setAttribute("errorMessage", "Invalid email or password, or account pending approval");
            req.getRequestDispatcher("/views/auth/signin.jsp").forward(req, resp);
        }
    }
}
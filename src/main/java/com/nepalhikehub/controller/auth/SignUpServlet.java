package com.nepalhikehub.controller.auth;

import com.nepalhikehub.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private UserService userService;
    
    @Override
    public void init() throws ServletException {
        userService = new UserService();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/auth/signup.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String country = req.getParameter("country");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        
        if (name == null || name.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Please enter your full name");
            forwardWithData(req, resp, name, email, phone);
            return;
        }
        
        if (email == null || email.trim().isEmpty()) {
            req.setAttribute("errorMessage", "Please enter your email");
            forwardWithData(req, resp, name, email, phone);
            return;
        }
        
        if (password == null || password.length() < 6) {
            req.setAttribute("errorMessage", "Password must be at least 6 characters");
            forwardWithData(req, resp, name, email, phone);
            return;
        }
        
        if (!password.equals(confirmPassword)) {
            req.setAttribute("errorMessage", "Passwords do not match");
            forwardWithData(req, resp, name, email, phone);
            return;
        }
        
        String result = userService.registerUser(name, email, phone, password, confirmPassword);
        
        if ("SUCCESS".equals(result)) {
            resp.sendRedirect(req.getContextPath() + "/views/auth/signin.jsp?success=registered");
        } else {
            req.setAttribute("errorMessage", result);
            forwardWithData(req, resp, name, email, phone);
        }
    }
    
    private void forwardWithData(HttpServletRequest req, HttpServletResponse resp, 
                                  String name, String email, String phone) 
            throws ServletException, IOException {
        req.setAttribute("name", name);
        req.setAttribute("email", email);
        req.setAttribute("phone", phone);
        req.getRequestDispatcher("/views/auth/signup.jsp").forward(req, resp);
    }
}
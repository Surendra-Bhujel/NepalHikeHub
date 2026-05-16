package com.nepalhikehub.controller.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/signout")
public class SignOutServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("remembered_email".equals(cookie.getName())) {
                    cookie.setMaxAge(0);
                    cookie.setPath(req.getContextPath());
                    resp.addCookie(cookie);
                    break;
                }
            }
        }
        
        resp.sendRedirect(req.getContextPath() + "/home.jsp");
    }
}
package com.nepalhikehub.controller.admin;

import com.nepalhikehub.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/approve-user")
public class ApproveUserServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String id = req.getParameter("id");
        if (id != null) {
            UserDAO userDAO = new UserDAO();
            userDAO.approveUser(Integer.parseInt(id));
        }
        resp.sendRedirect(req.getContextPath() + "/admin/users");
    }
}
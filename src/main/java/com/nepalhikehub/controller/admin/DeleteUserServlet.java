package com.nepalhikehub.controller.admin;

import com.nepalhikehub.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/delete-user")
public class DeleteUserServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String id = req.getParameter("id");
        if (id != null) {
            UserDAO userDAO = new UserDAO();
            userDAO.deleteUser(Integer.parseInt(id));
        }
        resp.sendRedirect(req.getContextPath() + "/views/admin/manage-users.jsp");
    }
}
package com.nepalhikehub.controller.admin;

import com.nepalhikehub.dao.UserDAO;
import com.nepalhikehub.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/manage-users")
public class ManageUsersServlet extends HttpServlet {
    
    private UserDAO userDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String action = req.getParameter("action");
        
        if ("approve".equals(action)) {
            int userId = Integer.parseInt(req.getParameter("id"));
            userDAO.approveUser(userId);
            resp.sendRedirect(req.getContextPath() + "/admin/manage-users");
        } else if ("delete".equals(action)) {
            int userId = Integer.parseInt(req.getParameter("id"));
            userDAO.deleteUser(userId);
            resp.sendRedirect(req.getContextPath() + "/admin/manage-users");
        } else {
            List<User> pendingUsers = userDAO.getPendingUsers();
            List<User> allUsers = userDAO.getAllUsers();
            req.setAttribute("pendingUsers", pendingUsers);
            req.setAttribute("allUsers", allUsers);
            req.getRequestDispatcher("/views/admin/manage-users.jsp").forward(req, resp);
        }
    }
}
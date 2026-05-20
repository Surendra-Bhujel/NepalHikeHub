package com.nepalhikehub.controller.admin;

import com.nepalhikehub.dao.BookingDAO;
import com.nepalhikehub.dao.TrekDAO;
import com.nepalhikehub.dao.UserDAO;
import com.nepalhikehub.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/dashboard")
public class AdminDashboardServlet extends HttpServlet {
    
    private UserDAO userDAO;
    private TrekDAO trekDAO;
    private BookingDAO bookingDAO;
    
    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
        trekDAO = new TrekDAO();
        bookingDAO = new BookingDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        
        if (user == null || user.getRoleId() != 1) {
            resp.sendRedirect(req.getContextPath() + "/admin/admin-login.jsp");
            return;
        }
        
        // Get statistics for dashboard
        req.setAttribute("totalUsers", userDAO.getAllUsers().size());
        req.setAttribute("pendingUsers", userDAO.getPendingUsers().size());
        req.setAttribute("totalTreks", trekDAO.getAllTreks().size());
        req.setAttribute("totalBookings", bookingDAO.getAllBookings().size());
        
        req.getRequestDispatcher("/views/admin/dashboard.jsp").forward(req, resp);
    }
}
package com.nepalhikehub.controller.admin;

import com.nepalhikehub.dao.BookingDAO;
import com.nepalhikehub.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/admin/update-booking")
public class UpdateBookingServlet extends HttpServlet {
    
    private BookingDAO bookingDAO;
    
    @Override
    public void init() throws ServletException {
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
        
        String bookingId = req.getParameter("bookingId");
        String status = req.getParameter("status");
        
        if (bookingId != null && status != null) {
            int id = Integer.parseInt(bookingId);
            
            if ("confirmed".equals(status)) {
                bookingDAO.confirmBooking(id);
            } else if ("cancelled".equals(status)) {
                bookingDAO.cancelBooking(id);
            }
        }
        
        // Redirect back to manage bookings page
        resp.sendRedirect(req.getContextPath() + "/views/admin/manage-bookings.jsp");
    }
}
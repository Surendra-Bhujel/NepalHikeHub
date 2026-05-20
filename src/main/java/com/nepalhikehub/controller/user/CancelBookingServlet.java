package com.nepalhikehub.controller.user;

import com.nepalhikehub.dao.BookingDAO;
import com.nepalhikehub.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/cancel-booking")
public class CancelBookingServlet extends HttpServlet {
    
    private BookingDAO bookingDAO;
    
    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/views/auth/signin.jsp");
            return;
        }
        
        String bookingIdParam = req.getParameter("bookingId");
        
        if (bookingIdParam != null && !bookingIdParam.isEmpty()) {
            int bookingId = Integer.parseInt(bookingIdParam);
            boolean cancelled = bookingDAO.cancelBooking(bookingId);
            
            if (cancelled) {
                session.setAttribute("successMessage", "Booking cancelled successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to cancel booking.");
            }
        }
        
        resp.sendRedirect(req.getContextPath() + "/views/user/my-bookings.jsp");
    }
}
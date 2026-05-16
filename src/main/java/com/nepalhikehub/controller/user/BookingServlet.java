package com.nepalhikehub.controller.user;

import com.nepalhikehub.dao.BookingDAO;
import com.nepalhikehub.dao.PaymentDAO;
import com.nepalhikehub.dao.TrekDAO;
import com.nepalhikehub.model.Booking;
import com.nepalhikehub.model.Payment;
import com.nepalhikehub.model.Trek;
import com.nepalhikehub.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

@WebServlet("/user/booking")
public class BookingServlet extends HttpServlet {
    
    private BookingDAO bookingDAO;
    private TrekDAO trekDAO;
    private PaymentDAO paymentDAO;
    
    @Override
    public void init() throws ServletException {
        bookingDAO = new BookingDAO();
        trekDAO = new TrekDAO();
        paymentDAO = new PaymentDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/signin");
            return;
        }
        
        String trekIdParam = req.getParameter("trekId");
        if (trekIdParam != null && !trekIdParam.isEmpty()) {
            int trekId = Integer.parseInt(trekIdParam);
            Trek trek = trekDAO.getTrekById(trekId);
            req.setAttribute("trek", trek);
        }
        
        req.getRequestDispatcher("/views/user/booking.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/signin");
            return;
        }
        
        int trekId = Integer.parseInt(req.getParameter("trekId"));
        Date trekStartDate = Date.valueOf(req.getParameter("trekStartDate"));
        int numPersons = Integer.parseInt(req.getParameter("numPersons"));
        String specialRequests = req.getParameter("specialRequests");
        String paymentMethod = req.getParameter("paymentMethod");
        
        Trek trek = trekDAO.getTrekById(trekId);
        BigDecimal totalAmount = trek.getPrice().multiply(new BigDecimal(numPersons));
        
        // Create booking
        Booking booking = new Booking();
        booking.setUserId(user.getUserId());
        booking.setTrekId(trekId);
        booking.setBookingDate(new Date(System.currentTimeMillis()));
        booking.setTrekStartDate(trekStartDate);
        booking.setNumPersons(numPersons);
        booking.setSpecialRequests(specialRequests);
        booking.setStatus("pending");
        
        if (bookingDAO.createBooking(booking)) {
            // Create payment record
            Payment payment = new Payment();
            payment.setBookingId(booking.getBookingId());
            payment.setAmount(totalAmount);
            payment.setPaymentMethod(paymentMethod);
            payment.setPaymentStatus("pending");
            payment.setPaymentDate(new Date(System.currentTimeMillis()));
            payment.setTransactionRef("TXN-" + System.currentTimeMillis());
            paymentDAO.createPayment(payment);
            
            req.setAttribute("successMessage", "Booking request submitted successfully! Please complete payment to confirm.");
            req.setAttribute("booking", booking);
            req.setAttribute("trek", trek);
            req.setAttribute("totalAmount", totalAmount);
            req.getRequestDispatcher("/views/user/booking-confirmation.jsp").forward(req, resp);
        } else {
            req.setAttribute("errorMessage", "Failed to create booking. Please try again.");
            req.getRequestDispatcher("/views/user/booking.jsp").forward(req, resp);
        }
    }
}
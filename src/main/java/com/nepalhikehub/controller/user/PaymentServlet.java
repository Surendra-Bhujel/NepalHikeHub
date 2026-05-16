package com.nepalhikehub.controller.user;

import com.nepalhikehub.model.User;
import com.nepalhikehub.service.PaymentService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/payment")
public class PaymentServlet extends HttpServlet {
    
    private PaymentService paymentService;
    
    @Override
    public void init() throws ServletException {
        paymentService = new PaymentService();
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
        
        int bookingId = Integer.parseInt(req.getParameter("bookingId"));
        String paymentMethod = req.getParameter("paymentMethod");
        String transactionRef = req.getParameter("transactionRef");
        
        if (paymentService.processPayment(bookingId, paymentMethod, transactionRef)) {
            req.setAttribute("successMessage", "Payment successful! Your booking is now confirmed.");
        } else {
            req.setAttribute("errorMessage", "Payment failed. Please try again.");
        }
        
        resp.sendRedirect(req.getContextPath() + "/views/user/bookings.jsp");
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
        
        int bookingId = Integer.parseInt(req.getParameter("bookingId"));
        req.setAttribute("bookingId", bookingId);
        req.getRequestDispatcher("/views/user/payment.jsp").forward(req, resp);
    }
}
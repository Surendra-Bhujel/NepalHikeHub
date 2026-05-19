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

        // CHANGE: getSession(false) — never create a session for unauthenticated users
        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/signin");
            return;
        }

        // Pre-select trek if trekId passed in URL e.g. from "View Details →" button
        // Usage: /user/booking?trekId=3
        String trekIdParam = req.getParameter("trekId");
        if (trekIdParam != null && !trekIdParam.isEmpty()) {
            try {
                int trekId = Integer.parseInt(trekIdParam);
                Trek trek = trekDAO.getTrekById(trekId);
                if (trek != null) {
                    req.setAttribute("trek", trek); // picked up by booking.jsp to pre-select dropdown
                }
            } catch (NumberFormatException e) {
                // Bad trekId in URL — just ignore and show empty form
            }
        }

       req.getRequestDispatcher("/views/booking.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/signin");
            return;
        }

     
        try {
            String trekIdParam    = req.getParameter("trekId");          
            String dateParam      = req.getParameter("trekStartDate");    
            String personsParam   = req.getParameter("numPersons");       
            String specialReqs    = req.getParameter("specialRequests");  
            String paymentMethod  = req.getParameter("paymentMethod");    


            if (trekIdParam == null || trekIdParam.isEmpty() ||
                dateParam == null || dateParam.isEmpty() ||
                personsParam == null || personsParam.isEmpty() ||
                paymentMethod == null || paymentMethod.isEmpty()) {

                req.setAttribute("errorMessage", "Please fill in all required fields.");
                req.getRequestDispatcher("/views/booking.jsp").forward(req, resp);
                return;
            }

            int trekId          = Integer.parseInt(trekIdParam);
            Date trekStartDate  = Date.valueOf(dateParam);
            int numPersons      = Integer.parseInt(personsParam);

          
            Trek trek = trekDAO.getTrekById(trekId);
            if (trek == null) {
                req.setAttribute("errorMessage",
                    "Selected trek was not found. Please choose a valid trek from the list.");
                req.getRequestDispatcher("/views/booking.jsp").forward(req, resp);
                return;
            }

            BigDecimal totalAmount = trek.getPrice().multiply(new BigDecimal(numPersons));

            Booking booking = new Booking();
            booking.setUserId(user.getUserId());
            booking.setTrekId(trekId);
            booking.setBookingDate(new Date(System.currentTimeMillis()));
            booking.setTrekStartDate(trekStartDate);
            booking.setNumPersons(numPersons);
            booking.setSpecialRequests(specialReqs);
            booking.setStatus("pending");

            if (bookingDAO.createBooking(booking)) {
               

                Payment payment = new Payment();
                payment.setBookingId(booking.getBookingId());
                payment.setAmount(totalAmount);
                payment.setPaymentMethod(paymentMethod);
                payment.setPaymentStatus("pending");
                payment.setPaymentDate(new Date(System.currentTimeMillis()));
                payment.setTransactionRef("TXN-" + System.currentTimeMillis());
                paymentDAO.createPayment(payment);

                req.setAttribute("successMessage",
                    "Booking request submitted successfully! Our team will contact you within 24 hours.");
                req.setAttribute("booking", booking);
                req.setAttribute("trek", trek);
                req.setAttribute("totalAmount", totalAmount);

                req.getRequestDispatcher("/views/user/booking-confirmation.jsp").forward(req, resp);

            } else {
                req.setAttribute("errorMessage",
                    "Failed to create booking. Please try again or contact support.");
                req.getRequestDispatcher("/views/booking.jsp").forward(req, resp);
            }

        } catch (IllegalArgumentException e) {
            System.err.println("BookingServlet - Invalid input: " + e.getMessage());
            req.setAttribute("errorMessage",
                "Invalid input: " + e.getMessage() + ". Please check your entries and try again.");
            req.getRequestDispatcher("/views/booking.jsp").forward(req, resp);

        } catch (Exception e) {
            System.err.println("BookingServlet - Unexpected error: " + e.getMessage());
            e.printStackTrace();
            req.setAttribute("errorMessage",
                "An unexpected error occurred. Please try again later.");
            req.getRequestDispatcher("/views/booking.jsp").forward(req, resp);
        }
    }
}
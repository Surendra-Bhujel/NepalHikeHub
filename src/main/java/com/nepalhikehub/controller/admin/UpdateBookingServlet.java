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

@WebServlet("/admin/update-booking")   // Fixed URL to match sidebar links
public class UpdateBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null || user.getRoleId() != 1) {
            response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
            return;
        }

        String bookingIdParam = request.getParameter("bookingId");
        String status = request.getParameter("status");

        if (bookingIdParam != null && status != null) {
            int bookingId = Integer.parseInt(bookingIdParam);
            BookingDAO bookingDAO = new BookingDAO();
            bookingDAO.updateBookingStatus(bookingId, status);
        }

        response.sendRedirect(request.getContextPath() + "/admin/manage-bookings");
    }
}
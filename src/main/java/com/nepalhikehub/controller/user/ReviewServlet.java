package com.nepalhikehub.controller.user;

import com.nepalhikehub.model.User;
import com.nepalhikehub.service.ReviewService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user/review")
public class ReviewServlet extends HttpServlet {
    
    private ReviewService reviewService;
    
    @Override
    public void init() throws ServletException {
        reviewService = new ReviewService();
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
        
        String action = req.getParameter("action");
        
        if ("add".equals(action)) {
            int trekId = Integer.parseInt(req.getParameter("trekId"));
            int bookingId = Integer.parseInt(req.getParameter("bookingId"));
            int rating = Integer.parseInt(req.getParameter("rating"));
            String comment = req.getParameter("comment");
            
            boolean success = reviewService.addReview(user.getUserId(), trekId, bookingId, rating, comment);
            
            if (success) {
                session.setAttribute("successMessage", "Thank you for your review!");
            } else {
                session.setAttribute("errorMessage", "Unable to submit review. You may have already reviewed this trek.");
            }
            
            resp.sendRedirect(req.getContextPath() + "/views/user/treks.jsp?trekId=" + trekId);
        } else if ("delete".equals(action)) {
            int reviewId = Integer.parseInt(req.getParameter("reviewId"));
            
            if (reviewService.deleteReview(reviewId)) {
                session.setAttribute("successMessage", "Review deleted successfully!");
            } else {
                session.setAttribute("errorMessage", "Failed to delete review.");
            }
            
            resp.sendRedirect(req.getContextPath() + "/views/user/profile.jsp");
        }
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
        String bookingIdParam = req.getParameter("bookingId");
        
        if (trekIdParam != null && bookingIdParam != null) {
            req.setAttribute("trekId", Integer.parseInt(trekIdParam));
            req.setAttribute("bookingId", Integer.parseInt(bookingIdParam));
            req.getRequestDispatcher("/views/user/add-review.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/views/user/dashboard.jsp");
        }
    }
}
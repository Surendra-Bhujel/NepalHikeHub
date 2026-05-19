package com.nepalhikehub.controller.filter;

import com.nepalhikehub.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AuthenticationFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest  req = (HttpServletRequest)  request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session    = req.getSession(false); // never create sessions for guests
        String      requestURI = req.getRequestURI();

        // =================================================================
        // PUBLIC ROUTES — no login needed, pass straight through
        // =================================================================
        if (
            // Auth pages
            requestURI.contains("/signup")               ||
            requestURI.contains("/signin")               ||
            requestURI.contains("/signout")              ||

            // Static resources
            requestURI.contains("/css/")                 ||
            requestURI.contains("/js/")                  ||
            requestURI.contains("/image/")               ||  // your folder is /image/
            requestURI.contains("/images/")              ||  // kept for safety

            // Public JSP views
            requestURI.contains("/views/auth/")          ||
            requestURI.contains("/views/error/")         ||
            requestURI.contains("/views/trekking")       ||  // Trekking in Nepal page
            requestURI.contains("/views/peak-climbing")  ||  // Peak Climbing page
            requestURI.contains("/views/blog")           ||  // Blog page
            requestURI.contains("/views/about")          ||  // About page
            requestURI.contains("/views/contact")        ||  // Contact page
            requestURI.contains("/views/trek-detail")    ||  // Trek detail page (new)

            // Public servlets
            requestURI.contains("/trek/detail")          ||  // TrekDetailServlet (new)
            requestURI.contains("/about")                ||
            requestURI.contains("/contact")              ||
            requestURI.contains("/pending-approval")     ||

            // Home / index
            requestURI.endsWith("/home.jsp")             ||
            requestURI.endsWith("/index.jsp")            ||
            requestURI.endsWith("/")                     ||
            requestURI.endsWith("/index")
        ) {
            chain.doFilter(request, response);
            return;
        }

        // =================================================================
        // PROTECTED ROUTES — login required from here on
        // Includes: /views/booking.jsp, /user/booking,
        //           /views/user/*, /admin/*
        // =================================================================
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/signin");
            return;
        }

        // Admin-only protection: /admin/* requires roleId == 1
        if (requestURI.contains("/admin/") && user.getRoleId() != 1) {
            res.sendRedirect(req.getContextPath() + "/views/user/dashboard.jsp");
            return;
        }

        // Unapproved user: can only see the pending-approval page
        if (!user.isApproved() && !requestURI.contains("/pending-approval")) {
            res.sendRedirect(req.getContextPath() + "/views/auth/pending-approval.jsp");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("AuthenticationFilter destroyed");
    }
}

package com.nepalhikehub.controller.filter;

import com.nepalhikehub.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Authentication Filter Initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        String requestURI = req.getRequestURI();

        // Allow all public resources
        if (requestURI.contains("/signup") ||
            requestURI.contains("/signin") ||
            requestURI.contains("/signout") ||
            requestURI.contains("/about") ||
            requestURI.contains("/contact") ||
            requestURI.contains("/css/") ||
            requestURI.contains("/js/") ||
            requestURI.contains("/images/") ||
            requestURI.contains("/views/auth/") ||
            requestURI.contains("/views/error/") ||
            requestURI.contains("/pending-approval") ||
            requestURI.endsWith("/home.jsp") ||
            requestURI.endsWith("/index.jsp") ||
            requestURI.endsWith("/") ||
            requestURI.endsWith("/index")) {
            chain.doFilter(request, response);
            return;
        }

        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("user");
        }

        if (user == null) {
            res.sendRedirect(req.getContextPath() + "/signin");
            return;
        }

        if (requestURI.contains("/admin/") && user.getRoleId() != 1) {
            res.sendRedirect(req.getContextPath() + "/views/user/home.jsp");
            return;
        }

        if (!user.isApproved() && !requestURI.contains("/pending-approval")) {
            res.sendRedirect(req.getContextPath() + "/views/auth/pending-approval.jsp");
            return;
        }

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        System.out.println("Authentication Filter Destroyed");
    }
}
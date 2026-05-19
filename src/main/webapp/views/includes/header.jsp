<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    HttpSession currentSession = request.getSession(false);
    User currentUser = (currentSession != null) ? (User) currentSession.getAttribute("user") : null;
    String contextPath = request.getContextPath();
    String requestURI = request.getRequestURI();
    
    boolean isHome = requestURI.contains("home.jsp") || requestURI.equals(contextPath + "/");
    boolean isTrekking = requestURI.contains("trekking.jsp");
    boolean isPeakClimbing = requestURI.contains("peak-climbing.jsp");
    boolean isBooking = requestURI.contains("booking.jsp");
    boolean isBlog = requestURI.contains("blog.jsp");
    boolean isAbout = requestURI.contains("about.jsp");
    boolean isContact = requestURI.contains("contact.jsp");
    
    // Debug: Print role_id to console (remove after testing)
    if (currentUser != null) {
        System.out.println("User: " + currentUser.getEmail() + " | Role ID: " + currentUser.getRoleId());
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NepalHikeHub - Your Trekking Companion</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/home.jsp">Nepal<span>HikeHub</span></a>
            </div>
            <div class="menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </div>
            <ul class="nav-menu" id="navMenu">
                <li><a href="${pageContext.request.contextPath}/home.jsp" class="<%= isHome ? "active" : "" %>">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/views/trekking.jsp" class="<%= isTrekking ? "active" : "" %>">Trekking in Nepal</a></li>
                <li><a href="${pageContext.request.contextPath}/views/peak-climbing.jsp" class="<%= isPeakClimbing ? "active" : "" %>">Peak Climbing</a></li>
                <li><a href="${pageContext.request.contextPath}/views/booking.jsp" class="<%= isBooking ? "active" : "" %>">Booking</a></li>
                <li><a href="${pageContext.request.contextPath}/views/blog.jsp" class="<%= isBlog ? "active" : "" %>">Blog</a></li>
                <li><a href="${pageContext.request.contextPath}/views/about.jsp" class="<%= isAbout ? "active" : "" %>">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/views/contact.jsp" class="<%= isContact ? "active" : "" %>">Contact Us</a></li>
            </ul>
            <div class="auth-buttons">
                <% if (currentUser != null) { %>
                    <div class="user-menu">
                        <div class="user-avatar"><%= currentUser.getName().charAt(0) %></div>
                        <span><%= currentUser.getName().split(" ")[0] %></span>
                        <%-- ADMIN BUTTON - Check if role_id is 1 --%>
                        <% if (currentUser.getRoleId() == 1) { %>
                            <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="btn-admin" style="background: #dc3545; color: white; padding: 5px 12px; border-radius: 20px; text-decoration: none; margin-left: 8px;">
                                <i class="fas fa-crown"></i> Admin
                            </a>
                        <% } %>
                        <a href="${pageContext.request.contextPath}/signout" class="btn-signout">Sign Out</a>
                    </div>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/views/auth/signin.jsp" class="btn-signin">Sign In</a>
                    <a href="${pageContext.request.contextPath}/views/auth/signup.jsp" class="btn-signup">Sign Up</a>
                <% } %>
            </div>
        </div>
    </nav>
    
    <script>
        // Mobile menu toggle
        const menuToggle = document.getElementById('menuToggle');
        const navMenu = document.getElementById('navMenu');
        if (menuToggle) {
            menuToggle.addEventListener('click', function() {
                navMenu.classList.toggle('active');
            });
        }
    </script>
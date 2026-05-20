<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    HttpSession sessionObj = request.getSession(false);
    User currentUser = (sessionObj != null) ? (User) sessionObj.getAttribute("user") : null;
    String contextPath = request.getContextPath();
    String requestURI = request.getRequestURI();
    
    boolean isHome = requestURI.contains("home.jsp") || requestURI.equals(contextPath + "/");
    boolean isTrekking = requestURI.contains("trekking.jsp");
    boolean isPeakClimbing = requestURI.contains("peak-climbing.jsp");
    boolean isBooking = requestURI.contains("booking.jsp");
    boolean isBlog = requestURI.contains("blog.jsp");
    boolean isAbout = requestURI.contains("about.jsp");
    boolean isContact = requestURI.contains("contact.jsp");
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
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
                
                <!-- DROPDOWN MENU - Trekking in Nepal (CLICKABLE LINK) -->
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="dropbtn <%= isTrekking ? "active" : "" %>">
                        Trekking in Nepal <i class="fas fa-caret-down"></i>
                    </a>
                    <div class="dropdown-content">
                        <div class="dropdown-inner">
                            <div class="dropdown-column">
                                <h3>Annapurna Region Trekking</h3>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Annapurna&trek=abc">Annapurna Base Camp Trek – 14 Day</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Annapurna&trek=abc-short">ABC Trek from Pokhara – 6 Days</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Annapurna&trek=mardi">Mardi Himal Trek – 9 Days</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Annapurna&trek=poonhill">Ghorepani Poon Hill Trek - 8 Days</a>
                            </div>
                            <div class="dropdown-column">
                                <h3>Everest Region Trek</h3>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Everest&trek=ebc">Everest Base Camp Trek – 14 Days</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Everest&trek=ebc-sleep">Sleep at Base Camp on Everest Trek – 15 Days</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Everest&trek=three-passes">Three Highest Passes Trek by Road – 19 Days</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Everest&trek=gokyo">Gokyo Valley Circuit Trek – 13 Days</a>
                            </div>
                            <div class="dropdown-column">
                                <h3>Langtang Region Trekking</h3>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Langtang&trek=valley">Langtang Valley Trek – 10 Days</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Langtang&trek=ama-yangri">Ama Yangri Trek – 3 Days</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Langtang&trek=gosaikunda">Gosaikunda Lake Trek – 7 Days</a>
                                <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Langtang&trek=ganja-la">Langtang Ganja La Pass Trek - 14 days</a>
                            </div>
                        </div>
                    </div>
                </li>
                
                <li><a href="${pageContext.request.contextPath}/views/peak-climbing.jsp" class="<%= isPeakClimbing ? "active" : "" %>">Peak Climbing</a></li>
                <li><a href="${pageContext.request.contextPath}/views/booking.jsp" class="<%= isBooking ? "active" : "" %>">Booking</a></li>
                <li><a href="${pageContext.request.contextPath}/views/blog.jsp" class="<%= isBlog ? "active" : "" %>">Blog</a></li>
                <li><a href="${pageContext.request.contextPath}/views/about.jsp" class="<%= isAbout ? "active" : "" %>">About Us</a></li>
                <li><a href="${pageContext.request.contextPath}/views/contact.jsp" class="<%= isContact ? "active" : "" %>">Contact Us</a></li>
            </ul>
            <div class="auth-buttons">
                <% if (currentUser != null) { %>
                    <div class="user-menu">
                        <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp" class="user-profile-link">
                            <div class="user-avatar"><%= currentUser.getName().charAt(0) %></div>
                            <span class="user-name"><%= currentUser.getName().split(" ")[0] %></span>
                        </a>
                        <% if (currentUser.getRoleId() == 1) { %>
                            <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="btn-admin">Admin</a>
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
        
        // Mobile dropdown toggle (for touch devices)
        const dropdowns = document.querySelectorAll('.dropdown');
        dropdowns.forEach(function(dropdown) {
            const dropbtn = dropdown.querySelector('.dropbtn');
            if (dropbtn) {
                dropbtn.addEventListener('click', function(e) {
                    // Only prevent default on mobile for the dropdown toggle
                    // But allow the link to work normally
                    if (window.innerWidth <= 992) {
                        e.preventDefault();
                        dropdown.classList.toggle('open');
                    }
                });
            }
        });
        
        // Close dropdown when clicking outside (for mobile)
        document.addEventListener('click', function(event) {
            if (window.innerWidth <= 992) {
                dropdowns.forEach(function(dropdown) {
                    if (!dropdown.contains(event.target)) {
                        dropdown.classList.remove('open');
                    }
                });
            }
        });
    </script>
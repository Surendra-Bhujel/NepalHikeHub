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
                
                <li class="dropdown">
                    <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="dropbtn <%= isTrekking ? "active" : "" %>">
                        Trekking in Nepal <i class="fas fa-caret-down"></i>
                    </a>
                    <div class="dropdown-content">
                        <div class="dropdown-inner">
                            <div class="dropdown-column">
                                <h3>Annapurna Region Trekking</h3>
                                <a href="${pageContext.request.contextPath}/views/Annapuran Base Camp Trek.jsp">Annapurna Base Camp Trek – 14 Day</a>
                                <a href="${pageContext.request.contextPath}/views/Annapurna Circuit with Poon Hill.jsp">Annapurna Circuit with Poon Hill – 16 Days</a>
                                <a href="${pageContext.request.contextPath}/views/MardiHimalTrek.jsp">Mardi Himal Trek – 9 Days</a>
                                <a href="${pageContext.request.contextPath}/views/Ghorepani.jsp">Ghorepani Poon Hill Trek - 8 Days</a>
                            </div>
                            <div class="dropdown-column">
                                <h3>Everest Region Trek</h3>
                                <a href="${pageContext.request.contextPath}/views/Everest Base Camp.jsp">Everest Base Camp Trek – 14 Days</a>
                                <a href="${pageContext.request.contextPath}/views/Sleep at Base Camp.jsp">Sleep at Base Camp on Everest Trek – 15 Days</a>
                                <a href="${pageContext.request.contextPath}/views/ThreePassesRoadTrek.jsp">Three Highest Passes Trek – 19 Days</a>
                                <a href="${pageContext.request.contextPath}/views/GokyoValleyTrek.jsp">Gokyo Valley Circuit Trek – 13 Days</a>
                            </div>
                            <div class="dropdown-column">
                                <h3>Langtang Region Trekking</h3>
                                <a href="${pageContext.request.contextPath}/views/LangtangValleyTrek.jsp">Langtang Valley Trek – 10 Days</a>
                                <a href="${pageContext.request.contextPath}/views/AmaYangriTrek.jsp">Ama Yangri Trek – 3 Days</a>
                                <a href="${pageContext.request.contextPath}/views/GosaikundaLakeTrek.jsp">Gosaikunda Lake Trek – 7 Days</a>
                                <a href="${pageContext.request.contextPath}/views/LangtangGanjaLaTrek.jsp">Langtang Ganja La Pass Trek - 14 days</a>
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
        const menuToggle = document.getElementById('menuToggle');
        const navMenu = document.getElementById('navMenu');
        if (menuToggle) {
            menuToggle.addEventListener('click', function() {
                navMenu.classList.toggle('active');
            });
        }
        
        const dropdowns = document.querySelectorAll('.dropdown');
        dropdowns.forEach(function(dropdown) {
            const dropbtn = dropdown.querySelector('.dropbtn');
            if (dropbtn) {
                dropbtn.addEventListener('click', function(e) {
                    if (window.innerWidth <= 992) {
                        e.preventDefault();
                        dropdown.classList.toggle('open');
                    }
                });
            }
        });
    </script>
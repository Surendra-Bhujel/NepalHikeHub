<%@ page import="com.nepalhikehub.model.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - NepalHikeHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-brand">
                <a href="#">🏔️ NepalHikeHub</a>
            </div>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/views/user/home.jsp" class="nav-link active">Home</a>
                <a href="${pageContext.request.contextPath}/treks" class="nav-link">Treks</a>
                <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp" class="nav-link">My Bookings</a>
                <a href="${pageContext.request.contextPath}/signout" class="nav-link">Sign Out</a>
            </div>
        </div>
    </nav>

    <main class="container">
        <h1>Welcome, <%= user.getName() %>! 🏔️</h1>
        <p>Explore the best trekking routes in Nepal.</p>

        <div class="stats-grid">
            <div class="stat-card">
                <h3>Browse Treks</h3>
                <p>Find your next adventure</p>
                <a href="${pageContext.request.contextPath}/treks" class="btn">Explore</a>
            </div>
            <div class="stat-card">
                <h3>My Bookings</h3>
                <p>View your booked treks</p>
                <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp" class="btn">View</a>
            </div>
        </div>
    </main>
</body>
</html>
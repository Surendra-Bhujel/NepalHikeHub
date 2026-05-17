<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.UserDAO" %>
<%@ page import="com.nepalhikehub.dao.TrekDAO" %>
<%@ page import="com.nepalhikehub.dao.BookingDAO" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    UserDAO userDAO = new UserDAO();
    TrekDAO trekDAO = new TrekDAO();
    BookingDAO bookingDAO = new BookingDAO();
    
    int totalUsers = userDAO.getAllUsers().size();
    int pendingUsers = userDAO.getPendingUsers().size();
    int totalTreks = trekDAO.getAllTreks().size();
    int totalBookings = bookingDAO.getAllBookings().size();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - NepalHikeHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body>
    <div class="admin-nav">
        <div class="logo">Nepal<span>HikeHub</span> <span class="admin-badge">Admin Panel</span></div>
        <div>
            <span>Welcome, <%= currentUser.getName() %></span>
            <a href="${pageContext.request.contextPath}/home.jsp">View Site</a>
            <a href="${pageContext.request.contextPath}/signout">Logout</a>
        </div>
    </div>
    
    <div class="admin-container">
        <div class="sidebar">
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/treks"><i class="fas fa-hiking"></i> Manage Treks</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/users"><i class="fas fa-users"></i> Manage Users</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/bookings"><i class="fas fa-calendar-check"></i> Bookings</a></li>
            </ul>
        </div>
        
        <div class="main-content">
            <h2>Dashboard</h2>
            <div class="stats-grid">
                <div class="stat-card"><h3><%= totalUsers %></h3><p>Total Users</p></div>
                <div class="stat-card"><h3><%= pendingUsers %></h3><p>Pending Approval</p></div>
                <div class="stat-card"><h3><%= totalTreks %></h3><p>Total Treks</p></div>
                <div class="stat-card"><h3><%= totalBookings %></h3><p>Total Bookings</p></div>
            </div>
        </div>
    </div>
</body>
</html>
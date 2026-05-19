<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.BookingDAO" %>
<%@ page import="com.nepalhikehub.model.Booking" %>
<%@ page import="java.util.List" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
<<<<<<< HEAD
=======
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - NepalHikeHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/global.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-brand">
                <a href="#">🏔️ NepalHikeHub</a>
            </div>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp" class="nav-link active">Home</a>
                <a href="${pageContext.request.contextPath}/views/user/treks.jsp" class="nav-link">Treks</a>
                <a href="${pageContext.request.contextPath}/views/user/bookings.jsp" class="nav-link">My Bookings</a>
                <a href="${pageContext.request.contextPath}/views/user/profile.jsp" class="nav-link">Profile</a>
                <a href="${pageContext.request.contextPath}/signout" class="nav-link btn-signout">Sign Out</a>
            </div>
            <div class="user-greeting">
                Welcome, <%= user.getName() %>!
            </div>
        </div>
    </nav>
>>>>>>> 14e93e7da7ce7c9dd1d85f75ef878ded4b5358c1
    
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> myBookings = bookingDAO.getBookingsByUserId(currentUser.getUserId());
    
    // Calculate stats
    int totalBookings = myBookings != null ? myBookings.size() : 0;
    int confirmedBookings = 0;
    int pendingBookings = 0;
    if (myBookings != null) {
        for (Booking b : myBookings) {
            if ("confirmed".equals(b.getStatus())) confirmedBookings++;
            else if ("pending".equals(b.getStatus())) pendingBookings++;
        }
    }
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Dashboard</div>
            <h1>My Dashboard</h1>
        </div>
    </div>
    
    <div class="dashboard-container">
        <!-- Welcome Section -->
        <div class="welcome-card">
            <div class="welcome-avatar">
                <i class="fas fa-user-circle"></i>
            </div>
            <div class="welcome-text">
                <h2>Welcome, <%= currentUser.getName() %>!</h2>
                <p>Your adventure awaits. Manage your bookings and profile from here.</p>
            </div>
        </div>
        
        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <i class="fas fa-ticket-alt"></i>
                <h3><%= totalBookings %></h3>
                <p>Total Bookings</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h3><%= confirmedBookings %></h3>
                <p>Confirmed</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-clock"></i>
                <h3><%= pendingBookings %></h3>
                <p>Pending</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-heart"></i>
                <h3>0</h3>
                <p>Wishlist</p>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="quick-actions">
            <h3>Quick Actions</h3>
            <div class="action-buttons">
                <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="action-btn">
                    <i class="fas fa-hiking"></i> Browse Treks
                </a>
                <a href="${pageContext.request.contextPath}/views/user/my-bookings.jsp" class="action-btn">
                    <i class="fas fa-calendar"></i> My Bookings
                </a>
                <a href="${pageContext.request.contextPath}/views/user/profile.jsp" class="action-btn">
                    <i class="fas fa-user"></i> Update Profile
                </a>
                <a href="${pageContext.request.contextPath}/views/user/wishlist.jsp" class="action-btn">
                    <i class="fas fa-heart"></i> Wishlist
                </a>
            </div>
        </div>
        
        <!-- Recent Bookings -->
        <div class="recent-bookings">
            <h3>Recent Bookings</h3>
            <% if (myBookings == null || myBookings.isEmpty()) { %>
                <div class="empty-state">
                    <i class="fas fa-mountain"></i>
                    <p>You haven't made any bookings yet.</p>
                    <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-primary">Book Your First Trek</a>
                </div>
            <% } else { %>
                <table class="booking-table">
                    <thead>
                        <tr><th>Trek Name</th><th>Start Date</th><th>Travelers</th><th>Total Amount</th><th>Status</th><th>Action</th></tr>
                    </thead>
                    <tbody>
                        <% 
                            int count = 0;
                            for (Booking b : myBookings) {
                                if(count++ >= 5) break;
                        %>
                        <tr>
                            <td><%= b.getTrekName() != null ? b.getTrekName() : "Trek" %></td>
                            <td><%= b.getTrekStartDate() != null ? b.getTrekStartDate() : "TBD" %></td>
                            <td><%= b.getNumPersons() %></td>
                            <td>$<%= b.getTotalAmount() != null ? b.getTotalAmount() : 0 %></td>
                            <td><span class="status-<%= b.getStatus() %>"><%= b.getStatus() %></span></td>
                            <td><a href="${pageContext.request.contextPath}/views/user/booking-detail.jsp?id=<%= b.getBookingId() %>" class="btn-view">View</a></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% if (myBookings.size() > 5) { %>
                    <div class="view-all">
                        <a href="${pageContext.request.contextPath}/views/user/my-bookings.jsp">View All Bookings →</a>
                    </div>
                <% } %>
            <% } %>
        </div>
    </div>
</main>

<style>
.dashboard-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem 5%;
}

.welcome-card {
    background: linear-gradient(135deg, #2F4A85, #5A7FBA);
    border-radius: 20px;
    padding: 2rem;
    display: flex;
    align-items: center;
    gap: 1.5rem;
    margin-bottom: 2rem;
    color: white;
}

.welcome-avatar i {
    font-size: 4rem;
}

.welcome-text h2 {
    margin-bottom: 0.5rem;
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.stat-card {
    background: white;
    padding: 1.5rem;
    border-radius: 16px;
    text-align: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.stat-card i {
    font-size: 2rem;
    color: #5A7FBA;
}

.stat-card h3 {
    font-size: 1.8rem;
    color: #2F4A85;
    margin: 0.5rem 0;
}

.quick-actions {
    background: white;
    border-radius: 16px;
    padding: 1.5rem;
    margin-bottom: 2rem;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.quick-actions h3 {
    color: #2F4A85;
    margin-bottom: 1rem;
}

.action-buttons {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
}

.action-btn {
    padding: 0.7rem 1.5rem;
    background: #f0f2f5;
    color: #2F4A85;
    text-decoration: none;
    border-radius: 50px;
    transition: all 0.3s;
}

.action-btn:hover {
    background: #2F4A85;
    color: white;
}

.recent-bookings {
    background: white;
    border-radius: 16px;
    padding: 1.5rem;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.recent-bookings h3 {
    color: #2F4A85;
    margin-bottom: 1rem;
}

.booking-table {
    width: 100%;
    border-collapse: collapse;
}

.booking-table th,
.booking-table td {
    padding: 0.8rem;
    text-align: left;
    border-bottom: 1px solid #eee;
}

.booking-table th {
    background: #f8f9fa;
    font-weight: 600;
}

.status-pending {
    color: #ffc107;
    font-weight: 600;
}

.status-confirmed {
    color: #28a745;
    font-weight: 600;
}

.status-cancelled {
    color: #dc3545;
    font-weight: 600;
}

.btn-view {
    padding: 0.3rem 0.8rem;
    background: #5A7FBA;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-size: 0.8rem;
}

.empty-state {
    text-align: center;
    padding: 3rem;
}

.empty-state i {
    font-size: 3rem;
    color: #ccc;
    margin-bottom: 1rem;
}

.btn-primary {
    display: inline-block;
    padding: 0.8rem 1.5rem;
    background: #2F4A85;
    color: white;
    border-radius: 8px;
    text-decoration: none;
    margin-top: 1rem;
}

.view-all {
    text-align: center;
    margin-top: 1rem;
    padding-top: 1rem;
    border-top: 1px solid #eee;
}

.view-all a {
    color: #5A7FBA;
    text-decoration: none;
}

@media (max-width: 768px) {
    .welcome-card {
        flex-direction: column;
        text-align: center;
    }
    
    .booking-table {
        display: block;
        overflow-x: auto;
    }
    
    .action-buttons {
        justify-content: center;
    }
}
</style>

<jsp:include page="/views/includes/footer.jsp" />
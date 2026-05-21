<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.BookingDAO" %>
<%@ page import="com.nepalhikehub.model.Booking" %>
<%@ page import="java.util.*" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
        return;
    }
    
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> allBookings = bookingDAO.getAllBookings();
    
    String statusFilter = request.getParameter("status");
    if (statusFilter != null && !statusFilter.isEmpty()) {
        List<Booking> filtered = new ArrayList<>();
        for (Booking b : allBookings) {
            if (statusFilter.equals(b.getStatus())) filtered.add(b);
        }
        allBookings = filtered;
    }
    
    String successMsg = request.getParameter("success");
    String errorMsg = request.getParameter("error");
    
    // Calculate stats
    int totalBookings = 0, pendingCount = 0, confirmedCount = 0, cancelledCount = 0;
    double totalRevenue = 0;
    for (Booking b : bookingDAO.getAllBookings()) {
        totalBookings++;
        if ("pending".equals(b.getStatus())) pendingCount++;
        else if ("confirmed".equals(b.getStatus())) {
            confirmedCount++;
            if (b.getTotalAmount() != null) totalRevenue += b.getTotalAmount().doubleValue();
        }
        else if ("cancelled".equals(b.getStatus())) cancelledCount++;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Bookings - Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #f0f2f5; }
        
        /* Sidebar */
        .sidebar { position: fixed; left: 0; top: 0; width: 260px; height: 100%; background: #1D1E22; color: white; padding: 20px; overflow-y: auto; }
        .sidebar h2 { font-size: 20px; margin-bottom: 30px; padding-bottom: 15px; border-bottom: 1px solid #333; }
        .sidebar h2 span { color: #5A7FBA; }
        .sidebar a { display: block; padding: 12px 15px; color: #ccc; text-decoration: none; margin: 5px 0; border-radius: 8px; transition: all 0.3s; }
        .sidebar a:hover, .sidebar a.active { background: #2F4A85; color: white; }
        .sidebar a i { margin-right: 10px; width: 20px; }
        
        /* Main Content */
        .main-content { margin-left: 260px; padding: 20px; }
        .top-bar { background: white; padding: 15px 25px; border-radius: 12px; margin-bottom: 25px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .top-bar h1 { font-size: 24px; color: #2F4A85; }
        .top-bar h1 i { margin-right: 10px; }
        
        /* Stats Cards */
        .stats-container { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-bottom: 25px; }
        .stat-card { background: white; padding: 15px; border-radius: 12px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .stat-card h3 { font-size: 28px; color: #2F4A85; margin-bottom: 5px; }
        .stat-card p { color: #666; font-size: 14px; }
        .stat-card i { font-size: 24px; color: #5A7FBA; margin-bottom: 10px; }
        
        /* Filter Bar */
        .filter-bar { display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap; }
        .filter-btn { padding: 8px 16px; background: #f0f2f5; border-radius: 20px; text-decoration: none; color: #333; transition: all 0.3s; }
        .filter-btn:hover, .filter-btn.active { background: #2F4A85; color: white; }
        
        /* Card */
        .card { background: white; border-radius: 12px; padding: 20px; margin-bottom: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .card h3 { margin-bottom: 15px; color: #2F4A85; font-size: 18px; }
        
        /* Table */
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; font-weight: 600; color: #333; }
        tr:hover { background: #f8f9fa; }
        
        /* Status Badges */
        .status-pending { background: #fff3cd; color: #856404; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600; display: inline-block; }
        .status-confirmed { background: #d4edda; color: #155724; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600; display: inline-block; }
        .status-cancelled { background: #f8d7da; color: #721c24; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600; display: inline-block; }
        
        /* Buttons */
        .btn-confirm { background: #28a745; color: white; padding: 4px 10px; border-radius: 5px; text-decoration: none; font-size: 11px; margin: 0 2px; display: inline-block; }
        .btn-cancel { background: #dc3545; color: white; padding: 4px 10px; border-radius: 5px; text-decoration: none; font-size: 11px; margin: 0 2px; display: inline-block; }
        .btn-back { background: #6c757d; color: white; padding: 8px 20px; border-radius: 8px; text-decoration: none; font-size: 14px; }
        .btn-back:hover { background: #5a6268; }
        
        /* Alert */
        .alert-success { background: #d4edda; color: #155724; padding: 12px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #28a745; }
        .alert-error { background: #f8d7da; color: #721c24; padding: 12px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #dc3545; }
        
        @media (max-width: 768px) {
            .sidebar { width: 100%; height: auto; position: relative; }
            .main-content { margin-left: 0; }
            .stats-container { grid-template-columns: repeat(2, 1fr); }
            table { display: block; overflow-x: auto; }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Nepal<span>HikeHub</span></h2>
        <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp"><i class="fas fa-hiking"></i> Manage Treks</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp" class="active"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
        <a href="${pageContext.request.contextPath}/views/admin/reports.jsp"><i class="fas fa-chart-bar"></i> Reports</a>
    </div>
    
    <div class="main-content">
        <div class="top-bar">
            <h1><i class="fas fa-calendar-check"></i> Manage Bookings</h1>
            <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
        
        <!-- Stats Cards -->
        <div class="stats-container">
            <div class="stat-card">
                <i class="fas fa-ticket-alt"></i>
                <h3><%= totalBookings %></h3>
                <p>Total Bookings</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-clock"></i>
                <h3><%= pendingCount %></h3>
                <p>Pending</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-check-circle"></i>
                <h3><%= confirmedCount %></h3>
                <p>Confirmed</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-dollar-sign"></i>
                <h3>$<%= String.format("%.2f", totalRevenue) %></h3>
                <p>Total Revenue</p>
            </div>
        </div>
        
        <!-- Success/Error Messages -->
        <% if (successMsg != null) { %>
            <div class="alert-success"><i class="fas fa-check-circle"></i> <%= successMsg %></div>
        <% } %>
        <% if (errorMsg != null) { %>
            <div class="alert-error"><i class="fas fa-exclamation-circle"></i> <%= errorMsg %></div>
        <% } %>
        
        <!-- Filter Bar -->
        <div class="filter-bar">
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp" class="filter-btn <%= statusFilter == null ? "active" : "" %>">All</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp?status=pending" class="filter-btn <%= "pending".equals(statusFilter) ? "active" : "" %>">Pending</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp?status=confirmed" class="filter-btn <%= "confirmed".equals(statusFilter) ? "active" : "" %>">Confirmed</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp?status=cancelled" class="filter-btn <%= "cancelled".equals(statusFilter) ? "active" : "" %>">Cancelled</a>
        </div>
        
        <!-- Bookings List -->
        <div class="card">
            <h3><i class="fas fa-list"></i> Bookings List</h3>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer</th>
                            <th>Trek</th>
                            <th>Travelers</th>
                            <th>Total Amount</th>
                            <th>Booking Date</th>
                            <th>Trek Start Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (allBookings.isEmpty()) { %>
                            <tr>
                                <td colspan="9" style="text-align: center;">No bookings found</td>
                            </tr>
                        <% } else { %>
                            <% for (Booking b : allBookings) { %>
                                <tr>
                                    <td>#<%= b.getBookingId() %></td>
                                    <td><strong><%= b.getUserName() != null ? b.getUserName() : "User" %></strong></td>
                                    <td><%= b.getTrekName() != null ? b.getTrekName() : "Trek" %></td>
                                    <td><%= b.getNumPersons() %></td>
                                    <td>$<%= b.getTotalAmount() != null ? b.getTotalAmount() : 0 %></td>
                                    <td><%= b.getBookingDate() %></td>
                                    <td><%= b.getTrekStartDate() != null ? b.getTrekStartDate() : "TBD" %></td>
                                    <td><span class="status-<%= b.getStatus() %>"><%= b.getStatus() %></span></td>
                                    <td>
                                        <% if ("pending".equals(b.getStatus())) { %>
                                            <a href="${pageContext.request.contextPath}/admin/update-booking?bookingId=<%= b.getBookingId() %>&status=confirmed" class="btn-confirm" onclick="return confirm('Confirm this booking?')">
                                                <i class="fas fa-check"></i> Confirm
                                            </a>
                                            <a href="${pageContext.request.contextPath}/admin/update-booking?bookingId=<%= b.getBookingId() %>&status=cancelled" class="btn-cancel" onclick="return confirm('Cancel this booking?')">
                                                <i class="fas fa-times"></i> Cancel
                                            </a>
                                        <% } else if ("confirmed".equals(b.getStatus())) { %>
                                            <a href="${pageContext.request.contextPath}/admin/update-booking?bookingId=<%= b.getBookingId() %>&status=cancelled" class="btn-cancel" onclick="return confirm('Cancel this booking?')">
                                                <i class="fas fa-times"></i> Cancel
                                            </a>
                                        <% } else { %>
                                            <span style="color: #999;">-</span>
                                        <% } %>
                                    </td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
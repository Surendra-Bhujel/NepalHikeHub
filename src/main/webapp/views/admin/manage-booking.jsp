<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, com.nepalhikehub.dao.BookingDAO, com.nepalhikehub.model.Booking, java.util.*" %>
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
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

<div class="admin-wrapper">
    <div class="admin-sidebar">
        <div class="admin-sidebar-header">
            <h3><i class="fas fa-crown"></i> Admin Panel</h3>
        </div>
        <ul class="admin-sidebar-menu">
            <li><a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp"><i class="fas fa-hiking"></i> Manage Treks</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp"><i class="fas fa-users"></i> Manage Users</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp" class="active"><i class="fas fa-calendar-check"></i> Manage Bookings</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/reports.jsp"><i class="fas fa-chart-bar"></i> Reports</a></li>
        </ul>
    </div>
    
    <div class="admin-main">
        <div class="admin-topbar">
            <h1><i class="fas fa-calendar-check"></i> Manage Bookings</h1>
        </div>
        
        <!-- Filter Bar -->
        <div class="filter-bar">
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp" class="filter-btn">All</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp?status=pending" class="filter-btn">Pending</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp?status=confirmed" class="filter-btn">Confirmed</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp?status=cancelled" class="filter-btn">Cancelled</a>
        </div>
        
        <div class="data-card">
            <table class="data-table">
                <thead>
                    <tr><th>ID</th><th>Customer</th><th>Trek</th><th>Travelers</th><th>Total Amount</th><th>Booking Date</th><th>Status</th><th>Action</th></tr>
                </thead>
                <tbody>
                    <% for (Booking b : allBookings) { %>
                    <tr>
                        <td>#<%= b.getBookingId() %></td>
                        <td><%= b.getUserName() != null ? b.getUserName() : "User" %></td>
                        <td><%= b.getTrekName() != null ? b.getTrekName() : "Trek" %></td>
                        <td><%= b.getNumPersons() %></td>
                        <td>$<%= b.getTotalAmount() != null ? b.getTotalAmount() : 0 %></td>
                        <td><%= b.getBookingDate() %></td>
                        <td><span class="status-<%= b.getStatus() %>"><%= b.getStatus() %></span></td>
                        <td>
                            <% if ("pending".equals(b.getStatus())) { %>
                                <a href="${pageContext.request.contextPath}/admin/update-booking?bookingId=<%= b.getBookingId() %>&status=confirmed" class="btn-approve">Confirm</a>
                                <a href="${pageContext.request.contextPath}/admin/update-booking?bookingId=<%= b.getBookingId() %>&status=cancelled" class="btn-delete">Cancel</a>
                            <% } else if ("confirmed".equals(b.getStatus())) { %>
                                <a href="${pageContext.request.contextPath}/admin/update-booking?bookingId=<%= b.getBookingId() %>&status=cancelled" class="btn-delete">Cancel</a>
                            <% } %>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<style>
.filter-bar { display: flex; gap: 10px; margin-bottom: 20px; flex-wrap: wrap; }
.filter-btn { padding: 8px 16px; background: #f0f2f5; border-radius: 20px; text-decoration: none; color: #333; }
.filter-btn:hover { background: #2F4A85; color: white; }
</style>

<jsp:include page="/views/includes/footer.jsp" />
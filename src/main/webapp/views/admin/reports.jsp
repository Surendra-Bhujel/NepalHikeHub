<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, com.nepalhikehub.dao.*, com.nepalhikehub.model.*, java.util.*" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    BookingDAO bookingDAO = new BookingDAO();
    TrekDAO trekDAO = new TrekDAO();
    
    List<Booking> allBookings = bookingDAO.getAllBookings();
    List<Trek> allTreks = trekDAO.getAllTreks();
    
    // Monthly booking statistics
    Map<String, Integer> monthlyBookings = new LinkedHashMap<>();
    Map<String, Double> monthlyRevenue = new LinkedHashMap<>();
    SimpleDateFormat monthFormat = new SimpleDateFormat("MMMM yyyy");
    
    for (Booking b : allBookings) {
        String month = monthFormat.format(b.getBookingDate());
        monthlyBookings.put(month, monthlyBookings.getOrDefault(month, 0) + 1);
        if ("confirmed".equals(b.getStatus()) && b.getTotalAmount() != null) {
            monthlyRevenue.put(month, monthlyRevenue.getOrDefault(month, 0.0) + b.getTotalAmount().doubleValue());
        }
    }
    
    // Popular treks
    Map<String, Integer> trekPopularity = new HashMap<>();
    for (Booking b : allBookings) {
        String trekName = b.getTrekName();
        if (trekName != null) {
            trekPopularity.put(trekName, trekPopularity.getOrDefault(trekName, 0) + 1);
        }
    }
    List<Map.Entry<String, Integer>> popularTreks = new ArrayList<>(trekPopularity.entrySet());
    popularTreks.sort((a, b) -> b.getValue().compareTo(a.getValue()));
    
    // Status distribution
    int pending = 0, confirmed = 0, cancelled = 0;
    for (Booking b : allBookings) {
        if ("pending".equals(b.getStatus())) pending++;
        else if ("confirmed".equals(b.getStatus())) confirmed++;
        else if ("cancelled".equals(b.getStatus())) cancelled++;
    }
    
    // Calculate availability (treks available vs booked)
    int totalCapacity = 0;
    for (Trek t : allTreks) {
        totalCapacity += t.getMaxGroupSize();
    }
    int totalBooked = allBookings.size();
    int available = totalCapacity - totalBooked;
    if (available < 0) available = 0;
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
            <li><a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a></li>
            <li><a href="${pageContext.request.contextPath}/views/admin/reports.jsp" class="active"><i class="fas fa-chart-bar"></i> Reports</a></li>
        </ul>
    </div>
    
    <div class="admin-main">
        <div class="admin-topbar">
            <h1><i class="fas fa-chart-bar"></i> Reports & Analytics</h1>
        </div>
        
        <!-- Availability vs Booked -->
        <div class="data-card">
            <div class="data-card-header">
                <h3><i class="fas fa-chart-pie"></i> Availability vs Booked</h3>
            </div>
            <div class="availability-stats">
                <div class="availability-item">
                    <div class="progress-bar">
                        <div class="progress-fill" style="width: <%= (totalBooked * 100 / (totalCapacity + totalBooked)) %>%"></div>
                    </div>
                    <div class="availability-labels">
                        <span>Booked: <%= totalBooked %></span>
                        <span>Available: <%= available %></span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Monthly Statistics -->
        <div class="data-card">
            <div class="data-card-header">
                <h3><i class="fas fa-calendar-alt"></i> Monthly Booking Statistics</h3>
            </div>
            <table class="data-table">
                <thead><tr><th>Month</th><th>Bookings</th><th>Revenue</th></tr></thead>
                <tbody>
                    <% for (Map.Entry<String, Integer> entry : monthlyBookings.entrySet()) { %>
                    <tr>
                        <td><%= entry.getKey() %></td>
                        <td><%= entry.getValue() %></td>
                        <td>$<%= String.format("%.2f", monthlyRevenue.getOrDefault(entry.getKey(), 0.0)) %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <!-- Most Popular Treks -->
        <div class="data-card">
            <div class="data-card-header">
                <h3><i class="fas fa-fire"></i> Most Popular Treks</h3>
            </div>
            <table class="data-table">
                <thead><tr><th>Rank</th><th>Trek Name</th><th>Number of Bookings</th></tr></thead>
                <tbody>
                    <% int rank = 1; for (Map.Entry<String, Integer> entry : popularTreks) { %>
                    <tr>
                        <td><%= rank++ %></td>
                        <td><%= entry.getKey() %></td>
                        <td><%= entry.getValue() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        
        <!-- Booking Status Distribution -->
        <div class="data-card">
            <div class="data-card-header">
                <h3><i class="fas fa-chart-pie"></i> Booking Status Distribution</h3>
            </div>
            <div class="status-distribution">
                <div class="status-item pending">Pending: <%= pending %></div>
                <div class="status-item confirmed">Confirmed: <%= confirmed %></div>
                <div class="status-item cancelled">Cancelled: <%= cancelled %></div>
            </div>
        </div>
    </div>
</div>

<style>
.availability-stats { padding: 20px; }
.progress-bar { background: #e0e0e0; border-radius: 10px; height: 20px; overflow: hidden; margin-bottom: 10px; }
.progress-fill { background: #2F4A85; height: 100%; border-radius: 10px; }
.availability-labels { display: flex; justify-content: space-between; }
.status-distribution { display: flex; gap: 20px; padding: 20px; }
.status-item { padding: 10px 20px; border-radius: 8px; font-weight: bold; }
.status-item.pending { background: #fff3cd; color: #856404; }
.status-item.confirmed { background: #d4edda; color: #155724; }
.status-item.cancelled { background: #f8d7da; color: #721c24; }
</style>

<jsp:include page="/views/includes/footer.jsp" />
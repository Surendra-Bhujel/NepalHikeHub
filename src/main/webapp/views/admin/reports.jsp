<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.*" %>
<%@ page import="com.nepalhikehub.model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
        return;
    }
    
    BookingDAO bookingDAO = new BookingDAO();
    TrekDAO trekDAO = new TrekDAO();
    UserDAO userDAO = new UserDAO();
    
    // Get all bookings
    List<Booking> allBookings = bookingDAO.getAllBookings();
    if (allBookings == null) allBookings = new ArrayList<>();
    
    List<Trek> allTreks = trekDAO.getAllTreks();
    if (allTreks == null) allTreks = new ArrayList<>();
    
    // Monthly booking statistics
    Map<String, Integer> monthlyBookings = new LinkedHashMap<>();
    Map<String, Double> monthlyRevenue = new LinkedHashMap<>();
    SimpleDateFormat monthFormat = new SimpleDateFormat("MMMM yyyy");
    
    for (Booking b : allBookings) {
        if (b.getBookingDate() != null) {
            String month = monthFormat.format(b.getBookingDate());
            monthlyBookings.put(month, monthlyBookings.getOrDefault(month, 0) + 1);
            if ("confirmed".equals(b.getStatus()) && b.getTotalAmount() != null) {
                monthlyRevenue.put(month, monthlyRevenue.getOrDefault(month, 0.0) + b.getTotalAmount().doubleValue());
            }
        }
    }
    
    // Popular treks
    Map<String, Integer> trekPopularity = new HashMap<>();
    for (Booking b : allBookings) {
        String trekName = b.getTrekName();
        if (trekName != null && !trekName.isEmpty()) {
            trekPopularity.put(trekName, trekPopularity.getOrDefault(trekName, 0) + 1);
        }
    }
    List<Map.Entry<String, Integer>> popularTreks = new ArrayList<>(trekPopularity.entrySet());
    popularTreks.sort((a, b) -> b.getValue().compareTo(a.getValue()));
    
    // Status distribution
    int pending = 0, confirmed = 0, cancelled = 0;
    double totalRevenue = 0;
    for (Booking b : allBookings) {
        if ("pending".equals(b.getStatus())) pending++;
        else if ("confirmed".equals(b.getStatus())) {
            confirmed++;
            if (b.getTotalAmount() != null) {
                totalRevenue += b.getTotalAmount().doubleValue();
            }
        }
        else if ("cancelled".equals(b.getStatus())) cancelled++;
    }
    
    // User stats
    List<User> allUsers = userDAO.getAllUsers();
    if (allUsers == null) allUsers = new ArrayList<>();
    int totalUsers = allUsers.size();
    int approvedUsers = 0;
    for (User u : allUsers) {
        if (u != null && u.isApproved()) approvedUsers++;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reports - Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #f0f2f5; }
        .sidebar { position: fixed; left: 0; top: 0; width: 260px; height: 100%; background: #1D1E22; color: white; padding: 20px; overflow-y: auto; }
        .sidebar h2 { font-size: 20px; margin-bottom: 30px; padding-bottom: 15px; border-bottom: 1px solid #333; }
        .sidebar h2 span { color: #5A7FBA; }
        .sidebar a { display: block; padding: 12px 15px; color: #ccc; text-decoration: none; margin: 5px 0; border-radius: 8px; transition: all 0.3s; }
        .sidebar a:hover, .sidebar a.active { background: #2F4A85; color: white; }
        .sidebar a i { margin-right: 10px; width: 20px; }
        
        .main-content { margin-left: 260px; padding: 20px; }
        .top-bar { background: white; padding: 15px 25px; border-radius: 12px; margin-bottom: 25px; display: flex; justify-content: space-between; align-items: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .top-bar h1 { font-size: 24px; color: #2F4A85; }
        .top-bar h1 i { margin-right: 10px; }
        
        .stats-container { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-bottom: 25px; }
        .stat-card { background: white; padding: 20px; border-radius: 12px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .stat-card h3 { font-size: 28px; color: #2F4A85; margin-bottom: 5px; }
        .stat-card p { color: #666; font-size: 14px; }
        .stat-card i { font-size: 32px; color: #5A7FBA; margin-bottom: 10px; }
        
        .card { background: white; border-radius: 12px; padding: 20px; margin-bottom: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .card h3 { color: #2F4A85; margin-bottom: 15px; border-bottom: 2px solid #E1F0F4; padding-bottom: 10px; }
        .card h3 i { margin-right: 8px; }
        
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; font-weight: 600; }
        
        .status-distribution { display: flex; gap: 20px; margin-top: 15px; flex-wrap: wrap; }
        .status-item { flex: 1; text-align: center; padding: 20px; border-radius: 12px; min-width: 150px; }
        .status-item.pending { background: #fff3cd; color: #856404; }
        .status-item.confirmed { background: #d4edda; color: #155724; }
        .status-item.cancelled { background: #f8d7da; color: #721c24; }
        .status-item h4 { font-size: 28px; margin-bottom: 5px; }
        .status-item i { font-size: 32px; margin-bottom: 10px; }
        
        .btn-back { background: #6c757d; color: white; padding: 8px 20px; border-radius: 8px; text-decoration: none; transition: all 0.3s; }
        .btn-back:hover { background: #5a6268; }
        
        @media (max-width: 768px) {
            .sidebar { width: 100%; height: auto; position: relative; }
            .main-content { margin-left: 0; }
            .stats-container { grid-template-columns: repeat(2, 1fr); }
            .status-distribution { flex-direction: column; }
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
        <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
        <a href="${pageContext.request.contextPath}/views/admin/reports.jsp" class="active"><i class="fas fa-chart-bar"></i> Reports & Analytics</a>
    </div>
    
    <div class="main-content">
        <div class="top-bar">
            <h1><i class="fas fa-chart-bar"></i> Reports & Analytics</h1>
            <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
        
        <div class="stats-container">
            <div class="stat-card">
                <i class="fas fa-users"></i>
                <h3><%= totalUsers %></h3>
                <p>Total Users</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-user-check"></i>
                <h3><%= approvedUsers %></h3>
                <p>Active Users</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-ticket-alt"></i>
                <h3><%= allBookings.size() %></h3>
                <p>Total Bookings</p>
            </div>
            <div class="stat-card">
                <i class="fas fa-dollar-sign"></i>
                <h3>$<%= String.format("%.2f", totalRevenue) %></h3>
                <p>Total Revenue</p>
            </div>
        </div>
        
        <div class="card">
            <h3><i class="fas fa-chart-pie"></i> Booking Status Distribution</h3>
            <div class="status-distribution">
                <div class="status-item pending">
                    <i class="fas fa-clock"></i>
                    <h4><%= pending %></h4>
                    <p>Pending Bookings</p>
                </div>
                <div class="status-item confirmed">
                    <i class="fas fa-check-circle"></i>
                    <h4><%= confirmed %></h4>
                    <p>Confirmed Bookings</p>
                </div>
                <div class="status-item cancelled">
                    <i class="fas fa-times-circle"></i>
                    <h4><%= cancelled %></h4>
                    <p>Cancelled Bookings</p>
                </div>
            </div>
        </div>
        
        <div class="card">
            <h3><i class="fas fa-fire"></i> Most Popular Treks</h3>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>Rank</th>
                            <th>Trek Name</th>
                            <th>Number of Bookings</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (popularTreks.isEmpty()) { %>
                            <tr><td colspan="3" style="text-align: center;">No booking data available</td></tr>
                        <% } else { 
                            int rank = 1; 
                            for (Map.Entry<String, Integer> entry : popularTreks) { 
                                if(rank > 10) break;
                        %>
                            <tr>
                                <td><strong>#<%= rank++ %></strong></td>
                                <td><%= entry.getKey() %></td>
                                <td><%= entry.getValue() %> bookings</td>
                            </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="card">
            <h3><i class="fas fa-calendar-alt"></i> Monthly Statistics</h3>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>Month</th>
                            <th>Number of Bookings</th>
                            <th>Revenue</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (monthlyBookings.isEmpty()) { %>
                            <tr><td colspan="3" style="text-align: center;">No data available</td></tr>
                        <% } else { 
                            for (Map.Entry<String, Integer> entry : monthlyBookings.entrySet()) { 
                        %>
                            <tr>
                                <td><strong><%= entry.getKey() %></strong></td>
                                <td><%= entry.getValue() %> bookings</td>
                                <td>$<%= String.format("%.2f", monthlyRevenue.getOrDefault(entry.getKey(), 0.0)) %></td>
                            </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <div class="card">
            <h3><i class="fas fa-chart-line"></i> Summary</h3>
            <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 15px;">
                <div>
                    <p><strong>📊 Total Treks Available:</strong> <%= allTreks.size() %></p>
                    <p><strong>✅ Approval Rate:</strong> <%= totalUsers > 0 ? (approvedUsers * 100 / totalUsers) : 0 %>%</p>
                </div>
                <div>
                    <p><strong>💰 Average Booking Value:</strong> $<%= allBookings.size() > 0 ? String.format("%.2f", totalRevenue / allBookings.size()) : "0" %></p>
                    <p><strong>📈 Completion Rate:</strong> <%= allBookings.size() > 0 ? (confirmed * 100 / allBookings.size()) : 0 %>%</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
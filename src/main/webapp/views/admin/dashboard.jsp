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
    
    UserDAO userDAO = new UserDAO();
    TrekDAO trekDAO = new TrekDAO();
    BookingDAO bookingDAO = new BookingDAO();
    
    // Dashboard Statistics
    int totalUsers = userDAO.getAllUsers().size();
    int pendingUsers = userDAO.getPendingUsers().size();
    int totalTreks = trekDAO.getAllTreks().size();
    List<Booking> allBookings = bookingDAO.getAllBookings();
    int totalBookings = allBookings != null ? allBookings.size() : 0;
    
    // Calculate revenue and booking stats
    double totalRevenue = 0;
    int confirmedBookings = 0;
    int pendingBookings = 0;
    int cancelledBookings = 0;
    
    if (allBookings != null) {
        for (Booking b : allBookings) {
            if ("confirmed".equals(b.getStatus())) {
                confirmedBookings++;
                if (b.getTotalAmount() != null) {
                    totalRevenue += b.getTotalAmount().doubleValue();
                }
            } else if ("pending".equals(b.getStatus())) {
                pendingBookings++;
            } else if ("cancelled".equals(b.getStatus())) {
                cancelledBookings++;
            }
        }
    }
    
    // Get recent bookings (last 5)
    List<Booking> recentBookings = new ArrayList<>();
    if (allBookings != null) {
        int count = 0;
        for (Booking b : allBookings) {
            if (count++ < 5) recentBookings.add(b);
        }
    }
    
    // Get most popular treks (Top 5)
    Map<String, Integer> trekPopularity = new HashMap<>();
    for (Booking b : allBookings) {
        String trekName = b.getTrekName();
        if (trekName != null) {
            trekPopularity.put(trekName, trekPopularity.getOrDefault(trekName, 0) + 1);
        }
    }
    List<Map.Entry<String, Integer>> popularTreks = new ArrayList<>(trekPopularity.entrySet());
    popularTreks.sort((a, b) -> b.getValue().compareTo(a.getValue()));
    
    // Get upcoming treks (next 30 days)
    java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
    java.sql.Date nextMonth = new java.sql.Date(System.currentTimeMillis() + 30L * 24 * 60 * 60 * 1000);
    int upcomingTreks = 0;
    for (Booking b : allBookings) {
        if (b.getTrekStartDate() != null && b.getTrekStartDate().after(today) && "confirmed".equals(b.getStatus())) {
            upcomingTreks++;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - NepalHikeHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Poppins', sans-serif; background: #f0f2f5; }
        
        /* Header */
        .admin-header { background: #2F4A85; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; position: fixed; top: 0; left: 0; right: 0; z-index: 100; }
        .admin-header h2 { font-size: 1.3rem; }
        .admin-header a { color: white; text-decoration: none; margin-left: 20px; }
        
        /* Sidebar */
        .sidebar { position: fixed; left: 0; top: 60px; width: 260px; height: calc(100% - 60px); background: #1D1E22; color: white; padding: 20px; overflow-y: auto; }
        .sidebar h3 { font-size: 16px; margin-bottom: 20px; padding-bottom: 10px; border-bottom: 1px solid #333; }
        .sidebar h3 i { margin-right: 8px; }
        .sidebar a { display: block; padding: 12px 15px; color: #ccc; text-decoration: none; margin: 5px 0; border-radius: 8px; transition: all 0.3s; }
        .sidebar a:hover, .sidebar a.active { background: #2F4A85; color: white; }
        .sidebar a i { margin-right: 10px; width: 20px; }
        
        /* Main Content */
        .main-content { margin-left: 260px; margin-top: 60px; padding: 20px; }
        
        /* Stats Cards */
        .stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-bottom: 25px; }
        .stat-card { background: white; padding: 20px; border-radius: 12px; display: flex; align-items: center; gap: 15px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); transition: transform 0.3s; }
        .stat-card:hover { transform: translateY(-3px); }
        .stat-icon { width: 55px; height: 55px; background: #E1F0F4; border-radius: 12px; display: flex; align-items: center; justify-content: center; }
        .stat-icon i { font-size: 24px; color: #2F4A85; }
        .stat-info h3 { font-size: 24px; color: #2F4A85; }
        .stat-info p { color: #666; font-size: 13px; }
        
        /* Cards */
        .card { background: white; border-radius: 12px; padding: 20px; margin-bottom: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .card-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 15px; padding-bottom: 10px; border-bottom: 2px solid #E1F0F4; }
        .card-header h3 { color: #2F4A85; font-size: 18px; }
        .card-header h3 i { margin-right: 8px; }
        .view-all { color: #5A7FBA; text-decoration: none; font-size: 13px; }
        .view-all:hover { text-decoration: underline; }
        
        /* Tables */
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; font-weight: 600; color: #333; font-size: 13px; }
        td { font-size: 13px; }
        tr:hover { background: #f8f9fa; }
        
        /* Status Badges */
        .status-pending { background: #fff3cd; color: #856404; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600; display: inline-block; }
        .status-confirmed { background: #d4edda; color: #155724; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600; display: inline-block; }
        .status-cancelled { background: #f8d7da; color: #721c24; padding: 4px 10px; border-radius: 20px; font-size: 11px; font-weight: 600; display: inline-block; }
        
        /* Quick Actions */
        .quick-actions { display: flex; gap: 15px; flex-wrap: wrap; margin-top: 15px; }
        .action-btn { background: #2F4A85; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none; font-size: 13px; font-weight: 500; transition: all 0.3s; }
        .action-btn:hover { background: #5A7FBA; transform: translateY(-2px); }
        .action-btn i { margin-right: 8px; }
        
        @media (max-width: 768px) {
            .sidebar { width: 100%; height: auto; position: relative; top: 0; }
            .main-content { margin-left: 0; }
            .stats-grid { grid-template-columns: repeat(2, 1fr); }
            table { display: block; overflow-x: auto; }
        }
    </style>
</head>
<body>
    <div class="admin-header">
        <h2><i class="fas fa-mountain"></i> NepalHikeHub - Admin Panel</h2>
        <div>
            Welcome, <%= currentUser.getName() %> | 
            <a href="${pageContext.request.contextPath}/home.jsp"><i class="fas fa-home"></i> View Site</a> |
            <a href="${pageContext.request.contextPath}/signout"><i class="fas fa-sign-out-alt"></i> Logout</a>
        </div>
    </div>
    
    <div class="sidebar">
        <h3><i class="fas fa-menu"></i> Navigation</h3>
        <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp"><i class="fas fa-hiking"></i> Manage Treks</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp"><i class="fas fa-users"></i> Manage Users</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
        <a href="${pageContext.request.contextPath}/views/admin/reports.jsp"><i class="fas fa-chart-bar"></i> Reports & Analytics</a>
    </div>
    
    <div class="main-content">
        <!-- Statistics Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-users"></i></div>
                <div class="stat-info">
                    <h3><%= totalUsers %></h3>
                    <p>Total Users</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-user-clock"></i></div>
                <div class="stat-info">
                    <h3><%= pendingUsers %></h3>
                    <p>Pending Approval</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-hiking"></i></div>
                <div class="stat-info">
                    <h3><%= totalTreks %></h3>
                    <p>Total Treks</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-ticket-alt"></i></div>
                <div class="stat-info">
                    <h3><%= totalBookings %></h3>
                    <p>Total Bookings</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-dollar-sign"></i></div>
                <div class="stat-info">
                    <h3>$<%= String.format("%.2f", totalRevenue) %></h3>
                    <p>Total Revenue</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-calendar-week"></i></div>
                <div class="stat-info">
                    <h3><%= upcomingTreks %></h3>
                    <p>Upcoming Treks</p>
                </div>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-bolt"></i> Quick Actions</h3>
            </div>
            <div class="quick-actions">
                <a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp" class="action-btn"><i class="fas fa-plus"></i> Add New Trek</a>
                <a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp" class="action-btn"><i class="fas fa-user-check"></i> Approve Users</a>
                <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp" class="action-btn"><i class="fas fa-eye"></i> View All Bookings</a>
                <a href="${pageContext.request.contextPath}/views/admin/reports.jsp" class="action-btn"><i class="fas fa-chart-line"></i> View Reports</a>
            </div>
        </div>
        
        <!-- Recent Bookings -->
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-clock"></i> Recent Bookings</h3>
                <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp" class="view-all">View All →</a>
            </div>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer</th>
                            <th>Trek</th>
                            <th>Travelers</th>
                            <th>Amount</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (recentBookings.isEmpty()) { %>
                            <tr><td colspan="6" style="text-align: center;">No recent bookings</td></tr>
                        <% } else { %>
                            <% for (Booking b : recentBookings) { %>
                                <tr>
                                    <td>#<%= b.getBookingId() %></td>
                                    <td><%= b.getUserName() != null ? b.getUserName() : "User" %></td>
                                    <td><%= b.getTrekName() != null ? b.getTrekName() : "Trek" %></td>
                                    <td><%= b.getNumPersons() %></td>
                                    <td>$<%= b.getTotalAmount() != null ? b.getTotalAmount() : 0 %></td>
                                    <td><span class="status-<%= b.getStatus() %>"><%= b.getStatus() %></span></td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Most Popular Treks -->
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-fire"></i> Most Popular Treks</h3>
                <a href="${pageContext.request.contextPath}/views/admin/reports.jsp" class="view-all">View Reports →</a>
            </div>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>Rank</th>
                            <th>Trek Name</th>
                            <th>Bookings</th>
                            <th>Popularity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (popularTreks.isEmpty()) { %>
                            <tr><td colspan="4" style="text-align: center;">No data available</td></tr>
                        <% } else { %>
                            <% int rank = 1; int max = popularTreks.isEmpty() ? 1 : popularTreks.get(0).getValue(); %>
                            <% for (Map.Entry<String, Integer> entry : popularTreks) { if(rank > 5) break; %>
                                <% int percent = (max > 0) ? (entry.getValue() * 100 / max) : 0; %>
                                <tr>
                                    <td><strong>#<%= rank++ %></strong></td>
                                    <td><%= entry.getKey() %></td>
                                    <td><%= entry.getValue() %> bookings</td>
                                    <td>
                                        <div style="background: #e0e0e0; border-radius: 10px; height: 6px; width: 120px;">
                                            <div style="background: #2F4A85; border-radius: 10px; height: 6px; width: <%= percent %>%;"></div>
                                        </div>
                                     </td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Booking Status Summary -->
        <div class="card">
            <div class="card-header">
                <h3><i class="fas fa-chart-pie"></i> Booking Status Summary</h3>
                <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp" class="view-all">Manage →</a>
            </div>
            <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 15px;">
                <div style="text-align: center; padding: 15px; background: #fff3cd; border-radius: 10px;">
                    <i class="fas fa-clock" style="font-size: 24px; color: #856404;"></i>
                    <h4 style="margin: 10px 0 5px;"><%= pendingBookings %></h4>
                    <p style="font-size: 12px; color: #856404;">Pending</p>
                </div>
                <div style="text-align: center; padding: 15px; background: #d4edda; border-radius: 10px;">
                    <i class="fas fa-check-circle" style="font-size: 24px; color: #155724;"></i>
                    <h4 style="margin: 10px 0 5px;"><%= confirmedBookings %></h4>
                    <p style="font-size: 12px; color: #155724;">Confirmed</p>
                </div>
                <div style="text-align: center; padding: 15px; background: #f8d7da; border-radius: 10px;">
                    <i class="fas fa-times-circle" style="font-size: 24px; color: #721c24;"></i>
                    <h4 style="margin: 10px 0 5px;"><%= cancelledBookings %></h4>
                    <p style="font-size: 12px; color: #721c24;">Cancelled</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
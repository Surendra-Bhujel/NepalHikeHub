<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
        return;
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
        .admin-header { background: #2F4A85; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .admin-header h2 { font-size: 1.3rem; }
        .admin-header a { color: white; text-decoration: none; margin-left: 20px; }
        .admin-container { display: flex; }
        .sidebar { width: 260px; background: white; min-height: calc(100vh - 60px); padding: 20px; box-shadow: 2px 0 5px rgba(0,0,0,0.05); }
        .sidebar a { display: block; padding: 12px 15px; color: #333; text-decoration: none; margin-bottom: 5px; border-radius: 8px; }
        .sidebar a:hover, .sidebar a.active { background: #2F4A85; color: white; }
        .content { flex: 1; padding: 30px; }
        .stats { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-bottom: 30px; }
        .stat-card { background: white; padding: 20px; border-radius: 12px; text-align: center; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .stat-card h3 { font-size: 2rem; color: #2F4A85; }
        .card { background: white; border-radius: 12px; padding: 20px; margin-bottom: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .card h3 { margin-bottom: 15px; color: #2F4A85; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; }
        .btn { padding: 6px 12px; border-radius: 5px; text-decoration: none; font-size: 0.8rem; }
        .btn-edit { background: #ffc107; color: #333; }
        .btn-delete { background: #dc3545; color: white; }
        .btn-approve { background: #28a745; color: white; }
    </style>
</head>
<body>
    <div class="admin-header">
        <h2><i class="fas fa-mountain"></i> NepalHikeHub - Admin Panel</h2>
        <div>
            Welcome, <%= currentUser.getName() %> | 
            <a href="${pageContext.request.contextPath}/home.jsp">View Site</a> |
            <a href="${pageContext.request.contextPath}/signout">Logout</a>
        </div>
    </div>
    
    <div class="admin-container">
        <div class="sidebar">
            <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp"><i class="fas fa-hiking"></i> Manage Treks</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp"><i class="fas fa-users"></i> Manage Users</a>
            <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp"><i class="fas fa-calendar"></i> Manage Bookings</a>
        </div>
        
        <div class="content">
            <h1 style="margin-bottom: 20px;">Dashboard Overview</h1>
            
            <div class="stats">
                <div class="stat-card">
                    <i class="fas fa-users" style="font-size: 2rem; color: #2F4A85;"></i>
                    <h3>0</h3>
                    <p>Total Users</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-hiking" style="font-size: 2rem; color: #2F4A85;"></i>
                    <h3>6</h3>
                    <p>Total Treks</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-ticket-alt" style="font-size: 2rem; color: #2F4A85;"></i>
                    <h3>0</h3>
                    <p>Total Bookings</p>
                </div>
                <div class="stat-card">
                    <i class="fas fa-dollar-sign" style="font-size: 2rem; color: #2F4A85;"></i>
                    <h3>$0</h3>
                    <p>Revenue</p>
                </div>
            </div>
            
            <div class="card">
                <h3>Quick Actions</h3>
                <div style="display: flex; gap: 15px; flex-wrap: wrap;">
                    <a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp" style="background: #2F4A85; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none;">Add New Trek</a>
                    <a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp" style="background: #5A7FBA; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none;">Approve Users</a>
                    <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp" style="background: #28a745; color: white; padding: 10px 20px; border-radius: 8px; text-decoration: none;">View Bookings</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
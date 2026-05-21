<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.UserDAO" %>
<%@ page import="java.util.*" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/admin/admin-login.jsp");
        return;
    }
    
    UserDAO userDAO = new UserDAO();
    List<User> allUsers = userDAO.getAllUsers();
    List<User> pendingUsers = userDAO.getPendingUsers();
    
    String successMsg = request.getParameter("success");
    String errorMsg = request.getParameter("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users - Admin</title>
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
        
        /* Cards */
        .card { background: white; border-radius: 12px; padding: 20px; margin-bottom: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
        .card h3 { margin-bottom: 15px; color: #2F4A85; font-size: 18px; }
        .card h3 i { margin-right: 8px; }
        
        /* Table Styles */
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; font-weight: 600; color: #333; }
        tr:hover { background: #f8f9fa; }
        
        /* Alert Messages */
        .alert-success { background: #d4edda; color: #155724; padding: 12px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #28a745; }
        .alert-error { background: #f8d7da; color: #721c24; padding: 12px; border-radius: 8px; margin-bottom: 20px; border-left: 4px solid #dc3545; }
        
        /* Buttons */
        .btn-approve { background: #28a745; color: white; padding: 5px 12px; border-radius: 5px; text-decoration: none; font-size: 12px; transition: all 0.3s; display: inline-block; }
        .btn-approve:hover { background: #218838; }
        .btn-delete { background: #dc3545; color: white; padding: 5px 12px; border-radius: 5px; text-decoration: none; font-size: 12px; transition: all 0.3s; display: inline-block; }
        .btn-delete:hover { background: #c82333; }
        .btn-back { background: #6c757d; color: white; padding: 8px 20px; border-radius: 8px; text-decoration: none; font-size: 14px; transition: all 0.3s; }
        .btn-back:hover { background: #5a6268; }
        
        /* Badges */
        .badge-admin { background: #2F4A85; color: white; padding: 3px 8px; border-radius: 12px; font-size: 11px; }
        .badge-user { background: #5A7FBA; color: white; padding: 3px 8px; border-radius: 12px; font-size: 11px; }
        .badge-approved { background: #28a745; color: white; padding: 3px 8px; border-radius: 12px; font-size: 11px; }
        .badge-pending { background: #ffc107; color: #333; padding: 3px 8px; border-radius: 12px; font-size: 11px; }
        
        /* Responsive */
        @media (max-width: 768px) {
            .sidebar { width: 100%; height: auto; position: relative; }
            .main-content { margin-left: 0; }
            table { display: block; overflow-x: auto; }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>Nepal<span>HikeHub</span></h2>
        <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp"><i class="fas fa-tachometer-alt"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-treks.jsp"><i class="fas fa-hiking"></i> Manage Treks</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-users.jsp" class="active"><i class="fas fa-users"></i> Manage Users</a>
        <a href="${pageContext.request.contextPath}/views/admin/manage-bookings.jsp"><i class="fas fa-calendar-check"></i> Manage Bookings</a>
        <a href="${pageContext.request.contextPath}/views/admin/reports.jsp"><i class="fas fa-chart-bar"></i> Reports & Analytics</a>
    </div>
    
    <div class="main-content">
        <div class="top-bar">
            <h1><i class="fas fa-users"></i> Manage Users</h1>
            <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="btn-back"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
        
        <!-- Success/Error Messages -->
        <% if (successMsg != null) { %>
            <div class="alert-success"><i class="fas fa-check-circle"></i> <%= successMsg %></div>
        <% } %>
        <% if (errorMsg != null) { %>
            <div class="alert-error"><i class="fas fa-exclamation-circle"></i> <%= errorMsg %></div>
        <% } %>
        
        <!-- Pending Approvals Section -->
        <div class="card">
            <h3><i class="fas fa-user-clock"></i> Pending Approvals</h3>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Registered Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (pendingUsers.isEmpty()) { %>
                            <tr>
                                <td colspan="6" style="text-align: center;">No pending approvals</td>
                            </tr>
                        <% } else { %>
                            <% for (User u : pendingUsers) { %>
                                <tr>
                                    <td><%= u.getUserId() %></td>
                                    <td><strong><%= u.getName() %></strong></td>
                                    <td><%= u.getEmail() %></td>
                                    <td><%= u.getPhone() != null ? u.getPhone() : "-" %></td>
                                    <td><%= u.getCreatedAt() != null ? u.getCreatedAt() : "-" %></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/admin/approve-user?id=<%= u.getUserId() %>" class="btn-approve" onclick="return confirm('Approve this user?')">
                                            <i class="fas fa-check"></i> Approve
                                        </a>
                                    </td>
                                </tr>
                            <% } %>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- All Users Section -->
        <div class="card">
            <h3><i class="fas fa-list"></i> All Users</h3>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (User u : allUsers) { %>
                            <tr>
                                <td><%= u.getUserId() %></td>
                                <td><strong><%= u.getName() %></strong></td>
                                <td><%= u.getEmail() %></td>
                                <td><%= u.getPhone() != null ? u.getPhone() : "-" %></td>
                                <td>
                                    <% if (u.getRoleId() == 1) { %>
                                        <span class="badge-admin"><i class="fas fa-crown"></i> Admin</span>
                                    <% } else { %>
                                        <span class="badge-user"><i class="fas fa-user"></i> User</span>
                                    <% } %>
                                </td>
                                <td>
                                    <% if (u.isApproved()) { %>
                                        <span class="badge-approved"><i class="fas fa-check-circle"></i> Approved</span>
                                    <% } else { %>
                                        <span class="badge-pending"><i class="fas fa-clock"></i> Pending</span>
                                    <% } %>
                                </td>
                                <td>
                                    <% if (u.getUserId() != currentUser.getUserId()) { %>
                                        <a href="${pageContext.request.contextPath}/admin/delete-user?id=<%= u.getUserId() %>" class="btn-delete" onclick="return confirm('Delete user <%= u.getName() %>?')">
                                            <i class="fas fa-trash"></i> Delete
                                        </a>
                                    <% } else { %>
                                        <span style="color: #999;">Current</span>
                                    <% } %>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
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
        .admin-header { background: #2F4A85; color: white; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; }
        .admin-container { display: flex; }
        .sidebar { width: 260px; background: white; min-height: calc(100vh - 60px); padding: 20px; }
        .sidebar a { display: block; padding: 12px 15px; color: #333; text-decoration: none; margin-bottom: 5px; border-radius: 8px; }
        .sidebar a:hover { background: #2F4A85; color: white; }
        .content { flex: 1; padding: 30px; }
        .card { background: white; border-radius: 12px; padding: 20px; margin-bottom: 20px; }
        .card h3 { margin-bottom: 15px; color: #2F4A85; }
        table { width: 100%; border-collapse: collapse; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #eee; }
        th { background: #f8f9fa; }
        .btn-approve { background: #28a745; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; font-size: 0.8rem; }
        .btn-delete { background: #dc3545; color: white; padding: 5px 10px; border-radius: 5px; text-decoration: none; font-size: 0.8rem; }
    </style>
</head>
<body>
    <div class="admin-header">
        <h2><i class="fas fa-mountain"></i> NepalHikeHub - Admin Panel</h2>
        <a href="${pageContext.request.contextPath}/home.jsp" style="color: white;">Back to Site</a>
    </div>
    
    <div class="admin-container">
        <div class="sidebar">
            <a href="${pageContext.request.contextPath}/admin/dashboard.jsp">Dashboard</a>
            <a href="${pageContext.request.contextPath}/admin/manage-treks.jsp">Manage Treks</a>
            <a href="${pageContext.request.contextPath}/admin/manage-users.jsp" style="background: #2F4A85; color: white;">Manage Users</a>
            <a href="${pageContext.request.contextPath}/admin/manage-bookings.jsp">Manage Bookings</a>
        </div>
        
        <div class="content">
            <h1 style="margin-bottom: 20px;">Manage Users</h1>
            
            <div class="card">
                <h3>Pending Approvals</h3>
                <table>
                    <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Action</th></tr></thead>
                    <tbody>
                        <% for (User u : pendingUsers) { %>
                        <tr>
                            <td><%= u.getUserId() %></td>
                            <td><%= u.getName() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><a href="${pageContext.request.contextPath}/admin/users?action=approve&id=<%= u.getUserId() %>" class="btn-approve">Approve</a>
                            </td>
                        </tr>
                        <% } %>
                        <% if (pendingUsers.isEmpty()) { %>
                        <tr><td colspan="4">No pending approvals</td></tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <div class="card">
                <h3>All Users</h3>
                <table>
                    <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Role</th><th>Status</th><th>Action</th></tr></thead>
                    <tbody>
                        <% for (User u : allUsers) { %>
                        <tr>
                            <td><%= u.getUserId() %></td>
                            <td><%= u.getName() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><%= u.getRoleId() == 1 ? "Admin" : "User" %></td>
                            <td><%= u.isApproved() ? "Approved" : "Pending" %></td>
                            <td><a href="${pageContext.request.contextPath}/admin/users?action=delete&id=<%= u.getUserId() %>" class="btn-delete" onclick="return confirm('Delete this user?')">Delete</a>
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
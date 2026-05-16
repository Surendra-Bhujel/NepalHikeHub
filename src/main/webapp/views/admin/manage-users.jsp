<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || user.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    List<User> pendingUsers = (List<User>) request.getAttribute("pendingUsers");
    List<User> allUsers = (List<User>) request.getAttribute("allUsers");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Users - NepalHikeHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-brand"><a href="#">🏔️ Admin Panel</a></div>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/views/admin/dashboard.jsp" class="nav-link">Dashboard</a>
                <a href="${pageContext.request.contextPath}/admin/manage-treks" class="nav-link">Manage Treks</a>
                <a href="${pageContext.request.contextPath}/admin/manage-users" class="nav-link active">Manage Users</a>
                <a href="${pageContext.request.contextPath}/signout" class="nav-link">Sign Out</a>
            </div>
        </div>
    </nav>

    <main class="container">
        <h1>Manage Users</h1>

        <h2>Pending Approval</h2>
        <% if (pendingUsers != null && !pendingUsers.isEmpty()) { %>
        <table class="table">
            <thead>
                <tr>
                    <th>Name</th><th>Email</th><th>Phone</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (User u : pendingUsers) { %>
                <tr>
                    <td><%= u.getName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getPhone() %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/manage-users?action=approve&id=<%= u.getUserId() %>" class="btn btn-success">Approve</a>
                        <a href="${pageContext.request.contextPath}/admin/manage-users?action=delete&id=<%= u.getUserId() %>" class="btn btn-danger">Reject</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
            <p>No pending users.</p>
        <% } %>

        <h2>All Users</h2>
        <% if (allUsers != null && !allUsers.isEmpty()) { %>
        <table class="table">
            <thead>
                <tr>
                    <th>Name</th><th>Email</th><th>Phone</th><th>Status</th><th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (User u : allUsers) { %>
                <tr>
                    <td><%= u.getName() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getPhone() %></td>
                    <td><%= u.isApproved() ? "Approved" : "Pending" %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/manage-users?action=delete&id=<%= u.getUserId() %>" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
            <p>No users found.</p>
        <% } %>
    </main>
</body>
</html>
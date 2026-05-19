<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, java.util.List" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    String cp = request.getContextPath();
    List<User> users        = (List<User>) request.getAttribute("users");
    List<User> pendingUsers = (List<User>) request.getAttribute("pendingUsers");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users – NepalHikeHub Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%= cp %>/css/global.css">
    <link rel="stylesheet" href="<%= cp %>/css/admin.css">
    <style>
        .tab-bar { display:flex; gap:0; margin-bottom:1.5rem; border-bottom:2px solid #eee; }
        .tab-btn {
            padding: 10px 24px; background:none; border:none; cursor:pointer;
            font-size:0.9rem; font-weight:600; color:#6c757d;
            border-bottom: 3px solid transparent; margin-bottom:-2px;
        }
        .tab-btn.active { color:#2F4A85; border-bottom-color:#2F4A85; }
        .tab-content { display:none; }
        .tab-content.active { display:block; }
        .pending-badge {
            background:#dc3545; color:white; border-radius:50%;
            width:20px; height:20px; font-size:0.7rem; display:inline-flex;
            align-items:center; justify-content:center; margin-left:6px;
        }
    </style>
</head>
<body>

<jsp:include page="/views/includes/header.jsp" />

<div class="admin-wrapper">
    <jsp:include page="/views/admin/admin-sidebar.jsp" />

    <main class="admin-main">

        <div class="admin-topbar">
            <h1><i class="fas fa-users"></i> Manage Users</h1>
            <span style="color:#6c757d; font-size:0.85rem;">
                <%= users != null ? users.size() : 0 %> total users
            </span>
        </div>

        <%-- Tab Navigation --%>
        <div class="tab-bar">
            <button class="tab-btn active" onclick="switchTab('all', this)">
                <i class="fas fa-users"></i> All Users
            </button>
            <button class="tab-btn" onclick="switchTab('pending', this)">
                <i class="fas fa-clock"></i> Pending Approval
                <% if (pendingUsers != null && !pendingUsers.isEmpty()) { %>
                <span class="pending-badge"><%= pendingUsers.size() %></span>
                <% } %>
            </button>
        </div>

        <%-- ALL USERS TAB --%>
        <div id="tab-all" class="tab-content active">
            <div class="data-card">
                <div class="data-card-header">
                    <h3><i class="fas fa-list"></i> All Registered Users</h3>
                </div>
                <div style="overflow-x:auto;">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>User</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Role</th>
                                <th>Registered</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (users == null || users.isEmpty()) { %>
                            <tr><td colspan="8" style="text-align:center; color:#6c757d; padding:2rem;">No users found.</td></tr>
                            <% } else { for (User u : users) {
                                boolean isCurrentAdmin = (u.getUserId() == currentUser.getUserId());
                            %>
                            <tr>
                                <td><%= u.getUserId() %></td>
                                <td>
                                    <div style="display:flex; align-items:center; gap:10px;">
                                        <div style="width:36px;height:36px;
                                             background:linear-gradient(135deg,#2F4A85,#5A7FBA);
                                             border-radius:50%;display:flex;align-items:center;
                                             justify-content:center;color:white;font-weight:bold;">
                                            <%= u.getName().charAt(0) %>
                                        </div>
                                        <div>
                                            <strong><%= u.getName() %></strong>
                                            <% if (isCurrentAdmin) { %>
                                            <span style="font-size:0.7rem; color:#5A7FBA; margin-left:5px;">(You)</span>
                                            <% } %>
                                        </div>
                                    </div>
                                </td>
                                <td><%= u.getEmail() %></td>
                                <td><%= u.getPhone() != null ? u.getPhone() : "—" %></td>
                                <td>
                                    <% if (u.getRoleId() == 1) { %>
                                    <span style="background:#E1F0F4;color:#2F4A85;padding:3px 8px;border-radius:20px;font-size:0.7rem;font-weight:600;">
                                        <i class="fas fa-crown"></i> Admin
                                    </span>
                                    <% } else { %>
                                    <span style="background:#f8f9fa;color:#6c757d;padding:3px 8px;border-radius:20px;font-size:0.7rem;font-weight:600;">
                                        User
                                    </span>
                                    <% } %>
                                </td>
                                <td><%= u.getCreatedAt() != null ? u.getCreatedAt().toString().substring(0,10) : "—" %></td>
                                <td>
                                    <% if (u.isApproved()) { %>
                                    <span class="status-confirmed">APPROVED</span>
                                    <% } else { %>
                                    <span class="status-pending">PENDING</span>
                                    <% } %>
                                </td>
                                <td>
                                    <% if (!u.isApproved()) { %>
                                    <a href="<%= cp %>/admin/users?action=approve&id=<%= u.getUserId() %>"
                                       class="btn-approve"
                                       onclick="return confirm('Approve <%= u.getName() %>?')">
                                       <i class="fas fa-check"></i> Approve
                                    </a>
                                    <% } %>
                                    <% if (!isCurrentAdmin) { %>
                                    <a href="<%= cp %>/admin/users?action=delete&id=<%= u.getUserId() %>"
                                       class="btn-delete"
                                       onclick="return confirm('Permanently delete user: <%= u.getName() %>?')">
                                       <i class="fas fa-trash"></i> Delete
                                    </a>
                                    <% } %>
                                </td>
                            </tr>
                            <% } } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <%-- PENDING USERS TAB --%>
        <div id="tab-pending" class="tab-content">
            <div class="data-card">
                <div class="data-card-header">
                    <h3><i class="fas fa-user-clock"></i> Pending Approval
                        (<%= pendingUsers != null ? pendingUsers.size() : 0 %>)
                    </h3>
                </div>
                <div style="overflow-x:auto;">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Registered</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% if (pendingUsers == null || pendingUsers.isEmpty()) { %>
                            <tr><td colspan="6" style="text-align:center; color:#6c757d; padding:2rem;">
                                <i class="fas fa-check-circle" style="color:#28a745; font-size:2rem; display:block; margin-bottom:8px;"></i>
                                All users approved! No pending requests.
                            </td></tr>
                            <% } else { for (User u : pendingUsers) { %>
                            <tr style="background:#fffdf0;">
                                <td><%= u.getUserId() %></td>
                                <td>
                                    <div style="display:flex; align-items:center; gap:10px;">
                                        <div style="width:36px;height:36px;
                                             background:linear-gradient(135deg,#f59e0b,#dc3545);
                                             border-radius:50%;display:flex;align-items:center;
                                             justify-content:center;color:white;font-weight:bold;">
                                            <%= u.getName().charAt(0) %>
                                        </div>
                                        <strong><%= u.getName() %></strong>
                                    </div>
                                </td>
                                <td><%= u.getEmail() %></td>
                                <td><%= u.getPhone() != null ? u.getPhone() : "—" %></td>
                                <td><%= u.getCreatedAt() != null ? u.getCreatedAt().toString().substring(0,10) : "—" %></td>
                                <td>
                                    <a href="<%= cp %>/admin/users?action=approve&id=<%= u.getUserId() %>"
                                       class="btn-approve"
                                       onclick="return confirm('Approve <%= u.getName() %>?')">
                                       <i class="fas fa-check"></i> Approve
                                    </a>
                                    <a href="<%= cp %>/admin/users?action=delete&id=<%= u.getUserId() %>"
                                       class="btn-delete"
                                       onclick="return confirm('Reject & delete <%= u.getName() %>?')">
                                       <i class="fas fa-times"></i> Reject
                                    </a>
                                </td>
                            </tr>
                            <% } } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </main>
</div>

<jsp:include page="/views/includes/footer.jsp" />

<script>
    function switchTab(name, btn) {
        document.querySelectorAll('.tab-content').forEach(t => t.classList.remove('active'));
        document.querySelectorAll('.tab-btn').forEach(b => b.classList.remove('active'));
        document.getElementById('tab-' + name).classList.add('active');
        btn.classList.add('active');
    }
    // Mobile sidebar
    const toggle = document.getElementById('menuToggle');
    const sidebar = document.getElementById('adminSidebar');
    if (toggle && sidebar) toggle.addEventListener('click', () => sidebar.classList.toggle('active'));
</script>
</body>
</html>

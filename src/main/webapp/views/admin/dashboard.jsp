<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, com.nepalhikehub.model.Booking, java.util.List" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    String cp = request.getContextPath();

    int totalUsers      = (Integer) request.getAttribute("totalUsers");
    int pendingUsers    = (Integer) request.getAttribute("pendingUsers");
    int totalTreks      = (Integer) request.getAttribute("totalTreks");
    int activeTreks     = (Integer) request.getAttribute("activeTreks");
    int totalBookings   = (Integer) request.getAttribute("totalBookings");
    int pendingBookings = (Integer) request.getAttribute("pendingBookings");
    int confirmedBookings = (Integer) request.getAttribute("confirmedBookings");

    List<Booking> recentBookings = (List<Booking>) request.getAttribute("recentBookings");
    List<User>    recentUsers    = (List<User>)    request.getAttribute("recentUsers");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard – NepalHikeHub</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%= cp %>/css/global.css">
    <link rel="stylesheet" href="<%= cp %>/css/admin.css">
    <style>
        .stat-card.users   .stat-icon { background: #e8f4fd; }
        .stat-card.users   .stat-icon i { color: #2F4A85; }
        .stat-card.treks   .stat-icon { background: #e8f8f0; }
        .stat-card.treks   .stat-icon i { color: #28a745; }
        .stat-card.bookings .stat-icon { background: #fff8e1; }
        .stat-card.bookings .stat-icon i { color: #f59e0b; }
        .stat-card.pending .stat-icon { background: #fde8e8; }
        .stat-card.pending .stat-icon i { color: #dc3545; }
        .stat-sub { font-size: 0.72rem; color: #6c757d; margin-top: 2px; }
        .welcome-banner {
            background: linear-gradient(135deg, #2F4A85, #5A7FBA);
            color: white;
            border-radius: 16px;
            padding: 1.5rem 2rem;
            margin-bottom: 1.5rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .welcome-banner h2 { font-size: 1.4rem; margin-bottom: 0.3rem; }
        .welcome-banner p  { opacity: 0.85; font-size: 0.9rem; }
        .welcome-icon { font-size: 3.5rem; opacity: 0.3; }
    </style>
</head>
<body>

<%-- Navbar (public header, no extra nav for admin) --%>
<jsp:include page="/views/includes/header.jsp" />

<div class="admin-wrapper">
    <jsp:include page="/views/admin/admin-sidebar.jsp" />

    <main class="admin-main">

        <%-- Top Bar --%>
        <div class="admin-topbar">
            <h1><i class="fas fa-tachometer-alt"></i> Dashboard</h1>
            <span class="admin-date" id="adminDate"></span>
        </div>

        <%-- Welcome Banner --%>
        <div class="welcome-banner">
            <div>
                <h2>Welcome back, <%= currentUser.getName() %>!</h2>
                <p>Here's what's happening with NepalHikeHub today.</p>
            </div>
            <i class="fas fa-mountain welcome-icon"></i>
        </div>

        <%-- Stats Grid --%>
        <div class="stats-grid">
            <div class="stat-card users">
                <div class="stat-icon"><i class="fas fa-users"></i></div>
                <div class="stat-info">
                    <h3><%= totalUsers %></h3>
                    <p>Total Users</p>
                    <div class="stat-sub"><%= pendingUsers %> awaiting approval</div>
                </div>
            </div>
            <div class="stat-card treks">
                <div class="stat-icon"><i class="fas fa-hiking"></i></div>
                <div class="stat-info">
                    <h3><%= totalTreks %></h3>
                    <p>Total Treks</p>
                    <div class="stat-sub"><%= activeTreks %> active</div>
                </div>
            </div>
            <div class="stat-card bookings">
                <div class="stat-icon"><i class="fas fa-calendar-check"></i></div>
                <div class="stat-info">
                    <h3><%= totalBookings %></h3>
                    <p>Total Bookings</p>
                    <div class="stat-sub"><%= confirmedBookings %> confirmed</div>
                </div>
            </div>
            <div class="stat-card pending">
                <div class="stat-icon"><i class="fas fa-clock"></i></div>
                <div class="stat-info">
                    <h3><%= pendingBookings %></h3>
                    <p>Pending Bookings</p>
                    <div class="stat-sub">Needs attention</div>
                </div>
            </div>
        </div>

        <%-- Recent Bookings Table --%>
        <div class="data-card">
            <div class="data-card-header">
                <h3><i class="fas fa-calendar-alt"></i> Recent Bookings</h3>
                <a href="<%= cp %>/admin/manage-bookings" class="view-all-link">View All →</a>
            </div>
            <div style="overflow-x: auto;">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>#ID</th>
                            <th>Customer</th>
                            <th>Trek</th>
                            <th>Start Date</th>
                            <th>Persons</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (recentBookings == null || recentBookings.isEmpty()) { %>
                        <tr><td colspan="7" style="text-align:center; color:#6c757d; padding:2rem;">No bookings yet.</td></tr>
                        <% } else { for (Booking b : recentBookings) { %>
                        <tr>
                            <td>#<%= b.getBookingId() %></td>
                            <td>
                                <strong><%= b.getUserName() %></strong><br>
                                <small style="color:#6c757d;"><%= b.getUserEmail() %></small>
                            </td>
                            <td><%= b.getTrekName() %></td>
                            <td><%= b.getTrekStartDate() != null ? b.getTrekStartDate() : "—" %></td>
                            <td><%= b.getNumPersons() %></td>
                            <td>
                                <span class="status-<%= b.getStatus() %>"><%= b.getStatus().toUpperCase() %></span>
                            </td>
                            <td>
                                <% if ("pending".equals(b.getStatus())) { %>
                                <a href="<%= cp %>/admin/manage-bookings?action=confirm&id=<%= b.getBookingId() %>"
                                   class="btn-approve" onclick="return confirm('Confirm this booking?')">Confirm</a>
                                <a href="<%= cp %>/admin/manage-bookings?action=reject&id=<%= b.getBookingId() %>"
                                   class="btn-delete" onclick="return confirm('Reject this booking?')">Reject</a>
                                <% } else { %>
                                <span style="color:#6c757d; font-size:0.8rem;"><%= b.getStatus() %></span>
                                <% } %>
                            </td>
                        </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- Recent Users Table --%>
        <div class="data-card">
            <div class="data-card-header">
                <h3><i class="fas fa-user-plus"></i> Recent Registrations</h3>
                <a href="<%= cp %>/admin/users" class="view-all-link">View All →</a>
            </div>
            <div style="overflow-x: auto;">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Registered</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (recentUsers == null || recentUsers.isEmpty()) { %>
                        <tr><td colspan="6" style="text-align:center; color:#6c757d; padding:2rem;">No users found.</td></tr>
                        <% } else { for (User u : recentUsers) { %>
                        <tr>
                            <td>
                                <div style="display:flex; align-items:center; gap:8px;">
                                    <div style="width:32px;height:32px;background:linear-gradient(135deg,#2F4A85,#5A7FBA);
                                         border-radius:50%;display:flex;align-items:center;justify-content:center;
                                         color:white;font-weight:bold;font-size:0.85rem;">
                                        <%= u.getName().charAt(0) %>
                                    </div>
                                    <%= u.getName() %>
                                </div>
                            </td>
                            <td><%= u.getEmail() %></td>
                            <td><%= u.getPhone() != null ? u.getPhone() : "—" %></td>
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
                                   class="btn-approve" onclick="return confirm('Approve this user?')">Approve</a>
                                <% } %>
                                <a href="<%= cp %>/admin/users?action=delete&id=<%= u.getUserId() %>"
                                   class="btn-delete" onclick="return confirm('Delete user <%= u.getName() %>?')">Delete</a>
                            </td>
                        </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>

    </main>
</div>

<jsp:include page="/views/includes/footer.jsp" />

<script>
    // Live date in topbar
    const d = new Date();
    document.getElementById('adminDate').textContent =
        d.toLocaleDateString('en-US', { weekday:'long', year:'numeric', month:'long', day:'numeric' });

    // Mobile sidebar toggle
    const toggle = document.getElementById('menuToggle');
    const sidebar = document.getElementById('adminSidebar');
    if (toggle && sidebar) {
        toggle.addEventListener('click', () => sidebar.classList.toggle('active'));
    }
</script>
</body>
</html>

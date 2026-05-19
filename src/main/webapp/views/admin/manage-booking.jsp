<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, com.nepalhikehub.model.Booking, java.util.List" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    String cp = request.getContextPath();
    List<Booking> bookings    = (List<Booking>) request.getAttribute("bookings");
    int pendingCount   = request.getAttribute("pendingCount")   != null ? (Integer) request.getAttribute("pendingCount")   : 0;
    int confirmedCount = request.getAttribute("confirmedCount") != null ? (Integer) request.getAttribute("confirmedCount") : 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Bookings – NepalHikeHub Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%= cp %>/css/global.css">
    <link rel="stylesheet" href="<%= cp %>/css/admin.css">
    <style>
        .filter-bar {
            display:flex; gap:1rem; align-items:center; flex-wrap:wrap;
            background:white; padding:1rem 1.5rem; border-radius:12px;
            margin-bottom:1.5rem; box-shadow:0 2px 10px rgba(0,0,0,0.05);
        }
        .filter-bar select, .filter-bar input {
            padding:8px 12px; border:1px solid #ddd; border-radius:8px; font-size:0.85rem;
        }
        .filter-bar label { font-size:0.85rem; font-weight:600; color:#1D1E22; }
        .status-rejected { background:#f8d7da; color:#721c24; padding:4px 10px; border-radius:20px; font-size:0.7rem; font-weight:600; }
    </style>
</head>
<body>

<jsp:include page="/views/includes/header.jsp" />

<div class="admin-wrapper">
    <jsp:include page="/views/admin/admin-sidebar.jsp" />

    <main class="admin-main">

        <div class="admin-topbar">
            <h1><i class="fas fa-calendar-check"></i> Manage Bookings</h1>
            <span style="color:#6c757d; font-size:0.85rem;">
                <%= bookings != null ? bookings.size() : 0 %> total &nbsp;|&nbsp;
                <span style="color:#f59e0b;"><%= pendingCount %> pending</span> &nbsp;|&nbsp;
                <span style="color:#28a745;"><%= confirmedCount %> confirmed</span>
            </span>
        </div>

        <%-- Filter Bar --%>
        <div class="filter-bar">
            <label>Filter by status:</label>
            <select id="statusFilter" onchange="filterTable()">
                <option value="">All Statuses</option>
                <option value="pending">Pending</option>
                <option value="confirmed">Confirmed</option>
                <option value="rejected">Rejected</option>
                <option value="cancelled">Cancelled</option>
            </select>
            <label>Search:</label>
            <input type="text" id="searchInput" placeholder="Trek or customer name..." oninput="filterTable()">
        </div>

        <%-- Bookings Table --%>
        <div class="data-card">
            <div class="data-card-header">
                <h3><i class="fas fa-list"></i> All Bookings</h3>
            </div>
            <div style="overflow-x:auto;">
                <table class="data-table" id="bookingsTable">
                    <thead>
                        <tr>
                            <th>#ID</th>
                            <th>Customer</th>
                            <th>Trek</th>
                            <th>Booked On</th>
                            <th>Start Date</th>
                            <th>Persons</th>
                            <th>Total (est.)</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (bookings == null || bookings.isEmpty()) { %>
                        <tr>
                            <td colspan="9" style="text-align:center; color:#6c757d; padding:3rem;">
                                <i class="fas fa-calendar-times" style="font-size:2.5rem; color:#ddd; display:block; margin-bottom:10px;"></i>
                                No bookings found yet.
                            </td>
                        </tr>
                        <% } else { for (Booking b : bookings) {
                            // Calculate estimated total
                            java.math.BigDecimal total = null;
                            if (b.getTrekPrice() != null) {
                                total = b.getTrekPrice().multiply(new java.math.BigDecimal(b.getNumPersons()));
                            }
                        %>
                        <tr data-status="<%= b.getStatus() %>"
                            data-name="<%= b.getUserName().toLowerCase() %> <%= b.getTrekName().toLowerCase() %>">
                            <td><strong>#<%= b.getBookingId() %></strong></td>
                            <td>
                                <div>
                                    <strong><%= b.getUserName() %></strong><br>
                                    <small style="color:#6c757d;"><%= b.getUserEmail() %></small>
                                </div>
                            </td>
                            <td><%= b.getTrekName() %></td>
                            <td><%= b.getBookingDate() != null ? b.getBookingDate() : "—" %></td>
                            <td><%= b.getTrekStartDate() != null ? b.getTrekStartDate() : "—" %></td>
                            <td><%= b.getNumPersons() %></td>
                            <td>
                                <% if (total != null) { %>
                                <strong>$<%= total %></strong>
                                <% } else { %> — <% } %>
                            </td>
                            <td>
                                <span class="status-<%= b.getStatus() %>">
                                    <%= b.getStatus().toUpperCase() %>
                                </span>
                            </td>
                            <td>
                                <% if ("pending".equals(b.getStatus())) { %>
                                <a href="<%= cp %>/admin/manage-bookings?action=confirm&id=<%= b.getBookingId() %>"
                                   class="btn-approve"
                                   onclick="return confirm('Confirm booking #<%= b.getBookingId() %>?')">
                                    <i class="fas fa-check"></i> Confirm
                                </a>
                                <a href="<%= cp %>/admin/manage-bookings?action=reject&id=<%= b.getBookingId() %>"
                                   class="btn-delete"
                                   onclick="return confirm('Reject booking #<%= b.getBookingId() %>?')">
                                    <i class="fas fa-times"></i> Reject
                                </a>
                                <% } else if ("confirmed".equals(b.getStatus())) { %>
                                <a href="<%= cp %>/admin/manage-bookings?action=reject&id=<%= b.getBookingId() %>"
                                   class="btn-delete"
                                   onclick="return confirm('Cancel confirmed booking #<%= b.getBookingId() %>?')">
                                    <i class="fas fa-ban"></i> Cancel
                                </a>
                                <% } else { %>
                                <a href="<%= cp %>/admin/manage-bookings?action=delete&id=<%= b.getBookingId() %>"
                                   class="btn-delete" style="background:#6c757d;"
                                   onclick="return confirm('Permanently delete booking #<%= b.getBookingId() %>?')">
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

    </main>
</div>

<jsp:include page="/views/includes/footer.jsp" />

<script>
    function filterTable() {
        const statusVal = document.getElementById('statusFilter').value.toLowerCase();
        const searchVal = document.getElementById('searchInput').value.toLowerCase();
        const rows = document.querySelectorAll('#bookingsTable tbody tr[data-status]');

        rows.forEach(row => {
            const status = row.getAttribute('data-status') || '';
            const name   = row.getAttribute('data-name')   || '';
            const matchStatus = !statusVal || status === statusVal;
            const matchSearch = !searchVal || name.includes(searchVal);
            row.style.display = (matchStatus && matchSearch) ? '' : 'none';
        });
    }

    // Mobile sidebar
    const toggle  = document.getElementById('menuToggle');
    const sidebar = document.getElementById('adminSidebar');
    if (toggle && sidebar) toggle.addEventListener('click', () => sidebar.classList.toggle('active'));
</script>
</body>
</html>

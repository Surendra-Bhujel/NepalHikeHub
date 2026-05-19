<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, com.nepalhikehub.model.Trek, java.util.List" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    String cp = request.getContextPath();
    List<Trek> treks = (List<Trek>) request.getAttribute("treks");
    String successMsg = (String) request.getAttribute("successMessage");
    String errorMsg   = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Treks – NepalHikeHub Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%= cp %>/css/global.css">
    <link rel="stylesheet" href="<%= cp %>/css/admin.css">
    <style>
        .alert { padding: 12px 16px; border-radius: 8px; margin-bottom: 1rem; font-size: 0.9rem; }
        .alert-success { background: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .alert-danger  { background: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
        .add-toggle-btn {
            background: #2F4A85; color: white; border: none;
            padding: 10px 20px; border-radius: 8px; cursor: pointer;
            font-size: 0.9rem; font-weight: 600; display: flex; align-items: center; gap: 8px;
        }
        .add-toggle-btn:hover { background: #5A7FBA; }
        #addForm { display: none; }
        .trek-img { width: 50px; height: 40px; object-fit: cover; border-radius: 6px; }
        .badge-active   { background:#d4edda; color:#155724; padding:3px 8px; border-radius:20px; font-size:0.7rem; font-weight:600; }
        .badge-inactive { background:#f8d7da; color:#721c24; padding:3px 8px; border-radius:20px; font-size:0.7rem; font-weight:600; }
        .difficulty-easy     { color: #28a745; font-weight:600; }
        .difficulty-moderate { color: #f59e0b; font-weight:600; }
        .difficulty-hard     { color: #dc3545; font-weight:600; }
        .difficulty-extreme  { color: #6f1c1c; font-weight:600; }
    </style>
</head>
<body>

<jsp:include page="/views/includes/header.jsp" />

<div class="admin-wrapper">
    <jsp:include page="/views/admin/admin-sidebar.jsp" />

    <main class="admin-main">

        <div class="admin-topbar">
            <h1><i class="fas fa-hiking"></i> Manage Treks</h1>
            <button class="add-toggle-btn" onclick="toggleAddForm()">
                <i class="fas fa-plus"></i> Add New Trek
            </button>
        </div>

        <% if (successMsg != null) { %>
        <div class="alert alert-success"><i class="fas fa-check-circle"></i> <%= successMsg %></div>
        <% } %>
        <% if (errorMsg != null) { %>
        <div class="alert alert-danger"><i class="fas fa-exclamation-circle"></i> <%= errorMsg %></div>
        <% } %>

        <%-- ADD TREK FORM --%>
        <div id="addForm" class="admin-form">
            <h3 style="color:#2F4A85; margin-bottom:1.2rem; font-size:1.1rem;">
                <i class="fas fa-plus-circle"></i> Add New Trek
            </h3>
            <form action="<%= cp %>/admin/manage-treks" method="post">
                <input type="hidden" name="action" value="add">
                <div class="form-row">
                    <div class="form-group">
                        <label>Trek Name *</label>
                        <input type="text" name="trekName" required placeholder="e.g. Annapurna Base Camp">
                    </div>
                    <div class="form-group">
                        <label>Region *</label>
                        <input type="text" name="region" required placeholder="e.g. Annapurna">
                    </div>
                    <div class="form-group">
                        <label>Difficulty *</label>
                        <select name="difficulty" required>
                            <option value="">Select</option>
                            <option value="Easy">Easy</option>
                            <option value="Moderate">Moderate</option>
                            <option value="Hard">Hard</option>
                            <option value="Extreme">Extreme</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Duration (days) *</label>
                        <input type="number" name="durationDays" required min="1" placeholder="7">
                    </div>
                    <div class="form-group">
                        <label>Price (USD) *</label>
                        <input type="number" name="price" required step="0.01" min="0" placeholder="350.00">
                    </div>
                    <div class="form-group">
                        <label>Max Group Size</label>
                        <input type="number" name="maxGroupSize" value="20" min="1">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Start Location</label>
                        <input type="text" name="startLocation" placeholder="e.g. Nayapul">
                    </div>
                    <div class="form-group">
                        <label>End Location</label>
                        <input type="text" name="endLocation" placeholder="e.g. Pokhara">
                    </div>
                    <div class="form-group">
                        <label>Distance (km)</label>
                        <input type="number" name="distanceKm" step="0.01" placeholder="110.5">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Image URL</label>
                        <input type="text" name="imageUrl" placeholder="https://... or /image/trek.jpg">
                    </div>
                    <div class="form-group" style="grid-column: span 2;">
                        <label>Description</label>
                        <textarea name="description" rows="3" placeholder="Brief description of the trek..."></textarea>
                    </div>
                </div>
                <div style="display:flex; gap:1rem;">
                    <button type="submit" class="btn-primary">
                        <i class="fas fa-save"></i> Save Trek
                    </button>
                    <button type="button" onclick="toggleAddForm()"
                            style="background:#6c757d; color:white; border:none; padding:10px 20px; border-radius:8px; cursor:pointer;">
                        Cancel
                    </button>
                </div>
            </form>
        </div>

        <%-- TREKS TABLE --%>
        <div class="data-card">
            <div class="data-card-header">
                <h3><i class="fas fa-list"></i> All Treks (<%= treks != null ? treks.size() : 0 %>)</h3>
            </div>
            <div style="overflow-x: auto;">
                <table class="data-table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Image</th>
                            <th>Trek Name</th>
                            <th>Region</th>
                            <th>Difficulty</th>
                            <th>Duration</th>
                            <th>Price</th>
                            <th>Group</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (treks == null || treks.isEmpty()) { %>
                        <tr><td colspan="10" style="text-align:center; color:#6c757d; padding:2rem;">
                            No treks found. Add your first trek above.
                        </td></tr>
                        <% } else { for (Trek t : treks) { %>
                        <tr>
                            <td><%= t.getTrekId() %></td>
                            <td>
                                <% if (t.getImageUrl() != null && !t.getImageUrl().isEmpty()) { %>
                                <img src="<%= t.getImageUrl() %>" alt="<%= t.getTrekName() %>" class="trek-img"
                                     onerror="this.src='<%= cp %>/image/default-trek.jpg'">
                                <% } else { %>
                                <div style="width:50px;height:40px;background:#E1F0F4;border-radius:6px;
                                     display:flex;align-items:center;justify-content:center;">
                                    <i class="fas fa-mountain" style="color:#5A7FBA;"></i>
                                </div>
                                <% } %>
                            </td>
                            <td><strong><%= t.getTrekName() %></strong></td>
                            <td><%= t.getRegion() != null ? t.getRegion() : "—" %></td>
                            <td>
                                <span class="difficulty-<%= t.getDifficulty().toLowerCase() %>">
                                    <%= t.getDifficulty() %>
                                </span>
                            </td>
                            <td><%= t.getDurationDays() %> days</td>
                            <td>$<%= t.getPrice() %></td>
                            <td><%= t.getMaxGroupSize() %></td>
                            <td>
                                <% if (t.isActive()) { %>
                                <span class="badge-active">Active</span>
                                <% } else { %>
                                <span class="badge-inactive">Inactive</span>
                                <% } %>
                            </td>
                            <td>
                                <a href="<%= cp %>/admin/manage-treks?action=edit&id=<%= t.getTrekId() %>"
                                   class="btn-edit"><i class="fas fa-edit"></i> Edit</a>
                                <a href="<%= cp %>/admin/manage-treks?action=delete&id=<%= t.getTrekId() %>"
                                   class="btn-delete"
                                   onclick="return confirm('Deactivate trek: <%= t.getTrekName() %>?')">
                                    <i class="fas fa-eye-slash"></i> Deactivate
                                </a>
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
    function toggleAddForm() {
        const form = document.getElementById('addForm');
        form.style.display = form.style.display === 'none' || form.style.display === '' ? 'block' : 'none';
        if (form.style.display === 'block') {
            form.scrollIntoView({ behavior: 'smooth' });
        }
    }
    // Auto-open form if there was an error
    <% if (errorMsg != null) { %>
    document.getElementById('addForm').style.display = 'block';
    <% } %>

    // Mobile sidebar
    const toggle = document.getElementById('menuToggle');
    const sidebar = document.getElementById('adminSidebar');
    if (toggle && sidebar) toggle.addEventListener('click', () => sidebar.classList.toggle('active'));
</script>
</body>
</html>

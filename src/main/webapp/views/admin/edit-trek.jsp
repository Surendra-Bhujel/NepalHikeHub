<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, com.nepalhikehub.model.Trek" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null || currentUser.getRoleId() != 1) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    String cp = request.getContextPath();
    Trek trek = (Trek) request.getAttribute("trek");
    if (trek == null) {
        response.sendRedirect(cp + "/admin/manage-treks");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Trek – NepalHikeHub Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%= cp %>/css/global.css">
    <link rel="stylesheet" href="<%= cp %>/css/admin.css">
</head>
<body>

<jsp:include page="/views/includes/header.jsp" />

<div class="admin-wrapper">
    <jsp:include page="/views/admin/admin-sidebar.jsp" />

    <main class="admin-main">

        <div class="admin-topbar">
            <h1><i class="fas fa-edit"></i> Edit Trek</h1>
            <a href="<%= cp %>/admin/manage-treks"
               style="color:#5A7FBA; text-decoration:none; font-size:0.9rem;">
                <i class="fas fa-arrow-left"></i> Back to Treks
            </a>
        </div>

        <div class="admin-form">
            <h3 style="color:#2F4A85; margin-bottom:1.5rem; font-size:1.1rem;">
                <i class="fas fa-mountain"></i> Editing: <%= trek.getTrekName() %>
            </h3>
            <form action="<%= cp %>/admin/manage-treks" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="trekId" value="<%= trek.getTrekId() %>">

                <div class="form-row">
                    <div class="form-group">
                        <label>Trek Name *</label>
                        <input type="text" name="trekName" required value="<%= trek.getTrekName() %>">
                    </div>
                    <div class="form-group">
                        <label>Region</label>
                        <input type="text" name="region" value="<%= trek.getRegion() != null ? trek.getRegion() : "" %>">
                    </div>
                    <div class="form-group">
                        <label>Difficulty *</label>
                        <select name="difficulty" required>
                            <option value="Easy"     <%= "Easy".equals(trek.getDifficulty())     ? "selected" : "" %>>Easy</option>
                            <option value="Moderate" <%= "Moderate".equals(trek.getDifficulty()) ? "selected" : "" %>>Moderate</option>
                            <option value="Hard"     <%= "Hard".equals(trek.getDifficulty())     ? "selected" : "" %>>Hard</option>
                            <option value="Extreme"  <%= "Extreme".equals(trek.getDifficulty())  ? "selected" : "" %>>Extreme</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Duration (days) *</label>
                        <input type="number" name="durationDays" required min="1" value="<%= trek.getDurationDays() %>">
                    </div>
                    <div class="form-group">
                        <label>Price (USD) *</label>
                        <input type="number" name="price" required step="0.01" value="<%= trek.getPrice() %>">
                    </div>
                    <div class="form-group">
                        <label>Max Group Size</label>
                        <input type="number" name="maxGroupSize" min="1" value="<%= trek.getMaxGroupSize() %>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Start Location</label>
                        <input type="text" name="startLocation" value="<%= trek.getStartLocation() != null ? trek.getStartLocation() : "" %>">
                    </div>
                    <div class="form-group">
                        <label>End Location</label>
                        <input type="text" name="endLocation" value="<%= trek.getEndLocation() != null ? trek.getEndLocation() : "" %>">
                    </div>
                    <div class="form-group">
                        <label>Distance (km)</label>
                        <input type="number" name="distanceKm" step="0.01" value="<%= trek.getDistanceKm() != null ? trek.getDistanceKm() : "" %>">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Image URL</label>
                        <input type="text" name="imageUrl" value="<%= trek.getImageUrl() != null ? trek.getImageUrl() : "" %>">
                    </div>
                    <div class="form-group">
                        <label>Active</label>
                        <div style="display:flex; align-items:center; gap:8px; margin-top:8px;">
                            <input type="checkbox" name="isActive" id="isActive"
                                   <%= trek.isActive() ? "checked" : "" %>
                                   style="width:18px; height:18px; cursor:pointer;">
                            <label for="isActive" style="cursor:pointer; font-weight:normal;">Trek is active and visible to users</label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" rows="4"><%= trek.getDescription() != null ? trek.getDescription() : "" %></textarea>
                </div>

                <div style="display:flex; gap:1rem; margin-top:1rem;">
                    <button type="submit" class="btn-primary">
                        <i class="fas fa-save"></i> Update Trek
                    </button>
                    <a href="<%= cp %>/admin/manage-treks"
                       style="background:#6c757d; color:white; border:none; padding:10px 20px;
                              border-radius:8px; cursor:pointer; text-decoration:none; font-size:0.9rem;
                              display:inline-flex; align-items:center;">
                        Cancel
                    </a>
                </div>
            </form>
        </div>

    </main>
</div>

<jsp:include page="/views/includes/footer.jsp" />

<script>
    const toggle = document.getElementById('menuToggle');
    const sidebar = document.getElementById('adminSidebar');
    if (toggle && sidebar) toggle.addEventListener('click', () => sidebar.classList.toggle('active'));
</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String currentURI = request.getRequestURI();
    String cp = request.getContextPath();
%>
<aside class="admin-sidebar" id="adminSidebar">
    <div class="admin-sidebar-header">
        <h3><i class="fas fa-mountain"></i> Admin Panel</h3>
        <p>NepalHikeHub Management</p>
    </div>
    <ul class="admin-sidebar-menu">
        <li>
            <a href="<%= cp %>/admin/dashboard"
               class="<%= currentURI.contains("/admin/dashboard") ? "active" : "" %>">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
        </li>
        <li>
            <a href="<%= cp %>/admin/manage-treks"
               class="<%= currentURI.contains("manage-treks") ? "active" : "" %>">
                <i class="fas fa-hiking"></i> Manage Treks
            </a>
        </li>
        <li>
            <a href="<%= cp %>/admin/manage-bookings"
               class="<%= currentURI.contains("manage-bookings") ? "active" : "" %>">
                <i class="fas fa-calendar-check"></i> Manage Bookings
            </a>
        </li>
        <li>
            <a href="<%= cp %>/admin/users"
               class="<%= currentURI.contains("/admin/users") ? "active" : "" %>">
                <i class="fas fa-users"></i> Manage Users
            </a>
        </li>
        <li style="margin-top: 1.5rem; border-top: 1px solid rgba(255,255,255,0.1); padding-top: 1rem;">
            <a href="<%= cp %>/home.jsp">
                <i class="fas fa-globe"></i> View Site
            </a>
        </li>
        <li>
            <a href="<%= cp %>/signout">
                <i class="fas fa-sign-out-alt"></i> Sign Out
            </a>
        </li>
    </ul>
</aside>

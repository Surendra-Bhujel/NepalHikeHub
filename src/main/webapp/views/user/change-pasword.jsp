<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Change Password</div>
            <h1>Change Password</h1>
        </div>
    </div>
    
    <div class="profile-container">
        <div class="profile-sidebar">
            <div class="profile-avatar">
                <i class="fas fa-user-circle"></i>
                <h3><%= currentUser.getName() %></h3>
            </div>
            <div class="profile-menu">
                <a href="${pageContext.request.contextPath}/views/user/profile.jsp"><i class="fas fa-user"></i> Profile Info</a>
                <a href="${pageContext.request.contextPath}/views/user/change-password.jsp" class="active"><i class="fas fa-lock"></i> Change Password</a>
                <a href="${pageContext.request.contextPath}/views/user/my-bookings.jsp"><i class="fas fa-ticket-alt"></i> My Bookings</a>
                <a href="${pageContext.request.contextPath}/views/user/wishlist.jsp"><i class="fas fa-heart"></i> Wishlist</a>
            </div>
        </div>
        
        <div class="profile-content">
            <h2>Change Password</h2>
            
            <form action="${pageContext.request.contextPath}/user/change-password" method="post" id="passwordForm">
                <div class="form-group">
                    <label>Current Password</label>
                    <input type="password" name="currentPassword" required>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" name="newPassword" id="newPassword" required>
                    <small>Minimum 6 characters</small>
                </div>
                <div class="form-group">
                    <label>Confirm New Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" required>
                </div>
                <button type="submit" class="btn-submit">Update Password</button>
            </form>
        </div>
    </div>
</main>

<script>
document.getElementById('passwordForm').addEventListener('submit', function(e) {
    var newPwd = document.getElementById('newPassword').value;
    var confirmPwd = document.getElementById('confirmPassword').value;
    if (newPwd !== confirmPwd) {
        e.preventDefault();
        alert('New passwords do not match!');
    }
    if (newPwd.length < 6) {
        e.preventDefault();
        alert('Password must be at least 6 characters!');
    }
});
</script>

<jsp:include page="/views/includes/footer.jsp" />
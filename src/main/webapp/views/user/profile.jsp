<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    String successMsg = request.getParameter("success");
    String errorMsg = request.getParameter("error");
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > My Profile</div>
            <h1>My Profile</h1>
        </div>
    </div>
    
    <div class="profile-container">
        <div class="profile-sidebar">
            <div class="profile-avatar">
                <i class="fas fa-user-circle"></i>
                <h3><%= currentUser.getName() %></h3>
                <p><%= currentUser.getEmail() %></p>
            </div>
            <div class="profile-menu">
                <a href="${pageContext.request.contextPath}/views/user/profile.jsp" class="active"><i class="fas fa-user"></i> Profile Info</a>
                <a href="${pageContext.request.contextPath}/views/user/change-password.jsp"><i class="fas fa-lock"></i> Change Password</a>
                <a href="${pageContext.request.contextPath}/views/user/my-bookings.jsp"><i class="fas fa-ticket-alt"></i> My Bookings</a>
                <a href="${pageContext.request.contextPath}/views/user/wishlist.jsp"><i class="fas fa-heart"></i> Wishlist</a>
            </div>
        </div>
        
        <div class="profile-content">
            <h2>Profile Information</h2>
            
            <% if (successMsg != null) { %>
                <div class="alert alert-success">Profile updated successfully!</div>
            <% } %>
            <% if (errorMsg != null) { %>
                <div class="alert alert-error"><%= errorMsg %></div>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/user/update-profile" method="post">
                <div class="form-group">
                    <label>Full Name</label>
                    <input type="text" name="name" value="<%= currentUser.getName() %>" required>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" value="<%= currentUser.getEmail() %>" required readonly>
                </div>
                <div class="form-group">
                    <label>Phone Number</label>
                    <input type="tel" name="phone" value="<%= currentUser.getPhone() != null ? currentUser.getPhone() : "" %>">
                </div>
                <button type="submit" class="btn-submit">Update Profile</button>
            </form>
        </div>
    </div>
</main>

<jsp:include page="/views/includes/footer.jsp" />
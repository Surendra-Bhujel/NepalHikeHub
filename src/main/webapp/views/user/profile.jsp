<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.UserDAO" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    String message = null;
    String messageType = null;
    String action = request.getParameter("action");
    
    if ("update".equals(action)) {
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        
        if (name != null && !name.trim().isEmpty()) {
            UserDAO userDAO = new UserDAO();
            currentUser.setName(name);
            currentUser.setPhone(phone);
            
            if (userDAO.updateUserProfile(currentUser)) {
                session.setAttribute("user", currentUser);
                message = "Profile updated successfully!";
                messageType = "success";
            } else {
                message = "Failed to update profile";
                messageType = "error";
            }
        } else {
            message = "Name cannot be empty";
            messageType = "error";
        }
    }
%>
<jsp:include page="/views/includes/header.jsp" />

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Profile</div>
            <h1>My Profile</h1>
        </div>
    </div>
    
    <div class="profile-container">
        <div class="profile-card">
            <div class="profile-header">
                <div class="profile-avatar">
                    <i class="fas fa-user-circle"></i>
                </div>
                <h2><%= currentUser.getName() %></h2>
                <p><%= currentUser.getEmail() %></p>
                <span class="role-badge"><%= currentUser.getRoleId() == 1 ? "Administrator" : "Adventurer" %></span>
            </div>
            
            <% if (message != null) { %>
                <div class="alert alert-<%= messageType %>"><%= message %></div>
            <% } %>
            
            <form method="post" class="profile-form">
                <input type="hidden" name="action" value="update">
                <div class="form-group">
                    <label><i class="fas fa-user"></i> Full Name</label>
                    <input type="text" name="name" value="<%= currentUser.getName() %>" required>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-envelope"></i> Email Address</label>
                    <input type="email" value="<%= currentUser.getEmail() %>" disabled>
                    <small>Email cannot be changed</small>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-phone"></i> Phone Number</label>
                    <input type="tel" name="phone" value="<%= currentUser.getPhone() != null ? currentUser.getPhone() : "" %>" placeholder="Enter your phone number">
                    <small>10-digit mobile number (e.g., 9800000000)</small>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn-save"><i class="fas fa-save"></i> Update Profile</button>
                    <a href="${pageContext.request.contextPath}/views/user/change-password-direct.jsp" class="btn-change"><i class="fas fa-key"></i> Change Password</a>
                </div>
            </form>
        </div>
    </div>
</main>

<style>
.profile-container {
    max-width: 600px;
    margin: 0 auto;
    padding: 2rem 5% 4rem;
}
.profile-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
}
.profile-header {
    background: linear-gradient(135deg, #2F4A85, #5A7FBA);
    color: white;
    text-align: center;
    padding: 2rem;
}
.profile-avatar i {
    font-size: 4rem;
    margin-bottom: 1rem;
}
.profile-header h2 {
    margin-bottom: 0.3rem;
}
.role-badge {
    display: inline-block;
    background: rgba(255,255,255,0.2);
    padding: 0.3rem 1rem;
    border-radius: 50px;
    font-size: 0.8rem;
    margin-top: 0.5rem;
}
.profile-form {
    padding: 2rem;
}
.form-group {
    margin-bottom: 1.5rem;
}
.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: #333;
}
.form-group label i {
    margin-right: 0.5rem;
    color: #5A7FBA;
}
.form-group input {
    width: 100%;
    padding: 0.8rem 1rem;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    font-size: 1rem;
    transition: all 0.3s;
}
.form-group input:focus {
    outline: none;
    border-color: #5A7FBA;
}
.form-group input:disabled {
    background: #f8f9fa;
    cursor: not-allowed;
}
.form-group small {
    display: block;
    margin-top: 0.3rem;
    color: #6c757d;
    font-size: 0.75rem;
}
.form-actions {
    display: flex;
    gap: 1rem;
    margin-top: 1.5rem;
}
.btn-save, .btn-change {
    padding: 0.8rem 1.5rem;
    border-radius: 10px;
    text-decoration: none;
    font-weight: 600;
    cursor: pointer;
    border: none;
    font-size: 0.9rem;
    transition: all 0.3s;
    text-align: center;
    flex: 1;
}
.btn-save {
    background: #2F4A85;
    color: white;
}
.btn-save:hover {
    background: #5A7FBA;
    transform: translateY(-2px);
}
.btn-change {
    background: #f0f2f5;
    color: #2F4A85;
}
.btn-change:hover {
    background: #e0e0e0;
    transform: translateY(-2px);
}
.alert {
    padding: 0.8rem 1rem;
    margin: 1rem 2rem;
    border-radius: 10px;
}
.alert-success {
    background: #d4edda;
    color: #28a745;
    border: 1px solid #28a745;
}
.alert-error {
    background: #f8d7da;
    color: #dc3545;
    border: 1px solid #dc3545;
}
@media (max-width: 768px) {
    .form-actions {
        flex-direction: column;
    }
}
</style>

<jsp:include page="/views/includes/footer.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.UserDAO" %>
<%@ page import="com.nepalhikehub.util.PasswordEncryption" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    String message = null;
    String messageType = null;
    String action = request.getParameter("action");
    
    if ("change".equals(action)) {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (newPassword == null || newPassword.length() < 6) {
            message = "Password must be at least 6 characters";
            messageType = "error";
        } else if (!newPassword.equals(confirmPassword)) {
            message = "New passwords do not match";
            messageType = "error";
        } else {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserById(currentUser.getUserId());
            
            if (user != null && PasswordEncryption.verifyPassword(currentPassword, user.getPasswordHash())) {
                String newHashedPassword = PasswordEncryption.hashPassword(newPassword);
                if (userDAO.updatePassword(currentUser.getUserId(), newHashedPassword)) {
                    message = "Password changed successfully! Please login again.";
                    messageType = "success";
                    session.invalidate();
                    response.setHeader("Refresh", "2; URL=" + request.getContextPath() + "/views/auth/signin.jsp");
                } else {
                    message = "Failed to update password";
                    messageType = "error";
                }
            } else {
                message = "Current password is incorrect";
                messageType = "error";
            }
        }
    }
%>
<jsp:include page="/views/includes/header.jsp" />

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Change Password</div>
            <h1>Change Password</h1>
        </div>
    </div>
    
    <div class="password-container">
        <!-- BACK TO DASHBOARD BUTTON -->
        <div style="margin-bottom: 20px;">
            <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp" class="btn-back-dashboard">
                <i class="fas fa-arrow-left"></i> Back to Dashboard
            </a>
        </div>
        
        <div class="password-card">
            <div class="password-header">
                <i class="fas fa-lock"></i>
                <h2>Change Your Password</h2>
                <p>Please enter your current password and new password</p>
            </div>
            
            <% if (message != null) { %>
                <div class="alert alert-<%= messageType %>"><%= message %></div>
            <% } %>
            
            <form method="post" id="passwordForm">
                <input type="hidden" name="action" value="change">
                <div class="form-group">
                    <label><i class="fas fa-key"></i> Current Password</label>
                    <input type="password" name="currentPassword" required>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-lock"></i> New Password</label>
                    <input type="password" name="newPassword" id="newPassword" required>
                    <small>Minimum 6 characters</small>
                </div>
                <div class="form-group">
                    <label><i class="fas fa-check-circle"></i> Confirm New Password</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" required>
                </div>
                <button type="submit" class="btn-submit">Update Password</button>
            </form>
            
            <div class="back-link">
                <a href="${pageContext.request.contextPath}/views/user/profile.jsp">← Back to Profile</a>
            </div>
        </div>
    </div>
</main>

<style>
.password-container {
    max-width: 500px;
    margin: 0 auto;
    padding: 2rem 5% 4rem;
}
.btn-back-dashboard {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    padding: 10px 20px;
    background: #6c757d;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    transition: all 0.3s;
    margin-bottom: 20px;
}
.btn-back-dashboard:hover {
    background: #5a6268;
    transform: translateX(-3px);
}
.password-card {
    background: white;
    border-radius: 20px;
    padding: 2rem;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
}
.password-header {
    text-align: center;
    margin-bottom: 2rem;
}
.password-header i {
    font-size: 3rem;
    color: #5A7FBA;
}
.password-header h2 {
    color: #2F4A85;
    margin-top: 0.5rem;
}
.form-group {
    margin-bottom: 1.2rem;
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
    padding: 0.8rem;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    font-size: 1rem;
}
.form-group input:focus {
    outline: none;
    border-color: #5A7FBA;
}
.form-group small {
    display: block;
    margin-top: 0.3rem;
    color: #6c757d;
    font-size: 0.75rem;
}
.btn-submit {
    width: 100%;
    padding: 0.8rem;
    background: #2F4A85;
    color: white;
    border: none;
    border-radius: 10px;
    font-weight: 600;
    font-size: 1rem;
    cursor: pointer;
    transition: all 0.3s;
}
.btn-submit:hover {
    background: #5A7FBA;
    transform: translateY(-2px);
}
.back-link {
    text-align: center;
    margin-top: 1.5rem;
}
.back-link a {
    color: #5A7FBA;
    text-decoration: none;
}
.back-link a:hover {
    text-decoration: underline;
}
.alert {
    padding: 0.8rem;
    border-radius: 10px;
    margin-bottom: 1rem;
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
    .password-card {
        padding: 1.5rem;
    }
}
</style>

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
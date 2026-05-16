<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser != null) {
        response.sendRedirect(request.getContextPath() + "/home.jsp");
        return;
    }
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signup.css">

<main>
    <div class="page-header">
        <div class="container"><div class="breadcrumb">Home > Sign Up</div><h1>Create New Account</h1></div>
    </div>
    
    <div class="signup-container">
        <div class="signup-card">
            <div class="signup-header">
                <i class="fas fa-user-plus"></i>
                <h2>Join NepalHikeHub</h2>
                <p>Start your adventure today</p>
            </div>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-error"><%= request.getAttribute("errorMessage") %></div>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/signup" method="post" id="signupForm">
                <div class="form-group">
                    <label>Full Name *</label>
                    <input type="text" name="name" placeholder="Full name" required>
                </div>
                <div class="form-group">
                    <label>Your Email *</label>
                    <input type="email" name="email" placeholder="Full Email" required>
                </div>
                <div class="form-group">
                    <label>Country *</label>
                    <select name="country" required>
                        <option value="">Select Country</option>
                        <option>Nepal</option><option>USA</option><option>UK</option>
                        <option>Australia</option><option>Canada</option><option>India</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Contact Number</label>
                    <input type="tel" name="phone" placeholder="Mobile Number">
                </div>
                <div class="form-group">
                    <label>Password *</label>
                    <input type="password" name="password" id="password" placeholder="Password" required>
                    <small>Minimum 6 characters</small>
                </div>
                <div class="form-group">
                    <label>Re-Enter Password *</label>
                    <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Re-Enter Password" required>
                </div>
                <div class="form-group">
                    <label class="terms-label">
                        <input type="checkbox" id="termsCheckbox" required> I agree to the Terms & Conditions
                    </label>
                </div>
                <button type="submit" class="signup-btn">Create Account</button>
            </form>
            <div class="signin-link">
                Already have an account? <a href="${pageContext.request.contextPath}/views/auth/signin.jsp">Sign In</a>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/includes/footer.jsp" />

<script>
    document.getElementById('signupForm').addEventListener('submit', function(e) {
        var pwd = document.getElementById('password').value;
        var cnf = document.getElementById('confirmPassword').value;
        if (pwd !== cnf) {
            e.preventDefault();
            alert('Passwords do not match!');
        }
        if (pwd.length < 6) {
            e.preventDefault();
            alert('Password must be at least 6 characters!');
        }
    });
</script>
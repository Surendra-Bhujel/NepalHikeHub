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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/signin.css">

<main>
    <div class="page-header">
        <div class="container"><div class="breadcrumb">Home > Sign in</div><h1>Sign In</h1></div>
    </div>
    
    <div class="signin-container">
        <div class="signin-card">
            <div class="signin-header">
                <i class="fas fa-mountain"></i>
                <h2>Welcome Back!</h2>
                <p>Sign in to continue your adventure</p>
            </div>
            
            <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-error"><%= request.getParameter("error") %></div>
            <% } %>
            
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="alert alert-error"><%= request.getAttribute("errorMessage") %></div>
            <% } %>
            
            <form action="${pageContext.request.contextPath}/signin" method="post">
                <div class="form-group">
                    <label>Your Email</label>
                    <input type="email" name="email" placeholder="Your Email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <div class="form-group" style="display: flex; justify-content: space-between; align-items: center;">
                    <label class="checkbox-label">
                        <input type="checkbox" name="rememberMe"> Remember Me
                    </label>
                    <a href="#" class="forgot-link">Forgot Password?</a>
                </div>
                <button type="submit" class="signin-btn">Login</button>
            </form>
            <div class="signup-link">
                New Customer? <a href="${pageContext.request.contextPath}/views/auth/signup.jsp">Create Account</a>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/includes/footer.jsp" />
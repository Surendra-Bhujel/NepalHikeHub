<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pending Approval - NepalHikeHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="container">
        <div class="auth-card">
            <div class="auth-header">
                <h1>NepalHikeHub</h1>
                <p>Account Pending Approval</p>
            </div>
            <div class="alert alert-info">
                <p>Your account is <strong>pending admin approval</strong>.</p>
                <p>You can sign in once an admin approves your account.</p>
            </div>
            <div class="auth-footer">
                <a href="${pageContext.request.contextPath}/signin">Back to Sign In</a>
            </div>
        </div>
    </div>
</body>
</html>
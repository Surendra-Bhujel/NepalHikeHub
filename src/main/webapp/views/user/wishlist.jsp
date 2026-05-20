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

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Wishlist</div>
            <h1>My Wishlist</h1>
        </div>
    </div>
    
    <div class="wishlist-container">
        <div class="empty-state">
            <i class="fas fa-heart-broken"></i>
            <p>Your wishlist is empty.</p>
            <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-primary">Browse Treks</a>
        </div>
    </div>
</main>

<style>
.wishlist-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem 5% 4rem;
}
.empty-state {
    text-align: center;
    padding: 3rem;
    background: white;
    border-radius: 16px;
}
.empty-state i {
    font-size: 3rem;
    color: #ccc;
    margin-bottom: 1rem;
}
.btn-primary {
    display: inline-block;
    padding: 0.7rem 1.5rem;
    background: #2F4A85;
    color: white;
    border-radius: 8px;
    text-decoration: none;
}
</style>

<jsp:include page="/views/includes/footer.jsp" />
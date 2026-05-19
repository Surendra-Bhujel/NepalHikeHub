<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, com.nepalhikehub.model.Trek, java.util.*" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    // Wishlist stored in session
    List<Trek> wishlist = (List<Trek>) session.getAttribute("wishlist");
    if (wishlist == null) wishlist = new ArrayList<>();
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Wishlist</div>
            <h1>My Wishlist</h1>
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
                <a href="${pageContext.request.contextPath}/views/user/change-password.jsp"><i class="fas fa-lock"></i> Change Password</a>
                <a href="${pageContext.request.contextPath}/views/user/my-bookings.jsp"><i class="fas fa-ticket-alt"></i> My Bookings</a>
                <a href="${pageContext.request.contextPath}/views/user/wishlist.jsp" class="active"><i class="fas fa-heart"></i> Wishlist</a>
            </div>
        </div>
        
        <div class="profile-content">
            <h2>My Wishlist</h2>
            
            <% if (wishlist.isEmpty()) { %>
                <div class="empty-state">
                    <i class="fas fa-heart-broken"></i>
                    <p>Your wishlist is empty.</p>
                    <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-primary">Browse Treks</a>
                </div>
            <% } else { %>
                <div class="wishlist-grid">
                    <% for (Trek trek : wishlist) { %>
                    <div class="wishlist-card">
                        <img src="${pageContext.request.contextPath}/image/Everest-base-Camp-trek.png" alt="<%= trek.getTrekName() %>">
                        <h3><%= trek.getTrekName() %></h3>
                        <p><%= trek.getRegion() %> | <%= trek.getDifficulty() %></p>
                        <div class="price">$<%= trek.getPrice() %></div>
                        <div class="wishlist-actions">
                            <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=<%= trek.getTrekId() %>" class="btn-book">Book Now</a>
                            <a href="${pageContext.request.contextPath}/wishlist?action=remove&id=<%= trek.getTrekId() %>" class="btn-remove">Remove</a>
                        </div>
                    </div>
                    <% } %>
                </div>
            <% } %>
        </div>
    </div>
</main>

<style>
.wishlist-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 20px; }
.wishlist-card { background: white; border-radius: 12px; overflow: hidden; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
.wishlist-card img { width: 100%; height: 160px; object-fit: cover; }
.wishlist-card h3 { padding: 12px 12px 0; font-size: 1rem; }
.wishlist-card p { padding: 0 12px; color: #666; font-size: 0.8rem; }
.wishlist-card .price { padding: 8px 12px; font-weight: bold; color: #2F4A85; }
.wishlist-actions { display: flex; gap: 10px; padding: 12px; border-top: 1px solid #eee; }
.wishlist-actions .btn-book { flex: 1; background: #2F4A85; color: white; padding: 8px; text-align: center; border-radius: 6px; text-decoration: none; }
.wishlist-actions .btn-remove { background: #dc3545; color: white; padding: 8px; text-align: center; border-radius: 6px; text-decoration: none; }
</style>

<jsp:include page="/views/includes/footer.jsp" />
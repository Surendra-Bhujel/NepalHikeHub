<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.service.TrekService" %>
<%@ page import="com.nepalhikehub.model.Trek" %>
<%@ page import="java.util.List" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    TrekService trekService = new TrekService();
    List<Trek> treks = trekService.getActiveTreks();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Treks - NepalHikeHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-brand">
                <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp">🏔️ NepalHikeHub</a>
            </div>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp" class="nav-link">Home</a>
                <a href="${pageContext.request.contextPath}/views/user/treks.jsp" class="nav-link active">Treks</a>
                <a href="${pageContext.request.contextPath}/views/user/bookings.jsp" class="nav-link">My Bookings</a>
                <a href="${pageContext.request.contextPath}/views/user/profile.jsp" class="nav-link">Profile</a>
                <a href="${pageContext.request.contextPath}/signout" class="nav-link">Sign Out</a>
            </div>
        </div>
    </nav>
    
    <main class="container">
        <h1>Available Treks</h1>
        
        <div class="trek-grid">
            <% for (Trek trek : treks) { %>
                <div class="trek-card">
                    <h3><%= trek.getTrekName() %></h3>
                    <p><strong>Difficulty:</strong> <%= trek.getDifficulty() %></p>
                    <p><strong>Duration:</strong> <%= trek.getDurationDays() %> days</p>
                    <p><strong>Price:</strong> $<%= trek.getPrice() %></p>
                    <a href="${pageContext.request.contextPath}/views/user/booking.jsp?trekId=<%= trek.getTrekId() %>" class="btn btn-primary">Book Now</a>
                </div>
            <% } %>
        </div>
    </main>
</body>
</html>
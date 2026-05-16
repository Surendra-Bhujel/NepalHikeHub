<%@ page import="com.nepalhikehub.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - NepalHikeHub</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-brand">
                <a href="#">🏔️ NepalHikeHub</a>
            </div>
            <div class="nav-menu">
                <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp" class="nav-link active">Home</a>
                <a href="${pageContext.request.contextPath}/views/user/treks.jsp" class="nav-link">Treks</a>
                <a href="${pageContext.request.contextPath}/views/user/bookings.jsp" class="nav-link">My Bookings</a>
                <a href="${pageContext.request.contextPath}/views/user/profile.jsp" class="nav-link">Profile</a>
                <a href="${pageContext.request.contextPath}/signout" class="nav-link btn-signout">Sign Out</a>
            </div>
            <div class="user-greeting">
                Welcome, <%= user.getName() %>!
            </div>
        </div>
    </nav>
    
    <main>
        <div class="hero-section">
            <div class="hero-content">
                <h1>Explore the Himalayas</h1>
                <p>Discover breathtaking treks with NepalHikeHub</p>
                <a href="${pageContext.request.contextPath}/views/user/treks.jsp" class="btn btn-primary">Browse Treks</a>
            </div>
        </div>
        
        <div class="section">
            <div class="section-header">
                <h2>Your Adventure Awaits</h2>
                <p>Book your next trekking adventure today!</p>
            </div>
        </div>
    </main>
    
    <footer>
        <p>&copy; 2026 NepalHikeHub. All rights reserved.</p>
    </footer>
</body>
</html>
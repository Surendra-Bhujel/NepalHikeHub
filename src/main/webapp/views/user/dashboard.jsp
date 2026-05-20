<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.BookingDAO" %>
<%@ page import="com.nepalhikehub.model.Booking" %>
<%@ page import="java.util.List" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    BookingDAO bookingDAO = new BookingDAO();
    List<Booking> myBookings = bookingDAO.getBookingsByUserId(currentUser.getUserId());
    
    int totalBookings = myBookings != null ? myBookings.size() : 0;
    int confirmedBookings = 0;
    int pendingBookings = 0;
    if (myBookings != null) {
        for (Booking b : myBookings) {
            if ("confirmed".equals(b.getStatus())) confirmedBookings++;
            else if ("pending".equals(b.getStatus())) pendingBookings++;
        }
    }
%>
<jsp:include page="/views/includes/header.jsp" />

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Dashboard</div>
            <h1>My Dashboard</h1>
        </div>
    </div>
    
    <div class="dashboard-container">
        <!-- Welcome Card -->
        <div class="welcome-card">
            <div class="welcome-avatar">
                <i class="fas fa-user-circle"></i>
            </div>
            <div class="welcome-text">
                <h2>Welcome, <%= currentUser.getName() %>!</h2>
                <p>Your adventure awaits. Manage your bookings and profile from here.</p>
            </div>
        </div>
        
        <!-- Stats Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-ticket-alt"></i></div>
                <div class="stat-info">
                    <h3><%= totalBookings %></h3>
                    <p>Total Bookings</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-check-circle"></i></div>
                <div class="stat-info">
                    <h3><%= confirmedBookings %></h3>
                    <p>Confirmed</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-clock"></i></div>
                <div class="stat-info">
                    <h3><%= pendingBookings %></h3>
                    <p>Pending</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon"><i class="fas fa-heart"></i></div>
                <div class="stat-info">
                    <h3>0</h3>
                    <p>Wishlist</p>
                </div>
            </div>
        </div>
        
        <!-- Quick Actions -->
        <div class="action-buttons">
    <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="action-btn">
        <i class="fas fa-hiking"></i> Browse Treks
    </a>
    <a href="${pageContext.request.contextPath}/views/user/my-bookings.jsp" class="action-btn">
        <i class="fas fa-calendar-alt"></i> My Bookings
    </a>
    <a href="${pageContext.request.contextPath}/views/user/profile.jsp" class="action-btn">
        <i class="fas fa-user-edit"></i> Update Profile
    </a>
   <a href="${pageContext.request.contextPath}/views/user/change-password-direct.jsp" class="action-btn">
    <i class="fas fa-key"></i> Change Password
</a>
    <a href="${pageContext.request.contextPath}/views/user/wishlist.jsp" class="action-btn">
        <i class="fas fa-heart"></i> My Wishlist
    </a>
</div>
        
        <!-- Recent Bookings -->
        <div class="recent-bookings">
            <h3><i class="fas fa-history"></i> Recent Bookings</h3>
            <% if (myBookings == null || myBookings.isEmpty()) { %>
                <div class="empty-state">
                    <i class="fas fa-mountain"></i>
                    <p>You haven't made any bookings yet.</p>
                    <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-primary">Book Your First Trek</a>
                </div>
            <% } else { %>
                <div class="table-responsive">
                    <table class="booking-table">
                        <thead>
                            <tr>
                                <th>Trek Name</th>
                                <th>Start Date</th>
                                <th>Travelers</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% 
                                int count = 0;
                                for (Booking b : myBookings) {
                                    if(count++ >= 5) break;
                            %>
                            <tr>
                                <td><%= b.getTrekName() != null ? b.getTrekName() : "Trek" %></td>
                                <td><%= b.getTrekStartDate() != null ? b.getTrekStartDate() : "TBD" %></td>
                                <td><%= b.getNumPersons() %></td>
                                <td>$<%= b.getTotalAmount() != null ? b.getTotalAmount() : 0 %></td>
                                <td><span class="status-<%= b.getStatus() %>"><%= b.getStatus() %></span></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/views/user/booking-detail.jsp?bookingId=<%= b.getBookingId() %>" class="btn-view">View Details</a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <% if (myBookings.size() > 5) { %>
                    <div class="view-all">
                        <a href="${pageContext.request.contextPath}/views/user/my-bookings.jsp">View All Bookings →</a>
                    </div>
                <% } %>
            <% } %>
        </div>
    </div>
</main>

<style>
/* Dashboard Container */
.dashboard-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem 5%;
}

/* Welcome Card */
.welcome-card {
    background: linear-gradient(135deg, #2F4A85, #5A7FBA);
    border-radius: 20px;
    padding: 2rem;
    display: flex;
    align-items: center;
    gap: 1.5rem;
    margin-bottom: 2rem;
    color: white;
    box-shadow: 0 5px 20px rgba(0,0,0,0.1);
}

.welcome-avatar i {
    font-size: 4rem;
}

.welcome-text h2 {
    margin-bottom: 0.5rem;
    font-size: 1.5rem;
}

.welcome-text p {
    opacity: 0.9;
}

/* Stats Grid */
.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 1.5rem;
    margin-bottom: 2rem;
}

.stat-card {
    background: white;
    padding: 1.2rem;
    border-radius: 16px;
    display: flex;
    align-items: center;
    gap: 1rem;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
    transition: transform 0.3s;
}

.stat-card:hover {
    transform: translateY(-3px);
}

.stat-icon {
    width: 55px;
    height: 55px;
    background: #E1F0F4;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.stat-icon i {
    font-size: 1.5rem;
    color: #2F4A85;
}

.stat-info h3 {
    font-size: 1.5rem;
    color: #2F4A85;
    margin: 0;
}

.stat-info p {
    color: #6c757d;
    font-size: 0.8rem;
    margin: 0;
}

/* Quick Actions */
.quick-actions {
    background: white;
    border-radius: 16px;
    padding: 1.5rem;
    margin-bottom: 2rem;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.quick-actions h3 {
    color: #2F4A85;
    margin-bottom: 1rem;
    font-size: 1.2rem;
}

.quick-actions h3 i {
    margin-right: 0.5rem;
    color: #5A7FBA;
}

.action-buttons {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
}

.action-btn {
    padding: 0.7rem 1.5rem;
    background: #f0f2f5;
    color: #2F4A85;
    text-decoration: none;
    border-radius: 50px;
    transition: all 0.3s;
    font-weight: 500;
    font-size: 0.85rem;
}

.action-btn i {
    margin-right: 0.5rem;
}

.action-btn:hover {
    background: #2F4A85;
    color: white;
    transform: translateY(-2px);
}

/* Recent Bookings */
.recent-bookings {
    background: white;
    border-radius: 16px;
    padding: 1.5rem;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.recent-bookings h3 {
    color: #2F4A85;
    margin-bottom: 1rem;
    font-size: 1.2rem;
}

.recent-bookings h3 i {
    margin-right: 0.5rem;
    color: #5A7FBA;
}

.table-responsive {
    overflow-x: auto;
}

.booking-table {
    width: 100%;
    border-collapse: collapse;
}

.booking-table th,
.booking-table td {
    padding: 0.8rem;
    text-align: left;
    border-bottom: 1px solid #eee;
}

.booking-table th {
    background: #f8f9fa;
    font-weight: 600;
    color: #1D1E22;
}

.booking-table tr:hover {
    background: #f8f9fa;
}

/* Status Badges */
.status-pending {
    background: #fff3cd;
    color: #856404;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
    display: inline-block;
}

.status-confirmed {
    background: #d4edda;
    color: #155724;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
    display: inline-block;
}

.status-cancelled {
    background: #f8d7da;
    color: #721c24;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
    display: inline-block;
}

.btn-view {
    padding: 5px 12px;
    background: #5A7FBA;
    color: white;
    border-radius: 5px;
    text-decoration: none;
    font-size: 0.75rem;
    transition: all 0.3s;
}

.btn-view:hover {
    background: #2F4A85;
}

/* Empty State */
.empty-state {
    text-align: center;
    padding: 3rem;
}

.empty-state i {
    font-size: 3rem;
    color: #ccc;
    margin-bottom: 1rem;
}

.empty-state p {
    color: #6c757d;
    margin-bottom: 1rem;
}

.btn-primary {
    display: inline-block;
    padding: 0.7rem 1.5rem;
    background: #2F4A85;
    color: white;
    border-radius: 8px;
    text-decoration: none;
    transition: all 0.3s;
}

.btn-primary:hover {
    background: #5A7FBA;
    transform: translateY(-2px);
}

.view-all {
    text-align: center;
    margin-top: 1rem;
    padding-top: 1rem;
    border-top: 1px solid #eee;
}

.view-all a {
    color: #5A7FBA;
    text-decoration: none;
    font-weight: 500;
}

.view-all a:hover {
    text-decoration: underline;
}

/* Responsive */
@media (max-width: 768px) {
    .welcome-card {
        flex-direction: column;
        text-align: center;
    }
    
    .stats-grid {
        grid-template-columns: repeat(2, 1fr);
    }
    
    .action-buttons {
        flex-direction: column;
    }
    
    .action-btn {
        text-align: center;
    }
    
    .booking-table {
        font-size: 0.8rem;
    }
    
    .booking-table th,
    .booking-table td {
        padding: 0.5rem;
    }
}

@media (max-width: 480px) {
    .stats-grid {
        grid-template-columns: 1fr;
    }
}
</style>

<jsp:include page="/views/includes/footer.jsp" />
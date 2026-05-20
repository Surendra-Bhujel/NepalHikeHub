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
%>
<jsp:include page="/views/includes/header.jsp" />

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > My Bookings</div>
            <h1>My Bookings</h1>
        </div>
    </div>
    
    <div class="bookings-container">
        <% if (myBookings == null || myBookings.isEmpty()) { %>
            <div class="empty-state">
                <i class="fas fa-mountain"></i>
                <p>You haven't made any bookings yet.</p>
                <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-primary">Browse Treks</a>
            </div>
        <% } else { %>
            <div class="table-responsive">
                <table class="bookings-table">
                    <thead>
                        <tr>
                            <th>Booking ID</th>
                            <th>Trek Name</th>
                            <th>Start Date</th>
                            <th>Travelers</th>
                            <th>Total Amount</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Booking b : myBookings) { %>
                            <tr>
                                <td>#<%= b.getBookingId() %></td>
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
        <% } %>
    </div>
</main>

<style>
.bookings-container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 2rem 5% 4rem;
}
.table-responsive {
    overflow-x: auto;
}
.bookings-table {
    width: 100%;
    border-collapse: collapse;
    background: white;
    border-radius: 16px;
    overflow: hidden;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}
.bookings-table th,
.bookings-table td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid #eee;
}
.bookings-table th {
    background: #2F4A85;
    color: white;
    font-weight: 600;
}
.bookings-table tr:hover {
    background: #f8f9fa;
}
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
@media (max-width: 768px) {
    .bookings-table {
        font-size: 0.8rem;
    }
    .bookings-table th,
    .bookings-table td {
        padding: 0.5rem;
    }
}
</style>

<jsp:include page="/views/includes/footer.jsp" />
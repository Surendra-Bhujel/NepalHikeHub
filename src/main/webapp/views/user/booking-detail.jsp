<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.dao.BookingDAO" %>
<%@ page import="com.nepalhikehub.model.Booking" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    String bookingIdParam = request.getParameter("bookingId");
    Booking booking = null;
    
    if (bookingIdParam != null && !bookingIdParam.isEmpty()) {
        BookingDAO bookingDAO = new BookingDAO();
        booking = bookingDAO.getBookingById(Integer.parseInt(bookingIdParam));
    }
    
    if (booking == null) {
        response.sendRedirect(request.getContextPath() + "/views/user/my-bookings.jsp");
        return;
    }
    
    String successMsg = request.getParameter("success");
    String errorMsg = request.getParameter("error");
%>
<jsp:include page="/views/includes/header.jsp" />

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Booking Details</div>
            <h1>Booking Details</h1>
        </div>
    </div>
    
    <div class="detail-container">
        <div class="detail-card">
            <div class="detail-header">
                <i class="fas fa-ticket-alt"></i>
                <h2>Booking #<%= booking.getBookingId() %></h2>
                <p>Status: <span class="status-<%= booking.getStatus() %>"><%= booking.getStatus() %></span></p>
            </div>
            
            <% if (successMsg != null) { %>
                <div class="alert alert-success"><%= successMsg %></div>
            <% } %>
            <% if (errorMsg != null) { %>
                <div class="alert alert-error"><%= errorMsg %></div>
            <% } %>
            
            <div class="detail-content">
                <div class="detail-section">
                    <h3><i class="fas fa-hiking"></i> Trek Information</h3>
                    <div class="info-row">
                        <span class="label">Trek Name:</span>
                        <span class="value"><%= booking.getTrekName() != null ? booking.getTrekName() : "Trek" %></span>
                    </div>
                    <div class="info-row">
                        <span class="label">Start Date:</span>
                        <span class="value"><%= booking.getTrekStartDate() != null ? booking.getTrekStartDate() : "TBD" %></span>
                    </div>
                    <div class="info-row">
                        <span class="label">Number of Travelers:</span>
                        <span class="value"><%= booking.getNumPersons() %></span>
                    </div>
                </div>
                
                <div class="detail-section">
                    <h3><i class="fas fa-credit-card"></i> Payment Information</h3>
                    <div class="info-row">
                        <span class="label">Total Amount:</span>
                        <span class="value amount">$<%= booking.getTotalAmount() != null ? booking.getTotalAmount() : 0 %></span>
                    </div>
                    <div class="info-row">
                        <span class="label">Booking Date:</span>
                        <span class="value"><%= booking.getBookingDate() %></span>
                    </div>
                </div>
                
                <% if (booking.getSpecialRequests() != null && !booking.getSpecialRequests().isEmpty()) { %>
                <div class="detail-section">
                    <h3><i class="fas fa-pencil-alt"></i> Special Requests</h3>
                    <p class="special-requests"><%= booking.getSpecialRequests() %></p>
                </div>
                <% } %>
            </div>
            
            <div class="detail-actions">
                <a href="${pageContext.request.contextPath}/views/user/my-bookings.jsp" class="btn-back">
                    <i class="fas fa-arrow-left"></i> Back to Bookings
                </a>
                <% if ("pending".equals(booking.getStatus())) { %>
                    <a href="${pageContext.request.contextPath}/user/cancel-booking?bookingId=<%= booking.getBookingId() %>" 
                       class="btn-cancel" 
                       onclick="return confirm('Are you sure you want to cancel this booking? This action cannot be undone.');">
                        <i class="fas fa-times-circle"></i> Cancel Booking
                    </a>
                <% } %>
            </div>
        </div>
    </div>
</main>

<style>
.detail-container {
    max-width: 800px;
    margin: 0 auto;
    padding: 2rem 5% 4rem;
}
.detail-card {
    background: white;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
}
.detail-header {
    background: linear-gradient(135deg, #2F4A85, #5A7FBA);
    color: white;
    padding: 2rem;
    text-align: center;
}
.detail-header i {
    font-size: 3rem;
    margin-bottom: 1rem;
}
.detail-header h2 {
    margin-bottom: 0.5rem;
}
.detail-content {
    padding: 2rem;
}
.detail-section {
    margin-bottom: 2rem;
}
.detail-section h3 {
    color: #2F4A85;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 2px solid #E1F0F4;
}
.detail-section h3 i {
    margin-right: 0.5rem;
}
.info-row {
    display: flex;
    padding: 0.8rem 0;
    border-bottom: 1px solid #eee;
}
.info-row .label {
    width: 150px;
    font-weight: 600;
    color: #666;
}
.info-row .value {
    flex: 1;
    color: #333;
}
.info-row .value.amount {
    color: #2F4A85;
    font-weight: bold;
    font-size: 1.2rem;
}
.special-requests {
    background: #f8f9fa;
    padding: 1rem;
    border-radius: 10px;
    color: #666;
    line-height: 1.6;
}
.detail-actions {
    padding: 1.5rem 2rem;
    background: #f8f9fa;
    display: flex;
    gap: 1rem;
    justify-content: space-between;
}
.btn-back, .btn-cancel {
    padding: 0.7rem 1.5rem;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 500;
    display: inline-flex;
    align-items: center;
    gap: 8px;
}
.btn-back {
    background: #6c757d;
    color: white;
}
.btn-back:hover {
    background: #5a6268;
}
.btn-cancel {
    background: #dc3545;
    color: white;
}
.btn-cancel:hover {
    background: #c82333;
}
.status-pending {
    background: #fff3cd;
    color: #856404;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
    display: inline-block;
}
.status-confirmed {
    background: #d4edda;
    color: #155724;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
    display: inline-block;
}
.status-cancelled {
    background: #f8d7da;
    color: #721c24;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
    display: inline-block;
}
.alert {
    padding: 0.8rem 1rem;
    margin: 1rem 2rem;
    border-radius: 10px;
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
    .info-row {
        flex-direction: column;
    }
    .info-row .label {
        width: 100%;
        margin-bottom: 0.3rem;
    }
    .detail-actions {
        flex-direction: column;
    }
    .btn-back, .btn-cancel {
        justify-content: center;
    }
}
</style>

<jsp:include page="/views/includes/footer.jsp" />
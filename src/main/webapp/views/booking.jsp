<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    // If not logged in, redirect to signin
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp?error=Please login to book a trek");
        return;
    }
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/booking.css">

<main>
    <div class="page-header">
        <div class="container"><div class="breadcrumb">Home > Booking</div><h1>Book Your Adventure</h1></div>
    </div>
    
    <div class="booking-container">
        <div class="booking-card">
            <div class="booking-header">
                <i class="fas fa-calendar-check"></i>
                <h3>Complete Your Booking</h3>
                <p>Hello, <%= currentUser.getName() %>! Fill in the details to book your trek.</p>
            </div>
            
            <form action="#" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <label>Select Trek *</label>
                        <select name="trek" required>
                            <option value="">Choose a trek</option>
                            <option value="ebc">Everest Base Camp Trek - $1,200</option>
                            <option value="abc">Annapurna Base Camp Trek - $850</option>
                            <option value="langtang">Langtang Valley Trek - $550</option>
                            <option value="manaslu">Manaslu Circuit Trek - $1,100</option>
                            <option value="mera">Mera Peak Climbing - $1,800</option>
                            <option value="island">Island Peak Climbing - $1,600</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Trip Date *</label>
                        <input type="date" name="date" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <label>Number of Travelers *</label>
                        <input type="number" name="travelers" min="1" value="1" required>
                    </div>
                    <div class="form-group">
                        <label>Phone Number *</label>
                        <input type="tel" name="phone" placeholder="Your phone number" value="<%= currentUser.getPhone() != null ? currentUser.getPhone() : "" %>" required>
                    </div>
                </div>
                <div class="form-group">
                    <label>Special Requirements</label>
                    <textarea name="requirements" rows="3" placeholder="Any special requests, dietary needs, or medical conditions..."></textarea>
                </div>
                <div class="form-group">
                    <label class="checkbox-label">
                        <input type="checkbox" required> I agree to the Terms and Conditions
                    </label>
                </div>
                <button type="submit" class="btn-submit">Submit Booking <i class="fas fa-arrow-right"></i></button>
            </form>
        </div>
    </div>
</main>

<jsp:include page="/views/includes/footer.jsp" />
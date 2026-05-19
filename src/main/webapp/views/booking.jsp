<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.model.Trek" %>
<%@ page import="com.nepalhikehub.dao.TrekDAO" %>
<%@ page import="java.util.List" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp?error=Please login to book a trek");
        return;
    }
    
    // Get trekId from parameter
    String trekIdParam = request.getParameter("trekId");
    Trek selectedTrek = null;
    
    if (trekIdParam != null && !trekIdParam.isEmpty()) {
        try {
            TrekDAO trekDAO = new TrekDAO();
            selectedTrek = trekDAO.getTrekById(Integer.parseInt(trekIdParam));
        } catch (NumberFormatException e) {
            // Invalid ID
        }
    }
    
    // If no trek selected, show all treks as options (fallback)
    boolean hasSelectedTrek = (selectedTrek != null);
    
    String errorMessage = (String) request.getAttribute("errorMessage");
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/booking.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Booking</div>
            <h1>Book Your Adventure</h1>
        </div>
    </div>

    <div class="booking-container">
        <div class="booking-card">
            <div class="booking-header">
                <i class="fas fa-calendar-check"></i>
                <h3>Complete Your Booking</h3>
                <p>Hello, <%= currentUser.getName() %>! Fill in the details to book your trek.</p>
            </div>

            <% if (errorMessage != null) { %>
                <div class="alert alert-error">
                    <i class="fas fa-exclamation-circle"></i> <%= errorMessage %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/user/booking" method="post">

                <% if (hasSelectedTrek) { %>
                    <!-- Show selected trek as static text (no dropdown) -->
                    <div class="form-group">
                        <label>Selected Trek *</label>
                        <div class="selected-trek">
                            <i class="fas fa-mountain"></i> 
                            <strong><%= selectedTrek.getTrekName() %></strong>
                            <span class="trek-price-display">$<%= selectedTrek.getPrice() %> per person</span>
                        </div>
                        <input type="hidden" name="trekId" value="<%= selectedTrek.getTrekId() %>">
                        <input type="hidden" name="trekName" value="<%= selectedTrek.getTrekName() %>">
                        <input type="hidden" name="trekPrice" value="<%= selectedTrek.getPrice() %>">
                    </div>
                <% } else { %>
                    <!-- Fallback: Show dropdown if no trek selected -->
                    <div class="form-group">
                        <label>Select Trek *</label>
                        <select name="trekId" required>
                            <option value="">Choose a trek</option>
                            <%
                                TrekDAO trekDAO = new TrekDAO();
                                List<Trek> allTreks = trekDAO.getActiveTreks();
                                if (allTreks != null) {
                                    for (Trek t : allTreks) {
                            %>
                                <option value="<%= t.getTrekId() %>">
                                    <%= t.getTrekName() %> — $<%= t.getPrice() %>
                                </option>
                            <%      }
                                }
                            %>
                        </select>
                    </div>
                <% } %>

                <div class="form-row">
                    <div class="form-group">
                        <label>Trip Date *</label>
                        <input type="date" name="trekStartDate" required
                               min="<%= new java.sql.Date(System.currentTimeMillis()) %>">
                    </div>
                    <div class="form-group">
                        <label>Number of Travelers *</label>
                        <input type="number" name="numPersons" min="1" max="20" value="1" required>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Phone Number *</label>
                        <input type="tel" name="phone" placeholder="Your phone number"
                               value="<%= currentUser.getPhone() != null ? currentUser.getPhone() : "" %>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Special Requirements</label>
                    <textarea name="specialRequests" rows="3"
                              placeholder="Any special requests, dietary needs, or medical conditions..."></textarea>
                </div>

                <div class="form-group">
                    <label>Payment Method *</label>
                    <select name="paymentMethod" required>
                        <option value="">Select payment method</option>
                        <option value="cash">Cash on Arrival</option>
                        <option value="card">Credit / Debit Card</option>
                        <option value="bank_transfer">Bank Transfer</option>
                        <option value="esewa">eSewa</option>
                        <option value="khalti">Khalti</option>
                    </select>
                </div>

                <div class="form-group">
                    <label class="checkbox-label">
                        <input type="checkbox" required> I agree to the Terms and Conditions
                    </label>
                </div>

                <button type="submit" class="btn-submit">
                    Process To Payment <i class="fas fa-arrow-right"></i>
                </button>
            </form>
        </div>
    </div>
</main>

<jsp:include page="/views/includes/footer.jsp" />
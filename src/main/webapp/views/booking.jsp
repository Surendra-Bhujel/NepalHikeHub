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
    
    // Get trekId from parameter (comes from "Book Now" button)
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
                    <!-- Show selected trek as static text (no dropdown) - When clicked from trek detail page -->
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
                    <!-- Show dropdown with all treks - When accessed directly -->
                    <div class="form-group">
                        <label>Select Trek *</label>
                        <select name="trekId" id="trekSelect" required onchange="updateTrekDetails()">
                            <option value="">-- Choose a trek --</option>
                            <%
                                TrekDAO trekDAO = new TrekDAO();
                                List<Trek> allTreks = trekDAO.getActiveTreks();
                                if (allTreks != null) {
                                    for (Trek t : allTreks) {
                            %>
                                <option value="<%= t.getTrekId() %>" data-price="<%= t.getPrice() %>" data-name="<%= t.getTrekName() %>">
                                    <%= t.getTrekName() %> — $<%= t.getPrice() %> | <%= t.getDurationDays() %> days | <%= t.getDifficulty() %>
                                </option>
                            <%      }
                                }
                            %>
                        </select>
                    </div>
                    
                    <!-- Selected trek info display (for dropdown selection) -->
                    <div id="selectedTrekInfo" class="selected-trek-info" style="display: none;">
                        <div class="selected-trek">
                            <i class="fas fa-mountain"></i> 
                            <strong id="selectedTrekName"></strong>
                            <span id="selectedTrekPrice" class="trek-price-display"></span>
                        </div>
                    </div>
                <% } %>

                <div class="form-row">
                    <div class="form-group">
                        <label>Trip Date *</label>
                        <input type="date" name="trekStartDate" id="tripDate" required
                               min="<%= new java.sql.Date(System.currentTimeMillis()) %>">
                    </div>
                    <div class="form-group">
                        <label>Number of Travelers *</label>
                        <input type="number" name="numPersons" id="numPersons" min="1" max="20" value="1" required onchange="updateTotalPrice()">
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

<style>
.booking-container {
    min-height: 80vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem 5% 4rem;
}
.booking-card {
    max-width: 750px;
    width: 100%;
    background: white;
    padding: 2rem;
    border-radius: 20px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.1);
}
.booking-header {
    text-align: center;
    margin-bottom: 1.5rem;
}
.booking-header i {
    font-size: 2.5rem;
    color: #5A7FBA;
}
.booking-header h3 {
    color: #2F4A85;
    margin-top: 0.5rem;
}
.form-row {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1rem;
}
.form-group {
    margin-bottom: 1.2rem;
}
.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 600;
    font-size: 0.9rem;
    color: #1D1E22;
}
.form-group input,
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 0.8rem 1rem;
    border: 2px solid #e0e0e0;
    border-radius: 10px;
    font-size: 0.9rem;
    transition: all 0.3s;
}
.form-group input:focus,
.form-group select:focus,
.form-group textarea:focus {
    outline: none;
    border-color: #5A7FBA;
}
.selected-trek {
    background: #E1F0F4;
    padding: 1rem;
    border-radius: 12px;
    display: flex;
    align-items: center;
    gap: 1rem;
    flex-wrap: wrap;
}
.selected-trek i {
    font-size: 1.5rem;
    color: #5A7FBA;
}
.selected-trek strong {
    color: #2F4A85;
    font-size: 1.1rem;
}
.trek-price-display {
    background: #2F4A85;
    color: white;
    padding: 0.3rem 0.8rem;
    border-radius: 20px;
    font-size: 0.8rem;
    margin-left: auto;
}
.selected-trek-info {
    margin-top: 0.5rem;
}
.checkbox-label {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    cursor: pointer;
    font-size: 0.85rem;
}
.btn-submit {
    width: 100%;
    padding: 0.9rem;
    background: #2F4A85;
    color: white;
    border: none;
    border-radius: 10px;
    font-size: 1rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s;
}
.btn-submit:hover {
    background: #5A7FBA;
    transform: translateY(-2px);
}
.alert {
    padding: 0.8rem;
    border-radius: 10px;
    margin-bottom: 1rem;
}
.alert-error {
    background: #f8d7da;
    color: #dc3545;
    border: 1px solid #dc3545;
}
@media (max-width: 768px) {
    .form-row {
        grid-template-columns: 1fr;
        gap: 0;
    }
    .booking-card {
        padding: 1.5rem;
        margin: 0 1rem;
    }
    .selected-trek {
        flex-direction: column;
        text-align: center;
    }
    .trek-price-display {
        margin-left: 0;
    }
}
</style>

<script>
    let basePrice = 0;
    let selectedTrekId = null;
    
    <% if (hasSelectedTrek) { %>
        // Pre-selected trek from URL parameter
        basePrice = <%= selectedTrek.getPrice() %>;
        selectedTrekId = <%= selectedTrek.getTrekId() %>;
    <% } %>
    
    function updateTrekDetails() {
        var select = document.getElementById('trekSelect');
        if (select && select.value) {
            var selectedOption = select.options[select.selectedIndex];
            basePrice = parseFloat(selectedOption.getAttribute('data-price'));
            var trekName = selectedOption.getAttribute('data-name');
            selectedTrekId = select.value;
            
            // Show selected trek info
            var infoDiv = document.getElementById('selectedTrekInfo');
            if (infoDiv) {
                infoDiv.style.display = 'block';
                document.getElementById('selectedTrekName').innerText = trekName;
                document.getElementById('selectedTrekPrice').innerText = '$' + basePrice + ' per person';
            }
            updateTotalPrice();
        } else {
            document.getElementById('selectedTrekInfo').style.display = 'none';
        }
    }
    
    function updateTotalPrice() {
        var travelers = document.getElementById('numPersons').value;
        var total = basePrice * travelers;
        var totalDisplay = document.getElementById('totalPriceDisplay');
        if (totalDisplay) {
            totalDisplay.innerText = '$' + total;
        }
    }
    
    // For dropdown selection, add total price display
    <% if (!hasSelectedTrek) { %>
    document.addEventListener('DOMContentLoaded', function() {
        var priceSummary = document.querySelector('.price-summary');
        if (!priceSummary && document.querySelector('.booking-card')) {
            var summaryDiv = document.createElement('div');
            summaryDiv.className = 'price-summary';
            summaryDiv.innerHTML = '<span>Total Price</span><strong id="totalPriceDisplay">$0</strong>';
            document.querySelector('.booking-card form').insertBefore(summaryDiv, document.querySelector('.btn-submit'));
        }
        
        // Add event listener to travelers input
        var travelersInput = document.getElementById('numPersons');
        if (travelersInput) {
            travelersInput.addEventListener('change', updateTotalPrice);
            travelersInput.addEventListener('keyup', updateTotalPrice);
        }
    });
    <% } else { %>
    // Add total price display for pre-selected trek
    document.addEventListener('DOMContentLoaded', function() {
        var priceSummary = document.querySelector('.price-summary');
        if (!priceSummary && document.querySelector('.booking-card')) {
            var summaryDiv = document.createElement('div');
            summaryDiv.className = 'price-summary';
            summaryDiv.innerHTML = '<span>Total Price</span><strong id="totalPriceDisplay">$<%= selectedTrek.getPrice() %></strong>';
            document.querySelector('.booking-card form').insertBefore(summaryDiv, document.querySelector('.btn-submit'));
            updateTotalPrice();
        }
    });
    <% } %>
</script>

<jsp:include page="/views/includes/footer.jsp" />
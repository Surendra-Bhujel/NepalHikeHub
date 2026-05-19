<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%@ page import="com.nepalhikehub.model.Booking" %>
<%@ page import="com.nepalhikehub.model.Trek" %>
<%@ page import="java.math.BigDecimal" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/signin");
        return;
    }
    Booking booking     = (Booking)    request.getAttribute("booking");
    Trek    trek        = (Trek)       request.getAttribute("trek");
    BigDecimal total    = (BigDecimal) request.getAttribute("totalAmount");
    String successMsg   = (String)     request.getAttribute("successMessage");

    // If someone lands here directly without a booking, send them back
    if (booking == null || trek == null) {
        response.sendRedirect(request.getContextPath() + "/views/booking.jsp");
        return;
    }
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/booking.css">
<style>
.conf-wrapper{min-height:80vh;display:flex;align-items:center;justify-content:center;padding:60px 20px;background:#f4f6fb}
.conf-card{background:#fff;border-radius:16px;box-shadow:0 8px 40px rgba(47,74,133,.13);max-width:680px;width:100%;overflow:hidden}
.conf-banner{background:linear-gradient(135deg,#2F4A85,#5A7FBA);color:#fff;text-align:center;padding:40px 30px 30px}
.check-circle{width:72px;height:72px;background:rgba(255,255,255,.15);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 16px;font-size:2rem;border:3px solid rgba(255,255,255,.4)}
.conf-banner h2{font-size:1.7rem;font-weight:700;margin:0 0 8px}
.conf-banner p{opacity:.88;margin:0;font-size:.97rem}
.booking-id-badge{background:rgba(255,255,255,.18);border:1px solid rgba(255,255,255,.35);border-radius:30px;display:inline-block;padding:6px 20px;margin-top:16px;font-size:.9rem;font-weight:600}
.conf-body{padding:32px 36px}
@media(max-width:520px){.conf-body{padding:24px 20px}}
.sec-label{font-size:.75rem;font-weight:700;letter-spacing:1.5px;text-transform:uppercase;color:#5A7FBA;margin-bottom:14px;padding-bottom:8px;border-bottom:2px solid #eef2fa}
.details-grid{display:grid;grid-template-columns:1fr 1fr;gap:18px 24px;margin-bottom:28px}
@media(max-width:520px){.details-grid{grid-template-columns:1fr}}
.detail-item label{display:block;font-size:.78rem;color:#888;margin-bottom:4px;font-weight:500}
.detail-item span{font-size:.97rem;color:#222;font-weight:600}
.status-badge{display:inline-block;padding:3px 12px;border-radius:20px;font-size:.82rem;font-weight:700;background:#fff3cd;color:#856404;border:1px solid #ffc107}
.total-box{background:#f0f4ff;border:1px solid #d0daf5;border-radius:10px;padding:18px 22px;display:flex;justify-content:space-between;align-items:center;margin-bottom:28px}
.total-label{font-size:.9rem;color:#555}
.total-amount{font-size:1.5rem;font-weight:800;color:#2F4A85}
.req-box{background:#f9f9f9;border-left:4px solid #5A7FBA;border-radius:0 8px 8px 0;padding:14px 18px;margin-bottom:28px;font-size:.92rem;color:#444}
.info-notice{background:#e8f4fd;border:1px solid #b3d9f5;border-radius:10px;padding:14px 18px;font-size:.88rem;color:#1a6496;margin-bottom:28px;display:flex;gap:10px}
.conf-actions{display:flex;gap:12px;flex-wrap:wrap}
.btn-conf-primary{flex:1;background:linear-gradient(135deg,#2F4A85,#5A7FBA);color:#fff;border-radius:8px;padding:14px 20px;font-size:.95rem;font-weight:600;text-decoration:none;text-align:center;transition:opacity .2s;min-width:160px}
.btn-conf-primary:hover{opacity:.88;color:#fff}
.btn-conf-outline{flex:1;background:transparent;color:#2F4A85;border:2px solid #2F4A85;border-radius:8px;padding:12px 20px;font-size:.95rem;font-weight:600;text-decoration:none;text-align:center;transition:all .2s;min-width:160px}
.btn-conf-outline:hover{background:#2F4A85;color:#fff}
</style>
<main>
<div class="conf-wrapper">
  <div class="conf-card">

    <!-- Success Banner -->
    <div class="conf-banner">
      <div class="check-circle"><i class="fas fa-check"></i></div>
      <h2>Booking Confirmed!</h2>
      <p><%= successMsg != null ? successMsg : "Your booking has been submitted successfully!" %></p>
      <div class="booking-id-badge">Booking ID: #<%= booking.getBookingId() %></div>
    </div>

    <div class="conf-body">

      <!-- Trek Details -->
      <div class="sec-label">Trek Details</div>
      <div class="details-grid">
        <div class="detail-item">
          <label>Trek Name</label>
          <span><%= trek.getTrekName() %></span>
        </div>
        <div class="detail-item">
          <label>Region</label>
          <span><%= trek.getRegion() != null ? trek.getRegion() : "—" %></span>
        </div>
        <div class="detail-item">
          <label>Difficulty</label>
          <span><%= trek.getDifficulty() != null ? trek.getDifficulty() : "—" %></span>
        </div>
        <div class="detail-item">
          <label>Duration</label>
          <span><%= trek.getDurationDays() %> days</span>
        </div>
        <div class="detail-item">
          <label>Trek Start Date</label>
          <span><%= booking.getTrekStartDate() %></span>
        </div>
        <div class="detail-item">
          <label>Number of Travelers</label>
          <span><%= booking.getNumPersons() %> person<%= booking.getNumPersons() > 1 ? "s" : "" %></span>
        </div>
        <div class="detail-item">
          <label>Booking Date</label>
          <span><%= booking.getBookingDate() %></span>
        </div>
        <div class="detail-item">
          <label>Status</label>
          <span class="status-badge"><%= booking.getStatus() %></span>
        </div>
      </div>

      <!-- Total -->
      <div class="total-box">
        <span class="total-label">
          $<%= trek.getPrice() %> &times; <%= booking.getNumPersons() %> person<%= booking.getNumPersons() > 1 ? "s" : "" %>
        </span>
        <span class="total-amount">$<%= total %></span>
      </div>

      <!-- Special Requests (only if provided) -->
      <%
        String reqs = booking.getSpecialRequests();
        if (reqs != null && !reqs.trim().isEmpty()) {
      %>
      <div class="sec-label">Special Requests</div>
      <div class="req-box"><%= reqs %></div>
      <% } %>

      <!-- Info Notice -->
      <div class="info-notice">
        <i class="fas fa-info-circle" style="margin-top:2px;flex-shrink:0"></i>
        <span>Your booking is <strong>pending review</strong>. Our team will contact you within
        24 hours with payment instructions and confirmation details.</span>
      </div>

      <!-- Action Buttons -->
      <div class="conf-actions">
        <a href="${pageContext.request.contextPath}/views/user/dashboard.jsp" class="btn-conf-primary">
          <i class="fas fa-th-large"></i> Go to Dashboard
        </a>
        <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-conf-outline">
          <i class="fas fa-hiking"></i> Browse More Treks
        </a>
      </div>

    </div>
  </div>
</div>
</main>
<jsp:include page="/views/includes/footer.jsp" />

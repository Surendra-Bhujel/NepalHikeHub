<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.Trek" %>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    Trek trek = (Trek) request.getAttribute("trek");
    if (trek == null) {
        response.sendRedirect(request.getContextPath() + "/views/trekking.jsp");
        return;
    }
    User currentUser = null;
    jakarta.servlet.http.HttpSession s = request.getSession(false);
    if (s != null) currentUser = (User) s.getAttribute("user");

    String imgSrc = (trek.getImageUrl() != null && !trek.getImageUrl().isEmpty())
        ? request.getContextPath() + "/" + trek.getImageUrl()
        : "https://placehold.co/800x400/2F4A85/white?text=" + trek.getTrekName().replace(" ", "+");

    String bookUrl = currentUser != null
        ? request.getContextPath() + "/user/booking?trekId=" + trek.getTrekId()
        : request.getContextPath() + "/signin?info=Please+sign+in+to+book";
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/trekking.css">
<style>
.detail-wrapper{max-width:960px;margin:40px auto;padding:0 20px 60px}
.detail-breadcrumb{font-size:.85rem;color:#888;margin-bottom:24px}
.detail-breadcrumb a{color:#2F4A85;text-decoration:none}
.detail-breadcrumb a:hover{text-decoration:underline}
.detail-hero{border-radius:14px;overflow:hidden;margin-bottom:32px;box-shadow:0 4px 24px rgba(0,0,0,.12);position:relative}
.detail-hero img{width:100%;height:380px;object-fit:cover;display:block}
.detail-hero-overlay{position:absolute;bottom:0;left:0;right:0;background:linear-gradient(transparent,rgba(0,0,0,.65));padding:32px 28px 24px;color:#fff}
.detail-hero-overlay h1{margin:0 0 6px;font-size:2rem;font-weight:800}
.detail-stats{display:grid;grid-template-columns:repeat(auto-fit,minmax(140px,1fr));gap:16px;margin-bottom:32px}
.stat-card{background:#fff;border-radius:10px;padding:18px 16px;text-align:center;box-shadow:0 2px 12px rgba(47,74,133,.08);border-top:3px solid #2F4A85}
.stat-card i{font-size:1.4rem;color:#2F4A85;margin-bottom:8px;display:block}
.stat-value{font-size:1.1rem;font-weight:700;color:#222;display:block}
.stat-label{font-size:.78rem;color:#888;display:block}
.detail-body{display:grid;grid-template-columns:1fr 300px;gap:28px}
@media(max-width:720px){.detail-body{grid-template-columns:1fr}.detail-hero img{height:220px}}
.detail-main h2{font-size:1.2rem;color:#2F4A85;margin:0 0 12px;padding-bottom:8px;border-bottom:2px solid #eef2fa}
.detail-main p{color:#444;line-height:1.75;margin-bottom:28px}
.route-box{background:#f4f6fb;padding:14px 18px;border-radius:10px;margin-bottom:28px;font-size:.95rem}
.booking-sidebar{background:#fff;border-radius:14px;box-shadow:0 4px 24px rgba(47,74,133,.10);padding:28px 22px;position:sticky;top:80px;height:fit-content}
.price-big{font-size:2rem;font-weight:800;color:#2F4A85;margin-bottom:4px}
.price-big span{font-size:.9rem;font-weight:400;color:#888}
.diff-badge{display:inline-block;padding:4px 14px;border-radius:20px;font-size:.82rem;font-weight:700;margin-bottom:20px}
.diff-badge.Easy{background:#d4edda;color:#155724}
.diff-badge.Moderate{background:#fff3cd;color:#856404}
.diff-badge.Hard{background:#f8d7da;color:#721c24}
.s-row{display:flex;justify-content:space-between;font-size:.9rem;margin-bottom:10px;color:#444}
.s-row strong{color:#222}
.btn-book-now{display:block;width:100%;background:linear-gradient(135deg,#2F4A85,#5A7FBA);color:#fff;text-align:center;padding:14px;border-radius:8px;font-weight:700;font-size:1rem;text-decoration:none;margin-top:20px;transition:opacity .2s}
.btn-book-now:hover{opacity:.88;color:#fff}
.btn-back{display:block;margin-top:12px;color:#2F4A85;font-size:.88rem;text-decoration:none;text-align:center}
.login-notice{background:#fff8e1;border:1px solid #ffe082;border-radius:8px;padding:12px 14px;font-size:.85rem;color:#5d4037;margin-top:14px;text-align:center}
.login-notice a{color:#2F4A85;font-weight:600}
</style>
<main>
<div class="detail-wrapper">
    <div class="detail-breadcrumb">
        <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &rsaquo;
        <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &rsaquo;
        <%= trek.getTrekName() %>
    </div>

    <div class="detail-hero">
        <img src="<%= imgSrc %>" alt="<%= trek.getTrekName() %>"
             onerror="this.src='https://placehold.co/800x400/2F4A85/white?text=Trek'">
        <div class="detail-hero-overlay">
            <h1><%= trek.getTrekName() %></h1>
            <span><i class="fas fa-map-marker-alt"></i> <%= trek.getRegion() != null ? trek.getRegion() : "Nepal" %></span>
        </div>
    </div>

    <div class="detail-stats">
        <div class="stat-card">
            <i class="fas fa-calendar-alt"></i>
            <span class="stat-value"><%= trek.getDurationDays() %> Days</span>
            <span class="stat-label">Duration</span>
        </div>
        <div class="stat-card">
            <i class="fas fa-hiking"></i>
            <span class="stat-value"><%= trek.getDifficulty() != null ? trek.getDifficulty() : "—" %></span>
            <span class="stat-label">Difficulty</span>
        </div>
        <div class="stat-card">
            <i class="fas fa-users"></i>
            <span class="stat-value"><%= trek.getMaxGroupSize() > 0 ? trek.getMaxGroupSize() : "—" %></span>
            <span class="stat-label">Max Group</span>
        </div>
        <div class="stat-card">
            <i class="fas fa-road"></i>
            <span class="stat-value"><%= trek.getDistanceKm() != null ? trek.getDistanceKm() + " km" : "—" %></span>
            <span class="stat-label">Distance</span>
        </div>
    </div>

    <div class="detail-body">
        <div class="detail-main">
            <h2>About This Trek</h2>
            <p><%= trek.getDescription() != null && !trek.getDescription().isEmpty()
                    ? trek.getDescription()
                    : "An incredible trekking experience through Nepal's Himalayas with expert guides." %></p>

            <% if (trek.getStartLocation() != null || trek.getEndLocation() != null) { %>
            <h2>Route</h2>
            <div class="route-box">
                <i class="fas fa-map-signs" style="color:#2F4A85;margin-right:8px;"></i>
                <strong>Start:</strong> <%= trek.getStartLocation() != null ? trek.getStartLocation() : "—" %>
                &nbsp; → &nbsp;
                <strong>End:</strong> <%= trek.getEndLocation() != null ? trek.getEndLocation() : "—" %>
            </div>
            <% } %>

            <h2>What's Included</h2>
            <p>Expert certified guides, all permits and fees, accommodation during trek,
               meals as per itinerary, first-aid kit and safety equipment, and airport transfers.</p>

            <h2>Important Notes</h2>
            <p>Participants should be in good physical health. Travel insurance is strongly recommended.
               Difficulty is rated <strong><%= trek.getDifficulty() %></strong>.
               Contact us for the full day-by-day itinerary.</p>
        </div>

        <div class="booking-sidebar">
            <div class="price-big">$<%= trek.getPrice() %> <span>/ person</span></div>
            <span class="diff-badge <%= trek.getDifficulty() != null ? trek.getDifficulty() : "" %>">
                <%= trek.getDifficulty() != null ? trek.getDifficulty() : "Trek" %>
            </span>
            <hr style="border:none;border-top:1px solid #eef2fa;margin:16px 0">
            <div class="s-row"><span>Duration</span><strong><%= trek.getDurationDays() %> days</strong></div>
            <div class="s-row"><span>Max Group</span><strong><%= trek.getMaxGroupSize() > 0 ? trek.getMaxGroupSize() : "—" %></strong></div>
            <div class="s-row"><span>Region</span><strong><%= trek.getRegion() != null ? trek.getRegion() : "Nepal" %></strong></div>
            <% if (trek.getDistanceKm() != null) { %>
            <div class="s-row"><span>Distance</span><strong><%= trek.getDistanceKm() %> km</strong></div>
            <% } %>
            <hr style="border:none;border-top:1px solid #eef2fa;margin:16px 0">
            <a href="<%= bookUrl %>" class="btn-book-now">
                <i class="fas fa-calendar-check"></i> Book This Trek
            </a>
            <% if (currentUser == null) { %>
            <div class="login-notice">
                <a href="${pageContext.request.contextPath}/signin">Sign in</a> or
                <a href="${pageContext.request.contextPath}/signup">register</a> to book.
            </div>
            <% } %>
            <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-back">← Back to all treks</a>
        </div>
    </div>
</div>
</main>
<jsp:include page="/views/includes/footer.jsp" />

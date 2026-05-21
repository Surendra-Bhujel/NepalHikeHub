<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.Trek" %>
<%@ page import="com.nepalhikehub.dao.TrekDAO" %>
<%@ page import="java.util.List" %>
<%
    TrekDAO trekDAO = new TrekDAO();
    List<Trek> treks;

    String searchParam = request.getParameter("search");
    String diffParam   = request.getParameter("difficulty");
    String regionParam = request.getParameter("region");
    String trekParam   = request.getParameter("trek");

    boolean hasFilter = (searchParam != null && !searchParam.isEmpty())
                     || (diffParam   != null && !diffParam.isEmpty())
                     || (regionParam != null && !regionParam.isEmpty());

    if (hasFilter && searchParam != null && !searchParam.isEmpty()) {
        treks = trekDAO.searchTreks(searchParam);
    } else if (hasFilter) {
        treks = trekDAO.filterTreks(diffParam, regionParam, null, null);
    } else {
        treks = trekDAO.getActiveTreks();
    }
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/trekking.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Trekking in Nepal</div>
            <h1>Trekking in Nepal</h1>
        </div>
    </div>

    <div class="trekking-intro">
        <img src="${pageContext.request.contextPath}/image/prayer-flags-nepal.png"
             alt="Prayer Flags" class="intro-image"
             onerror="this.onerror=null; this.src='https://placehold.co/1200x300/2F4A85/white?text=Nepal+Trekking'">
        <p>Trekking in Nepal is a popular outdoor activity that involves walking or hiking through
           natural landscapes, such as mountains, forests, and deserts. It is a great way to explore
           the beauty of nature and experience the thrill of adventure.</p>
        <h2>Why Trek?</h2>
        <ul>
            <li><i class="fas fa-check-circle"></i> <strong>Physical Fitness:</strong> Walking or hiking helps improve cardiovascular health.</li>
            <li><i class="fas fa-check-circle"></i> <strong>Mental Well-being:</strong> Spending time in nature reduces stress.</li>
            <li><i class="fas fa-check-circle"></i> <strong>Cultural Appreciation:</strong> Immerse yourself in local culture.</li>
        </ul>
        <h2>Best Trekking In Nepal 2026</h2>
    </div>

    <!-- Search Bar - added ID to keep page here after submit/clear -->
    <div class="search-section" id="search-section">
        <h3>Find Your Perfect Trek</h3>
        <form action="${pageContext.request.contextPath}/views/trekking.jsp" method="get" class="search-form">
            <input type="text" name="search" placeholder="Search by trek name or region..."
                   value="<%= searchParam != null ? searchParam : "" %>">
            <select name="difficulty">
                <option value="">All Difficulties</option>
                <option value="Easy"     <%= "Easy".equals(diffParam)     ? "selected" : "" %>>Easy</option>
                <option value="Moderate" <%= "Moderate".equals(diffParam) ? "selected" : "" %>>Moderate</option>
                <option value="Hard"     <%= "Hard".equals(diffParam)     ? "selected" : "" %>>Hard</option>
            </select>
            <select name="region">
                <option value="">All Regions</option>
                <option value="Everest"   <%= "Everest".equals(regionParam)   ? "selected" : "" %>>Everest</option>
                <option value="Annapurna" <%= "Annapurna".equals(regionParam) ? "selected" : "" %>>Annapurna</option>
                <option value="Langtang"  <%= "Langtang".equals(regionParam)  ? "selected" : "" %>>Langtang</option>
                <option value="Manaslu"   <%= "Manaslu".equals(regionParam)   ? "selected" : "" %>>Manaslu</option>
            </select>
            <button type="submit"><i class="fas fa-search"></i> Search</button>
            <% if (hasFilter) { %>
                <a href="${pageContext.request.contextPath}/views/trekking.jsp#search-section" class="clear-btn">Clear</a>
            <% } %>
        </form>
    </div>

    <!-- Dynamic Trek List from DB -->
    <div class="trekking-list">
        <%
            if (treks == null || treks.isEmpty()) {
        %>
            <div style="text-align:center; padding:60px 20px; color:#666;">
                <i class="fas fa-mountain" style="font-size:3rem; color:#ccc; display:block; margin-bottom:16px;"></i>
                <p style="font-size:1.1rem;">No treks found. Try a different search.</p>
                <a href="${pageContext.request.contextPath}/views/trekking.jsp#search-section"
                   style="color:#2F4A85; font-weight:600;">Clear search →</a>
            </div>
        <%
            } else {
                for (Trek trek : treks) {
                    String imgSrc;
                    String trekNameLower = trek.getTrekName().toLowerCase();
                    
                    if (trekNameLower.contains("everest")) {
                        imgSrc = request.getContextPath() + "/image/Everest-base-Camp-trek.png";
                    } else if (trekNameLower.contains("annapurna")) {
                        imgSrc = request.getContextPath() + "/image/annapurna.png";
                    } else if (trekNameLower.contains("langtang")) {
                        imgSrc = request.getContextPath() + "/image/langtang.png";
                    } else if (trekNameLower.contains("mera")) {
                        imgSrc = request.getContextPath() + "/image/mera%20peak.png";
                    } else if (trekNameLower.contains("island")) {
                        imgSrc = request.getContextPath() + "/image/island%20peak.png";
                    } else if (trekNameLower.contains("lobuche")) {
                        imgSrc = request.getContextPath() + "/image/lobuche.png";
                    } else if (trekNameLower.contains("manaslu")) {
                        imgSrc = request.getContextPath() + "/image/hill.png";
                    } else {
                        imgSrc = request.getContextPath() + "/image/hill.png";
                    }
        %>
            <div class="trekking-item">
                <div class="trekking-image">
                    <img src="<%= imgSrc %>" alt="<%= trek.getTrekName() %>"
                         onerror="this.onerror=null; this.src='https://placehold.co/400x250/2F4A85/white?text=' + encodeURIComponent('<%= trek.getTrekName() %>')">
                </div>
                <div class="trekking-details">
                    <h3><%= trek.getTrekName() %></h3>
                    <div class="trek-meta">
                        <span><i class="fas fa-map-marker-alt"></i> <%= trek.getRegion() != null ? trek.getRegion() : "Nepal" %></span>
                        <span><i class="fas fa-calendar"></i> <%= trek.getDurationDays() %> Days</span>
                        <span><i class="fas fa-chart-line"></i> <%= trek.getDifficulty() != null ? trek.getDifficulty() : "" %></span>
                    </div>
                    <p><%= trek.getDescription() != null && trek.getDescription().length() > 150 ? trek.getDescription().substring(0, 150) + "..." : trek.getDescription() %></p>
                    <div class="trek-price">$<%= trek.getPrice() %> <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=<%= trek.getTrekId() %>"
                       class="btn-book">Book Now →</a>
                </div>
            </div>
        <%
                }
            }
        %>
    </div>
</main>

<!-- JavaScript to keep page at search section after search & clear -->
<script>
    (function() {
        // Helper to scroll to search section smoothly
        function scrollToSearchSection() {
            var searchSection = document.getElementById('search-section');
            if (searchSection) {
                searchSection.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        }

        // If URL already has #search-section, scroll after page loads
        if (window.location.hash === '#search-section') {
            // Small delay ensures DOM and images are ready
            setTimeout(scrollToSearchSection, 100);
        }

        // For the search form: append #search-section to action before submit
        var searchForm = document.querySelector('.search-form');
        if (searchForm) {
            searchForm.addEventListener('submit', function(e) {
                var action = this.getAttribute('action');
                // If action is empty, use current URL path
                if (!action) {
                    action = window.location.pathname;
                }
                // Add fragment if not already present
                if (action.indexOf('#search-section') === -1) {
                    this.setAttribute('action', action + '#search-section');
                }
                // Form will submit normally, browser will handle fragment
            });
        }
    })();
</script>

<jsp:include page="/views/includes/footer.jsp" />
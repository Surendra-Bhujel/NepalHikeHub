<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/trekking.css">

<main>
    <div class="page-header">
        <div class="container"><div class="breadcrumb">Home > Trekking in Nepal</div><h1>Trekking in Nepal</h1></div>
    </div>
    
    <div class="trekking-intro">
        <img src="${pageContext.request.contextPath}/images/prayer-flags-nepal.avif" alt="Prayer Flags" class="intro-image">
        <p>Trekking in Nepal is a popular outdoor activity that involves walking or hiking through natural landscapes, such as mountains, forests, and deserts. It is a great way to explore the beauty of nature and experience the thrill of adventure.</p>
        
        <h2>Why Trek?</h2>
        <ul>
            <li><i class="fas fa-check-circle"></i> <strong>Physical Fitness:</strong> Walking or hiking helps improve cardiovascular health, build strength, and increase endurance.</li>
            <li><i class="fas fa-check-circle"></i> <strong>Mental Well-being:</strong> Spending time in nature has been shown to reduce stress, anxiety, and depression.</li>
            <li><i class="fas fa-check-circle"></i> <strong>Cultural Appreciation:</strong> Trekking allows you to immerse yourself in the local culture and traditions.</li>
            <li><i class="fas fa-check-circle"></i> <strong>Personal Growth:</strong> Overcoming physical challenges can boost self-confidence.</li>
        </ul>
        
        <h2>Best Trekking In Nepal 2026</h2>
    </div>
    
    <div class="trekking-list">
        <div class="trekking-item">
            <div class="trekking-image"><img src="${pageContext.request.contextPath}/images/Everest-base-Camp-trek.jpeg" alt="Everest"></div>
            <div class="trekking-details">
                <h3>Everest Base Camp Trek</h3>
                <div class="package-meta"><span><i class="fas fa-map-marker-alt"></i> Everest Region</span><span><i class="fas fa-calendar"></i> 14 Days</span><span><i class="fas fa-chart-line"></i> Hard</span></div>
                <p>The Best Trek in the World - Stand at the foot of the highest mountain on Earth.</p>
                <div class="package-price">$1,200 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">Book Now →</a>
            </div>
        </div>
        <div class="trekking-item">
            <div class="trekking-image"><img src="${pageContext.request.contextPath}/images/annapurna.webp" alt="Annapurna"></div>
            <div class="trekking-details">
                <h3>Annapurna Base Camp Trek</h3>
                <div class="package-meta"><span><i class="fas fa-map-marker-alt"></i> Annapurna Region</span><span><i class="fas fa-calendar"></i> 11 Days</span><span><i class="fas fa-chart-line"></i> Moderate</span></div>
                <p>Walk through diverse landscapes and reach the base camp of Annapurna I.</p>
                <div class="package-price">$850 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">Book Now →</a>
            </div>
        </div>
        <div class="trekking-item">
            <div class="trekking-image"><img src="${pageContext.request.contextPath}/images/langtang.webp" alt="Langtang"></div>
            <div class="trekking-details">
                <h3>Langtang Valley Trek</h3>
                <div class="package-meta"><span><i class="fas fa-map-marker-alt"></i> Langtang Region</span><span><i class="fas fa-calendar"></i> 7 Days</span><span><i class="fas fa-chart-line"></i> Moderate</span></div>
                <p>The "Valley of Glaciers" - a short journey with pristine Himalayan views.</p>
                <div class="package-price">$550 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">Book Now →</a>
            </div>
        </div>
        <div class="trekking-item">
            <div class="trekking-image"><img src="${pageContext.request.contextPath}/images/hill.jpg" alt="Manaslu"></div>
            <div class="trekking-details">
                <h3>Manaslu Circuit Trek</h3>
                <div class="package-meta"><span><i class="fas fa-map-marker-alt"></i> Manaslu Region</span><span><i class="fas fa-calendar"></i> 14 Days</span><span><i class="fas fa-chart-line"></i> Hard</span></div>
                <p>Remote and challenging trek around the world's 8th highest mountain.</p>
                <div class="package-price">$1,100 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">Book Now →</a>
            </div>
        </div>
    </div>
</main>

<%@ include file="includes/footer.jsp" %>
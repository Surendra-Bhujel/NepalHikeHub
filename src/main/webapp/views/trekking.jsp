<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <img src="${pageContext.request.contextPath}/image/prayer-flags.png" alt="Prayer Flags" class="intro-image">
        <p>Trekking in Nepal is a popular outdoor activity that involves walking or hiking through natural landscapes, such as mountains, forests, and deserts. It is a great way to explore the beauty of nature and experience the thrill of adventure.</p>
        
        <h2>Why Trek?</h2>
        <ul>
            <li><i class="fas fa-check-circle"></i> <strong>Physical Fitness:</strong> Walking or hiking helps improve cardiovascular health.</li>
            <li><i class="fas fa-check-circle"></i> <strong>Mental Well-being:</strong> Spending time in nature reduces stress.</li>
            <li><i class="fas fa-check-circle"></i> <strong>Cultural Appreciation:</strong> Immerse yourself in local culture.</li>
        </ul>
        
        <h2>Best Trekking In Nepal 2026</h2>
    </div>
    
    <div class="trekking-list">
        <div class="trekking-item">
            <div class="trekking-image"><img src="${pageContext.request.contextPath}/image/Everest-base-Camp-trek.png" alt="Everest"></div>
            <div class="trekking-details">
                <h3>Everest Base Camp Trek</h3>
                <div class="trek-meta">Everest Region | 14 Days | Hard</div>
                <p>The Best Trek in the World - Stand at the foot of the highest mountain.</p>
                <div class="trek-price">$1,200 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/trek-detail.jsp?id=1" class="btn-book">View Details →</a>
            </div>
        </div>
        
        <div class="trekking-item">
            <div class="trekking-image"><img src="${pageContext.request.contextPath}/image/annapurna.png" alt="Annapurna"></div>
            <div class="trekking-details">
                <h3>Annapurna Base Camp Trek</h3>
                <div class="trek-meta">Annapurna Region | 11 Days | Moderate</div>
                <p>Walk through diverse landscapes and reach the base camp of Annapurna I.</p>
                <div class="trek-price">$850 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/trek-detail.jsp?id=2" class="btn-book">View Details →</a>
            </div>
        </div>
        
        <div class="trekking-item">
            <div class="trekking-image"><img src="${pageContext.request.contextPath}/image/langtang.png" alt="Langtang"></div>
            <div class="trekking-details">
                <h3>Langtang Valley Trek</h3>
                <div class="trek-meta">Langtang Region | 7 Days | Moderate</div>
                <p>The "Valley of Glaciers" - a short journey with pristine Himalayan views.</p>
                <div class="trek-price">$550 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/trek-detail.jsp?id=3" class="btn-book">View Details →</a>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/includes/footer.jsp" />
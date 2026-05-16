<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/peak-climbing.css">

<main>
    <div class="page-header">
        <div class="container"><div class="breadcrumb">Home > Peak Climbing</div><h1>Peak Climbing in Nepal</h1></div>
    </div>
    
    <div class="peak-intro">
        <img src="${pageContext.request.contextPath}/images/hill.jpg" alt="Himalayan Peaks" class="intro-image">
        <p>Peak climbing in Nepal offers a unique blend of trekking and mountaineering, allowing adventurers to summit some of the most spectacular peaks in the Himalayas. These climbs are perfect for those who want to experience high-altitude climbing without the extreme technical demands of 8000m peaks.</p>
    </div>
    
    <div class="peak-list">
        <div class="peak-item">
            <div class="peak-image"><img src="${pageContext.request.contextPath}/images/mera%20peak.jpg" alt="Mera Peak"></div>
            <div class="peak-details">
                <h3>Mera Peak Climbing</h3>
                <div class="package-meta"><span><i class="fas fa-map-marker-alt"></i> Everest Region</span><span><i class="fas fa-calendar"></i> 14 Days</span><span><i class="fas fa-chart-line"></i> Hard</span></div>
                <p>At 6,476m, Mera Peak is the highest trekking peak in Nepal, offering stunning views of Everest, Kanchenjunga, and Makalu.</p>
                <div class="package-price">$1,800 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">Book Now →</a>
            </div>
        </div>
        <div class="peak-item">
            <div class="peak-image"><img src="${pageContext.request.contextPath}/images/island%20peak.webp" alt="Island Peak"></div>
            <div class="peak-details">
                <h3>Island Peak Climbing</h3>
                <div class="package-meta"><span><i class="fas fa-map-marker-alt"></i> Everest Region</span><span><i class="fas fa-calendar"></i> 18 Days</span><span><i class="fas fa-chart-line"></i> Hard</span></div>
                <p>Island Peak (6,189m) is one of the most popular climbing peaks in Nepal, with spectacular views of Lhotse and Everest.</p>
                <div class="package-price">$1,600 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">Book Now →</a>
            </div>
        </div>
        <div class="peak-item">
            <div class="peak-image"><img src="${pageContext.request.contextPath}/images/island.webp" alt="Lobuche"></div>
            <div class="peak-details">
                <h3>Lobuche Peak Climbing</h3>
                <div class="package-meta"><span><i class="fas fa-map-marker-alt"></i> Everest Region</span><span><i class="fas fa-calendar"></i> 16 Days</span><span><i class="fas fa-chart-line"></i> Hard</span></div>
                <p>Lobuche Peak (6,119m) offers incredible views of Everest, Lhotse, and Ama Dablam.</p>
                <div class="package-price">$1,500 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">Book Now →</a>
            </div>
        </div>
    </div>
</main>

<%@ include file="includes/footer.jsp" %>
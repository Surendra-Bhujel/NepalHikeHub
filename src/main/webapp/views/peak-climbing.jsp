<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/peak-climbing.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Peak Climbing</div>
            <h1>Peak Climbing in Nepal</h1>
        </div>
    </div>
    
    <div class="peak-intro">
        <img src="${pageContext.request.contextPath}/image/hill.png" 
             alt="Himalayan Peaks" 
             class="intro-image"
             onerror="this.onerror=null; this.src='https://placehold.co/1200x300/2F4A85/white?text=Himalayan+Peaks'">
        <p>Peak climbing in Nepal offers a unique blend of trekking and mountaineering, allowing adventurers to summit some of the most spectacular peaks in the Himalayas. These climbs are perfect for those who want to experience high-altitude climbing without the extreme technical demands of 8000m peaks.</p>
    </div>
    
    <div class="peak-list">
        <!-- Mera Peak -->
        <div class="peak-item">
            <div class="peak-image">
                <img src="${pageContext.request.contextPath}/image/mera%20peak.png" 
                     alt="Mera Peak"
                     onerror="this.onerror=null; this.src='https://placehold.co/400x250/2F4A85/white?text=Mera+Peak'">
            </div>
            <div class="peak-details">
                <h3>Mera Peak Climbing</h3>
                <div class="package-meta">
                    <span><i class="fas fa-map-marker-alt"></i> Everest Region</span>
                    <span><i class="fas fa-calendar"></i> 14 Days</span>
                    <span><i class="fas fa-chart-line"></i> Hard</span>
                </div>
                <p>At 6,476m, Mera Peak is the highest trekking peak in Nepal, offering stunning views of Everest, Kanchenjunga, and Makalu.</p>
                <div class="package-price">$1,800 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=4" class="btn-book">Book Now →</a>
            </div>
        </div>
        
        <!-- Island Peak -->
        <div class="peak-item">
            <div class="peak-image">
                <img src="${pageContext.request.contextPath}/image/island%20peak.png" 
                     alt="Island Peak"
                     onerror="this.onerror=null; this.src='https://placehold.co/400x250/5A7FBA/white?text=Island+Peak'">
            </div>
            <div class="peak-details">
                <h3>Island Peak Climbing</h3>
                <div class="package-meta">
                    <span><i class="fas fa-map-marker-alt"></i> Everest Region</span>
                    <span><i class="fas fa-calendar"></i> 18 Days</span>
                    <span><i class="fas fa-chart-line"></i> Hard</span>
                </div>
                <p>Island Peak (6,189m) is one of the most popular climbing peaks in Nepal, with spectacular views of Lhotse and Everest.</p>
                <div class="package-price">$1,600 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=5" class="btn-book">Book Now →</a>
            </div>
        </div>
        
        <!-- Lobuche Peak -->
        <div class="peak-item">
            <div class="peak-image">
                <img src="${pageContext.request.contextPath}/image/lobuche.png" 
                     alt="Lobuche Peak"
                     onerror="this.onerror=null; this.src='https://placehold.co/400x250/2F4A85/white?text=Lobuche+Peak'">
            </div>
            <div class="peak-details">
                <h3>Lobuche Peak Climbing</h3>
                <div class="package-meta">
                    <span><i class="fas fa-map-marker-alt"></i> Everest Region</span>
                    <span><i class="fas fa-calendar"></i> 16 Days</span>
                    <span><i class="fas fa-chart-line"></i> Hard</span>
                </div>
                <p>Lobuche Peak (6,119m) offers incredible views of Everest, Lhotse, and Ama Dablam.</p>
                <div class="package-price">$1,500 <span>per person</span></div>
                <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=6" class="btn-book">Book Now →</a>
            </div>
        </div>
    </div>
</main>

<jsp:include page="/views/includes/footer.jsp" />
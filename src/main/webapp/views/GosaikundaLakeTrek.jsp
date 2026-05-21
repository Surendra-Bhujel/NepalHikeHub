<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Gosaikunda Lake Trek Banner.png" alt="Gosaikunda Lake Trek Banner" class="banner-image"
         onerror="this.src='https://placehold.co/1200x400/2F4A85/white?text=Gosaikunda+Lake+Trek'">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Langtang">Langtang Region Trekking</a> &gt; 
    Gosaikunda Lake Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Gosaikunda Lake Trek - 7 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>7 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Langtang Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>Alpine Lake / Pilgrimage</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>4,380 m (14,370 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Moderate</div>
            <div class="overview-item"><strong>Transportation</strong><br>Overland Bus / Jeep + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Mountain Tea houses</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Gosaikunda Lake Trek</strong> is a deeply rewarding spiritual and scenic journey leading to a cluster of spectacular alpine waters in the Langtang National Park. Revered by both Hindu and Buddhist pilgrims, the main lake at Gosaikunda is historically legendary, believed to have been created by Lord Shiva himself.
        </p>
        <p class="description">
            This short yet challenging trek climbs out of lush river valleys up into a dramatic, high-altitude world of bare rock and deep blue waters. Surrounded by rugged ridges, visiting Gosaikunda offers trekkers panoramic mountain horizons stretching all the way from the Langtang range across to the distant peaks of the Annapurnas.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Stand by the shores of the sacred, high-altitude alpine waters of <strong>Gosaikunda Lake (4,380m)</strong>.</li>
            <li>Explore additional pristine mountain waters nearby, including Bhairav Kunda and Saraswati Kunda.</li>
            <li>Walk through the protected alpine ecosystems and dense oak forests of <strong>Langtang National Park</strong>.</li>
            <li>Witness commanding mountain views of <strong>Langtang Lirung, Ganesh Himal, and Manaslu</strong>.</li>
            <li>Experience the unique alpine high-country hospitality of the local Tamang and Sherpa tea house keepers.</li>
            <li>Enjoy a convenient short itinerary that eliminates any dependence on domestic mountain flights.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Clear blue waters of Gosaikunda Lake with mountain backdrop.png" alt="Gosaikunda Lake"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Gosaikunda+Lake'">
                <div class="gallery-caption">Sacred Gosaikunda Lake (4,380m)</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Snowy ridge views along Laurebina pass road trail.png" alt="Laurebina Pass"
                     onerror="this.src='https://placehold.co/400x250/5A7FBA/white?text=Laurebina+Pass'">
                <div class="gallery-caption">Stunning Views from Laurebina</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Ancient Buddhist monastery structure at Shin Gompa village.png" alt="Shin Gompa"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Shin+Gompa'">
                <div class="gallery-caption">Peaceful Shin Gompa Village</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Gosaikunda Lake Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Drive from Kathmandu to Dhunche (1,960m) along winding mountain roads (approx. 6-7 hours)</div>
            <div class="itinerary-day"><strong>Day 2:</strong> First day of trekking from Dhunche uphill through pine forests to Shin Gompa (3,330m)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Trek from Shin Gompa climbing steadily past Laurebina ridge to Gosaikunda Lake (4,380m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Rest and exploration day at Gosaikunda; optional hike around surrounding lakes and viewpoints</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Trek back down from Gosaikunda Lake following the ridge line down to Dhunche (1,960m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Drive from Dhunche back to Kathmandu; transfer to your hotel for a relaxing evening</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Departure transfer to International Airport</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$420</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-09-25">
            </div>

            <div class="form-group">
                <label>No. of Travelers</label>
                <div class="quantity-input">
                    <button type="button" onclick="adjustTravelers(-1)">-</button>
                    <input type="number" id="travelerCount" value="1" min="1" onchange="updateTotalPrice()">
                    <button type="button" onclick="adjustTravelers(1)">+</button>
                </div>
            </div>

            <div class="price-summary">
                <span>Total Price</span>
                <strong id="totalPriceDisplay">US$420</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.9 <span class="reviews-count">(7 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 420;
    let isUserLoggedIn = <%= isLoggedIn %>;

    function adjustTravelers(amount) {
        const input = document.getElementById('travelerCount');
        let currentVal = parseInt(input.value) || 1;
        currentVal += amount;
        if(currentVal < 1) currentVal = 1;
        input.value = currentVal;
        updateTotalPrice();
    }

    function updateTotalPrice() {
        const input = document.getElementById('travelerCount');
        let currentVal = parseInt(input.value) || 1;
        if(currentVal < 1) currentVal = 1;
        document.getElementById('totalPriceDisplay').innerText = 'US$' + (basePrice * currentVal);
    }

    function handleBookingFlow() {
        if (!isUserLoggedIn) {
            if(confirm("Please login to book this trek. Go to login page?")) {
                window.location.href = "${pageContext.request.contextPath}/views/auth/signin.jsp";
            }
        } else {
            // trekId=11 for Gosaikunda Lake Trek
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=11";
        }
    }
    
    function sendInquiry() {
        if (!isUserLoggedIn) {
            if(confirm("Please login to send inquiry. Go to login page?")) {
                window.location.href = "${pageContext.request.contextPath}/views/auth/signin.jsp";
            }
        } else {
            window.location.href = "${pageContext.request.contextPath}/views/contact.jsp";
        }
    }
</script>

<jsp:include page="/views/includes/footer.jsp" />
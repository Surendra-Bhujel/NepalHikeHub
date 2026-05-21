<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/ama-yangri-trekking.png" alt="Ama Yangri Trek Banner" class="banner-image">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Helambu">Helambu Region Trekking</a> &gt; 
    Ama Yangri Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Ama Yangri Trek - 3 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>3 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Helambu Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>Short Ridge Trek / Pilgrimage</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>3,771 m (12,372 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Easy to Moderate</div>
            <div class="overview-item"><strong>Transportation</strong><br>Private Jeep / Overland Drive</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Local Tea houses / Homestays</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Ama Yangri Trek</strong> is one of the closest and most rewarding short-duration trekking secrets near the Kathmandu Valley. Located in the beautiful Helambu region, this hidden alpine gem climbs up to the peak of Ama Yangri, which is revered by local Hyolmo Buddhists as the protective deity mother of the entire valley.
        </p>
        <p class="description">
            Ideal for weekend breaks, time-bounded hikers, or travelers seeking a quick high-altitude experience without long commitment, this loop brings you through peaceful pine forests and authentic, pristine cultural villages. Standing at the peak next to a gleaming white Stupa reveals unmatched close-up walls of the Jugal and Langtang mountain massifs.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Summit the spiritual peak of <strong>Ama Yangri (3,771m)</strong> and witness its legendary, majestic white mountaintop Chorten.</li>
            <li>Gaze upon jaw-dropping panoramic vistas of <strong>Langtang Lirung, Dorje Lakpa, Jugal Himal, and Shisha Pangma</strong>.</li>
            <li>Immerse yourself directly within the rare, unique cultural traditions of the indigenous <strong>Hyolmo communities</strong>.</li>
            <li>Wander through peaceful alpine routes lined with ancient prayer flags, stone walls, and thick rhododendron canopies.</li>
            <li>Enjoy a perfect 3-day short loop itinerary tailored excellently for families, weekend backpackers, and beginner hikers.</li>
            <li>Experience quick, seamless overland access completely free from domestic high-altitude flight dependencies.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/ama-yangri-view-of-mountain.png" alt="Ama Yangri Summit">
                <div class="gallery-caption">Ama Yangri Summit (3,771m)</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Traditional stone homes of Tarkeghyang Village.png" alt="Tarkeghyang Village">
                <div class="gallery-caption">Traditional Tarkeghyang Village</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/helambu-trekking-trail.png" alt="Helambu Trekking Trail">
                <div class="gallery-caption">Serene Pine Forest Trails</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Ama Yangri Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Drive from Kathmandu to the scenic village of Tarkeghyang (2,600m) or Sermanthang via Melamchi Bazaar (approx. 5-6 hours)</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Trek from Tarkeghyang up to the magical summit of <strong>Ama Yangri (3,771m)</strong> for breathtaking 360 views, then descend down to the quiet hamlet of Gekye Gompa (2,800m)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Morning descent trek back down to Timbu trailhead, meet your private vehicle, and drive back to Kathmandu</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$210</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-06-02">
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
                <strong id="totalPriceDisplay">US$210</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 5.0 <span class="reviews-count">(4 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 210;
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
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=10";
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
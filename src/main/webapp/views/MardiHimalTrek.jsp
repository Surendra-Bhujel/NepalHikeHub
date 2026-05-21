<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Mardi Himal Trek Variant.png" alt="Mardi Himal Trek Banner" class="banner-image">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Annapurna">Annapurna Region Trekking</a> &gt; 
    Mardi Himal Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Mardi Himal Trek - 9 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>9 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Annapurna Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>Eco-Trekking / Ridge Walk</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>4,500 m (14,764 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Moderate</div>
            <div class="overview-item"><strong>Transportation</strong><br>Private Vehicle / Jeep + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Cozy Mountain Tea Houses</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Mardi Himal Trek</strong> is a beautiful, relatively hidden gem situated just east of the legendary Annapurna Base Camp trail. Following a pristine, high-altitude ridgeline, this trek provides an eco-friendly journey through magical oak and rhododendron forests that suddenly open up into dramatic alpine meadows.
        </p>
        <p class="description">
            Because the trail climbs strictly along a ridge line, trekkers are treated to continuous, shifting, and deeply intimate perspectives of the giant South Face of Annapurna and the iconic, sacred peak of Machapuchare (Fishtail). Standing at the Mardi Himal Base Camp offers a stunning, close-up panoramic wall of towering ice and rock.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Stand directly under the towering shadow of Machapuchare at <strong>Mardi Himal Base Camp (4,500m)</strong>.</li>
            <li>Trek along a dramatic, high-altitude mountain ridge offering uninterrupted, dual-valley views.</li>
            <li>Gaze upon spectacular, close-up mountain panoramas of <strong>Annapurna South, Hiunchuli, and Fishtail</strong>.</li>
            <li>Wander through dense, enchanted forests exploding with colorful rhododendron blossoms in spring.</li>
            <li>Escape the heavy crowds of traditional routes on an eco-conscious, quieter, and cleaner mountain trail.</li>
            <li>Enjoy local hospitality in small, pristine settlement outposts like Badal Danda and High Camp.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Mardi Himal Base Camp overlooking Machapuchare peak.png" alt="Mardi Himal Base Camp">
                <div class="gallery-caption">Mardi Himal Base Camp (4,500m)</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Sunset reflections over the clouds from Mardi High Camp.png" alt="Sunset from High Camp">
                <div class="gallery-caption">Sunset from High Camp</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Machapuchare.jpg" alt="Mt Machapuchare">
                <div class="gallery-caption">Majestic Mt. Machapuchare</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Mardi Himal Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), check-in to your hotel, and evening welcome presentation</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Drive or fly from Kathmandu to the lakeside city of Pokhara (822m); afternoon leisure time</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Short drive to Kande, then begin trekking uphill through Australian Camp to Pothana/Deurali (2,100m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Leave the main loop trail; trek through quiet, dense forests to Forest Camp (2,550m)</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Trek from Forest Camp climbing past low camp shrubberies up to Badal Danda (3,250m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Short ridge trek from Badal Danda through alpine grasslands up to High Camp (3,580m)</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Early morning excursion hike to <strong>Mardi Himal Base Camp (4,500m)</strong> for sunrise, then descend all the way to Low Camp (2,970m)</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Trek down from Low Camp through traditional Gurung terraces to Siding Village, then drive back to Pokhara</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Drive or fly from Pokhara back to Kathmandu; transfer to airport for final international departure</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$390</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-05-10">
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
                <strong id="totalPriceDisplay">US$390</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.9 <span class="reviews-count">(9 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 390;
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
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=4";
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Langtang Ganja La Pass Trek Banner.png" alt="Langtang Ganja La Pass Trek Banner" class="banner-image">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Langtang">Langtang Region Trekking</a> &gt; 
    Langtang Ganja La Pass Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Langtang Ganja La Pass Trek - 14 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>14 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Langtang Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>High Pass Camping / Trekking</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>5,122 m (16,804 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Strenuous / Challenging</div>
            <div class="overview-item"><strong>Transportation</strong><br>Overland Bus / Jeep + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Tea houses & Wilderness Camping</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Full board meals during the trek</div>
        </div>

        <p class="description">
            The <strong>Langtang Ganja La Pass Trek</strong> is a thrilling, adventure-packed circuit designed for experienced hikers seeking true wilderness isolation. Traversing from the Langtang Valley into the beautiful Helambu region, this trek requires crossing the technical, ice-bound <strong>Ganja La Pass</strong>, one of Nepal's most demanding high-altitude crossings.
        </p>
        <p class="description">
            The rewards are monumental. After enjoying the typical tea house amenities of the upper Langtang trail, you will switch to fully-supported alpine wilderness camping. Navigating through remote, unpopulated valleys, you will stand eye-to-eye with dramatic ice ridges, frozen glacial lakes, and the towering border peaks of Tibet.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Conquer the formidable, snow-covered <strong>Ganja La Pass (5,122m)</strong> using ropes and specialized alpine safety gear.</li>
            <li>Experience the raw thrill of wilderness expedition camping in completely isolated mountain environments.</li>
            <li>Absorb jaw-dropping close-ups of <strong>Langtang Lirung (7,227m), Dorje Lakpa, and Ganesh Himal</strong>.</li>
            <li>Visit the spiritual monastery of <strong>Kyanjin Gompa</strong> and sample its historic alpine yak cheese.</li>
            <li>Transition seamlessly from the rugged Langtang gorges into the pristine cultural villages of Helambu.</li>
            <li>Avoid domestic flight schedules entirely with a direct overland scenic mountain drive.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Trekkers technical crossing through snowy Ganja La Pass.png" alt="Trekkers technical crossing through snowy Ganja La Pass">
                <div class="gallery-caption">Conquering Ganja La Pass (5,122m)</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Expedition tents pitched on snowy high pass terrain.png" alt="Expedition tents pitched on snowy high pass terrain">
                <div class="gallery-caption">High Alpine Wilderness Camp</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Lush green Helambu valley hills and terraced farms.png" alt="Lush green Helambu valley hills and terraced farms">
                <div class="gallery-caption">Descending Into Helambu</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Langtang Ganja La Pass Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), transfer to hotel, and final technical climbing gear briefing</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Drive from Kathmandu to Syabrubesi (1,550m) via scenic mountain highway (approx. 7-8 hours)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Trek from Syabrubesi along the roaring Langtang River to Lama Hotel (2,480m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Trek from Lama Hotel through lush forests to the open valley at Langtang Village (3,430m)</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Trek from Langtang Village to the spiritual sanctuary of Kyanjin Gompa (3,870m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Acclimatization and Climbing Practice Day at Kyanjin Gompa; optional hike up Kyanjin Ri</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Cross the river and trek south into the true wilderness to Ganja La Phedi Camp (4,300m); overnight in tents</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Summit day: Wake up at 4 AM, cross the demanding <strong>Ganja La Pass (5,122m)</strong>, and descend to Keldang (4,270m); overnight in tents</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Trek from Keldang along lonely, panoramic ridges down to Yak Kharka (4,000m); overnight in tents</div>
            <div class="itinerary-day"><strong>Day 10:</strong> Return to civilization trail; trek from Yak Kharka to the scenic Helambu village of Tarkeghyang (2,600m)</div>
            <div class="itinerary-day"><strong>Day 11:</strong> Trek from Tarkeghyang through rich forest pathways to Sermanthang (2,590m)</div>
            <div class="itinerary-day"><strong>Day 12:</strong> Final trek from Sermanthang down to Melamchi Pul Bazaar trailhead (870m)</div>
            <div class="itinerary-day"><strong>Day 13:</strong> Drive from Melamchi Pul Bazaar back to Kathmandu; check-in to your hotel for a celebratory dinner</div>
            <div class="itinerary-day"><strong>Day 14:</strong> Final souvenir shopping and departure transfer to International Airport</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$1150</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-10-15">
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
                <strong id="totalPriceDisplay">US$1150</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.7 <span class="reviews-count">(3 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 1150;
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
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=12";
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
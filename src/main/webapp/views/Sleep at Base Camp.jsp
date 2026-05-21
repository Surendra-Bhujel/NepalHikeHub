<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Sleep at Base Camp on Everest Trek Banner.png" alt="Sleep at Base Camp on Everest Trek Banner" class="banner-image"
         onerror="this.src='https://placehold.co/1200x400/2F4A85/white?text=Sleep+at+Base+Camp+Trek'">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Everest">Everest Region Trekking</a> &gt; 
    Sleep at Base Camp on Everest Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Sleep at Base Camp on Everest Trek - 15 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>15 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Everest Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>High Altitude Trekking</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>5,364 m (17,598 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Strenuous / Challenging</div>
            <div class="overview-item"><strong>Transportation</strong><br>Domestic Flight + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Tea houses & Base Camp Tents</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Full board meals during the trek</div>
        </div>

        <p class="description">
            The <strong>Sleep at Base Camp on Everest Trek</strong> is an extraordinary, upgraded version of the classic Everest base route. Unlike standard treks where you visit and leave the same afternoon, this itinerary grants you the rare privilege of spending an incredible night sleeping in a high-quality tented camp directly on the moving Khumbu Glacier at Everest Base Camp.
        </p>
        <p class="description">
            Immerse yourself fully in the true expedition atmosphere, surrounded by mountaineers preparing to summit the world's highest peak. Watch the golden sunset and silver starlight drape across Nuptse, Lhotse, and Mount Everest.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Experience a rare, ultimate overnight stay inside an expedition tent camp directly at <strong>Everest Base Camp (5,364m)</strong>.</li>
            <li>Take a thrilling, scenic mountain flight in and out of the legendary <strong>Lukla Airport (2,840m)</strong>.</li>
            <li>Acclimatize in the vibrant Sherpa hub of <strong>Namche Bazaar</strong> and explore the historic Tengboche Monastery.</li>
            <li>Stand on the iconic viewpoint of <strong>Kala Patthar (5,550m)</strong> for unmatched panoramic views of Mount Everest.</li>
            <li>Trek through the breathtaking alpine wilderness of Sagarmatha National Park, a UNESCO World Heritage site.</li>
            <li>Mingle with international expedition teams and experience firsthand the thrilling rhythm of base camp life.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Tents pitched at Everest Base Camp.png" alt="Tents at Everest Base Camp"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=EBC+Camping'">
                <div class="gallery-caption">Overnight Camping at EBC</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Namche Bazaar town view.png" alt="Namche Bazaar"
                     onerror="this.src='https://placehold.co/400x250/5A7FBA/white?text=Namche+Bazaar'">
                <div class="gallery-caption">Vibrant Namche Bazaar</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Mount Everest view from Kala Patthar peak.png" alt="Everest View from Kala Patthar"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Kala+Patthar'">
                <div class="gallery-caption">Everest View from Kala Patthar</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Sleep at Base Camp on Everest Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), transfer to hotel and pre-trip preparation</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Fly from Kathmandu/Ramechhap to Lukla (2,840m), trek to Phakding (2,610m)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Trek from Phakding to the bustling Sherpa capital of Namche Bazaar (3,440m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Acclimatization Day in Namche Bazaar; hike to Everest View Hotel</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Trek from Namche Bazaar to Tengboche Monastery (3,860m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Trek from Tengboche through alpine landscapes to Dingboche (4,410m)</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Second Acclimatization Day in Dingboche; optional high ridge day hike</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Trek from Dingboche alongside the Khumbu Glacier moraine to Lobuche (4,910m)</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Trek to Gorak Shep (5,140m), continue to Everest Base Camp (5,364m) and set up for overnight stay in tents</div>
            <div class="itinerary-day"><strong>Day 10:</strong> Wake up at Base Camp, trek to Gorak Shep, hike up Kala Patthar (5,550m) for sunrise, then descend to Pheriche (4,240m)</div>
            <div class="itinerary-day"><strong>Day 11:</strong> Trek back down from Pheriche to Namche Bazaar via Tengboche</div>
            <div class="itinerary-day"><strong>Day 12:</strong> Trek from Namche Bazaar back to Lukla; final evening celebration with crew</div>
            <div class="itinerary-day"><strong>Day 13:</strong> Morning flight back to Kathmandu; transfer to your hotel</div>
            <div class="itinerary-day"><strong>Day 14:</strong> Contingency/Buffer day in Kathmandu for potential flight delays; farewell dinner</div>
            <div class="itinerary-day"><strong>Day 15:</strong> Final departure transfer to International Airport</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$1450</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-10-05">
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
                <strong id="totalPriceDisplay">US$1450</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.9 <span class="reviews-count">(12 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 1450;
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
            // trekId=7 for Sleep at Base Camp Trek
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=7";
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
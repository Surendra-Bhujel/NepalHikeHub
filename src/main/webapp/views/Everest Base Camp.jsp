<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Everest Base Camp Trek 14 Days Banner.png" alt="Everest Base Camp Trek Banner" class="banner-image">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Everest">Everest Region Trekking</a> &gt; 
    Everest Base Camp Trek - 14 Days
</div>

<main class="container">
    <section class="left-column">
        <h1>Everest Base Camp Trek - 14 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>14 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Everest Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>High Altitude Lodge Trek</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>5,550 m (18,208 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Strenuous / Challenging</div>
            <div class="overview-item"><strong>Transportation</strong><br>Domestic Flight + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Mountain Tea Houses</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The classic <strong>Everest Base Camp Trek - 14 Days</strong> is arguably the most famous and iconic high-altitude alpine journey on earth. Tracing the historic routes forged by early legendary mountaineers, this trip leads you directly into the amphitheater of the world's grandest peaks.
        </p>
        <p class="description">
            Your path ascends smoothly through spectacular rhododendron forests, over rushing suspension bridges, and into high-altitude Sherpa settlements. With strategic acclimatization breaks designed carefully into the 14-day timeline, you will cross the frozen Khumbu moraine to touch Everest Base Camp before conquering Kala Patthar for unforgettable mountain panoramas.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Stand triumphantly at the foot of the planet's highest peak at <strong>Everest Base Camp (5,364m)</strong>.</li>
            <li>Climb the legendary black-rock peak of <strong>Kala Patthar (5,550m)</strong> for a dramatic, panoramic view of Mt. Everest.</li>
            <li>Savor a thrilling, highly scenic mountain flight into the alpine airfield at <strong>Lukla Airport</strong>.</li>
            <li>Immerse yourself deeply in Sherpa Buddhist tradition inside Namche Bazaar and the historic <strong>Tengboche Monastery</strong>.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/he iconic rock landmark marking Everest Base Camp elevation.png" alt="Everest Base Camp">
                <div class="gallery-caption">Everest Base Camp (5,364m)</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Historic Tengboche Monastery with mountain backdrop.png" alt="Tengboche Monastery">
                <div class="gallery-caption">Historic Tengboche Monastery</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Close up view of the striking Mt Ama Dablam peak along the trail.png" alt="Mt Ama Dablam">
                <div class="gallery-caption">Majestic Mt. Ama Dablam</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Everest Base Camp Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), greeting and hotel transfer, followed by an evening trip briefing</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Flight from Kathmandu/Ramechhap to Lukla (2,840m), then trek along rivers to Phakding (2,610m)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Trek from Phakding climbing high through pine forests up to the Sherpa hub of Namche Bazaar (3,440m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Acclimatization Day in Namche Bazaar; optional scenic ridge walk to the Everest View Hotel</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Trek from Namche Bazaar along panoramic ridges to the spiritual grounds of Tengboche Monastery (3,860m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Trek from Tengboche descending down through forests before climbing up to the alpine fields of Dingboche (4,410m)</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Second Acclimatization Day in Dingboche; optional high ridge walk for views of Ama Dablam and Makalu</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Trek from Dingboche skirting alongside the lateral moraine of the Khumbu Glacier up to Lobuche (4,910m)</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Trek to Gorak Shep (5,140m), continue to Everest Base Camp (5,364m), then return to Gorak Shep</div>
            <div class="itinerary-day"><strong>Day 10:</strong> Early morning steep climb up Kala Patthar (5,550m) for sunrise views over Everest, then descend down to Pheriche (4,240m)</div>
            <div class="itinerary-day"><strong>Day 11:</strong> Trek from Pheriche traveling down through local valleys and hills back to Namche Bazaar (3,440m)</div>
            <div class="itinerary-day"><strong>Day 12:</strong> Final day of walking; trek from Namche Bazaar down to Lukla (2,840m) for an evening farewell celebration</div>
            <div class="itinerary-day"><strong>Day 13:</strong> Catch an early morning mountain flight from Lukla back to Kathmandu; transfer to hotel for a relaxing afternoon</div>
            <div class="itinerary-day"><strong>Day 14:</strong> Final day for independent leisure or souvenir hunting before final departure transfer to International Airport</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$1290</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-10-01">
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
                <strong id="totalPriceDisplay">US$1290</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.9 <span class="reviews-count">(24 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 1290;
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
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=1";
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
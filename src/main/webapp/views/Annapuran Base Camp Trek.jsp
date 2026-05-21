<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Annapurna-Dhaulagiri.png" alt="Annapurna Base Camp Trek Banner" class="banner-image">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Annapurna">Annapurna Region Trekking</a> &gt; 
    Annapurna Base Camp Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Annapurna Base Camp Trek - 14 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>14 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Annapurna Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>High Altitude Sanctuary Trek</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>4,130 m (13,549 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Moderate</div>
            <div class="overview-item"><strong>Transportation</strong><br>Private Vehicle / Local Bus + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Mountain Tea houses</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Annapurna Base Camp Trek</strong> (often called the ABC Trek) is a legendary walk that places you inside a breathtaking amphitheater of towering glaciers and rock walls. Unlike treks that only offer views of big peaks from a distance, this trail winds directly into the high-altitude heart of the mountain range.
        </p>
        <p class="description">
            As you journey inward, you will climb alongside the roaring Modi Khola river, walking under dense canopies of bamboo, oak, and rhododendron forests. The loop culminates inside the sacred Annapurna Sanctuary, where you are treated to a jaw-dropping, close-up 360-degree panorama of Annapurna I, Annapurna South, Hiunchuli, and the iconic spear of Mt. Machapuchare.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Stand inside the majestic, snow-covered amphitheater of the <strong>Annapurna Sanctuary (4,130m)</strong>.</li>
            <li>Gaze out at incredible close-up walls of <strong>Annapurna I (8,091m)</strong>, the 10th highest peak in the world.</li>
            <li>Savor a magnificent view of the sacred, unclimbed twin peak of <strong>Machapuchare (Fishtail Mountain)</strong>.</li>
            <li>Soak away your trail fatigue in the natural, therapeutic riverside hot springs at <strong>Tatopani or Jhinu Danda</strong>.</li>
            <li>Immerse yourself deeply into traditional mountain lifestyles within Gurung and Magar cultural outposts.</li>
            <li>Traverse a highly diverse ecosystem shifting seamlessly from lush, jungle-like rivers up into alpine glaciers.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Annapurna-Base-Camp-Trek.png" alt="Annapurna Base Camp">
                <div class="gallery-caption">Annapurna Base Camp (4,130m)</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Machapuchare.jpg" alt="Machapuchare Mountain">
                <div class="gallery-caption">Machapuchare Base Camp</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/modi-river-from-mount-annapurna-next-to-hot-spring-pool-of-jhinu-danda.png" alt="Natural Hot Springs">
                <div class="gallery-caption">Natural Hot Springs at Jhinu</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Annapurna Base Camp Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), check-in to hotel, and final pre-trip documentation check</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Scenic drive from Kathmandu to the lakeside mountain resort town of Pokhara (822m) via highway</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Drive from Pokhara to Nayapul trailhead, then begin trekking uphill through green fields to Tikhedhunga (1,540m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Climb the famous stone staircase of Ulleri, then trek through dense rhododendron forests to Ghorepani (2,870m)</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Early morning hike to <strong>Poon Hill (3,210m)</strong> for sunrise, trek back down to Ghorepani, then continue to Tadapani (2,630m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Trek from Tadapani descending steeply into the valley gorge, crossing rivers up to Chhomrong village (2,170m)</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Follow the stone trails down to the river, then climb back up through bamboo thickets to Dovan (2,600m)</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Trek from Dovan past the sacred Hinku Cave, climbing above the tree line to Deurali (3,230m)</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Journey into the inner sanctuary; trek past <strong>Machapuchare Base Camp (3,700m)</strong> to reach Annapurna Base Camp (4,130m)</div>
            <div class="itinerary-day"><strong>Day 10:</strong> Capture the golden sunrise over the glaciers at base camp, then trace your steps back down the valley to Bamboo (2,310m)</div>
            <div class="itinerary-day"><strong>Day 11:</strong> Trek from Bamboo climbing back up past Chhomrong, then descend to the hot springs village at Jhinu Danda (1,780m)</div>
            <div class="itinerary-day"><strong>Day 12:</strong> Final morning walk along the river flatlands to Siwai, meet your private vehicle, and drive back to Pokhara (822m)</div>
            <div class="itinerary-day"><strong>Day 13:</strong> Drive or catch a domestic scenic flight from Pokhara back to Kathmandu; transfer to your hotel</div>
            <div class="itinerary-day"><strong>Day 14:</strong> Souvenir hunting and departure transfer to International Airport</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$650</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-10-12">
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
                <strong id="totalPriceDisplay">US$650</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.9 <span class="reviews-count">(15 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 650;
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
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=2";
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Three Highest Passes Trek Banner.png" alt="Three Highest Passes Trek Banner" class="banner-image" 
         onerror="this.src='https://placehold.co/1200x400/2F4A85/white?text=Three+Highest+Passes+Trek'">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Everest">Everest Region Trekking</a> &gt; 
    Three Highest Passes Trek by Road
</div>

<main class="container">
    <section class="left-column">
        <h1>Three Highest Passes Trek by Road - 19 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>19 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Everest Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>High Pass Alpine Trek</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>5,550 m (18,208 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Very Strenuous / Extreme</div>
            <div class="overview-item"><strong>Transportation</strong><br>Overland Jeep / Bus + Foot</div>
            <div class="overview-item"><strong>Accommodation</strong><br>Tea houses and mountain lodges</div>
            <div class="overview-item"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Three Highest Passes Trek by Road</strong> is the ultimate alpine challenge in the Khumbu region, customized for purists who want to experience the true topography of Nepal completely overland. By skipping the mountain flight to Lukla, this version begins with a scenic, rugged drive to the trailhead, allowing for an authentic, traditional approach route.
        </p>
        <p class="description">
            This circuit crosses the three formidable high-altitude cols of the Everest region: <strong>Renjo La, Cho La, and Kongma La</strong>. Alongside these passes, you will explore the turquoise Gokyo Lakes, stand at Everest Base Camp, and climb the premier viewpoints of Gokyo Ri and Kala Patthar.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Conquer the three giant alpine passes: <strong>Kongma La (5,535m), Cho La (5,420m), and Renjo La (5,360m)</strong>.</li>
            <li>Avoid flight disruptions entirely by accessing the Everest region via a scenic, rugged overland road journey.</li>
            <li>Marvel at unmatched, pristine high-altitude vistas of four 8,000m+ peaks: Everest, Lhotse, Makalu, and Cho Oyu.</li>
            <li>Discover the stunning, deep blue alpine waters of the sacred <strong>Gokyo Lakes</strong> and summit Gokyo Ri.</li>
            <li>Stand at the iconic <strong>Everest Base Camp (5,364m)</strong> and scale Kala Patthar for ultimate close-up mountain views.</li>
            <li>Experience extended acclimatization and trace the historical footpaths used by early climbing expeditions.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/View of Gokyo Lakes from Renjo La Pass.png" alt="View from Renjo La Pass"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Renjo+La+Pass'">
                <div class="gallery-caption">View from Renjo La Pass</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Turquoise Gokyo Lakes and surrounding peaks.png" alt="Gokyo Lakes"
                     onerror="this.src='https://placehold.co/400x250/5A7FBA/white?text=Gokyo+Lakes'">
                <div class="gallery-caption">Sacred Gokyo Lakes</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Hikers crossing the Cho La Pass glacier.png" alt="Crossing Cho La Pass"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Cho+La+Pass'">
                <div class="gallery-caption">Crossing Cho La Pass</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Three Highest Passes Trek by Road</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), hotel check-in and detailed gear checklist inspection</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Drive from Kathmandu to Salleri/Phaplu (2,469m) via local highway and valleys (approx. 8-9 hours)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Overland Jeep drive from Salleri to Thathamka/Paiya trail head (2,730m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Trek from Paiya through pristine forests and ridges to Phakding (2,610m)</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Trek from Phakding up to the high Sherpa capital of Namche Bazaar (3,440m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Acclimatization Day in Namche Bazaar; health monitoring checks and viewpoint hike</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Trek from Namche Bazaar along panoramic trails to Tengboche Monastery (3,860m)</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Trek from Tengboche through alpine meadows up to Dingboche (4,410m)</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Acclimatization Day in Dingboche; prepare high-altitude trekking gear for the first pass</div>
            <div class="itinerary-day"><strong>Day 10:</strong> Cross the first pass: <strong>Kongma La Pass (5,535m)</strong>, then descend to Lobuche (4,910m)</div>
            <div class="itinerary-day"><strong>Day 11:</strong> Trek to Gorak Shep, visit <strong>Everest Base Camp (5,364m)</strong>, and return to Gorak Shep (5,140m)</div>
            <div class="itinerary-day"><strong>Day 12:</strong> Climb Kala Patthar (5,550m) for sunrise views, trek back to Lobuche and continue to Dzongla (4,830m)</div>
            <div class="itinerary-day"><strong>Day 13:</strong> Cross the second pass: <strong>Cho La Pass (5,420m)</strong> across the glacier, descend to Thagnak (4,700m)</div>
            <div class="itinerary-day"><strong>Day 14:</strong> Short trek from Thagnak to the beautiful <strong>Gokyo Lakes resort village (4,790m)</strong>; afternoon Gokyo Ri climb</div>
            <div class="itinerary-day"><strong>Day 15:</strong> Cross the third pass: <strong>Renjo La Pass (5,360m)</strong>, then descend into the remote Bhote Koshi valley to Lungden (4,380m)</div>
            <div class="itinerary-day"><strong>Day 16:</strong> Trek from Lungden down through ancient trading trails to Thame Village (3,820m)</div>
            <div class="itinerary-day"><strong>Day 17:</strong> Trek from Thame back down to Namche Bazaar and continue descending to Surke (2,290m)</div>
            <div class="itinerary-day"><strong>Day 18:</strong> Catch an early morning return overland Jeep/vehicle drive from the trailhead back to Kathmandu; hotel transfer</div>
            <div class="itinerary-day"><strong>Day 19:</strong> Final shopping options and departure transfer to International Airport</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$1680</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-09-12">
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
                <strong id="totalPriceDisplay">US$1680</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.9 <span class="reviews-count">(8 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 1680;
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
            // Redirect to booking page with trekId parameter
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=6";
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
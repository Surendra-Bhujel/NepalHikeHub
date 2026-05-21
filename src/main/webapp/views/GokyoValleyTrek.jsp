<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Gokyo Valley Circuit Trek Banner.png" alt="Gokyo Valley Circuit Trek Banner" class="banner-image"
         onerror="this.src='https://placehold.co/1200x400/2F4A85/white?text=Gokyo+Valley+Trek'">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Everest">Everest Region Trekking</a> &gt; 
    Gokyo Valley Circuit Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Gokyo Valley Circuit Trek - 13 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>13 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Everest Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>Alpine Lake Trekking</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>5,357 m (17,575 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Moderate to Strenuous</div>
            <div class="overview-item"><strong>Transportation</strong><br>Domestic Flight + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Mountain Tea houses</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Gokyo Valley Circuit Trek</strong> offers an exceptional alternative to the traditional Everest Base Camp route, leading you into a pristine valley characterized by dramatic glacial landscapes and sacred alpine lakes. This trek is ideal for those seeking quieter trails, panoramic views, and a unique perspective of the Khumbu region.
        </p>
        <p class="description">
            The absolute highlight of this journey is exploring the six shimmering, turquoise <strong>Gokyo Lakes</strong> and climbing the iconic peak of <strong>Gokyo Ri</strong>. From its summit, you will experience an unobstructed, breathtaking view of four of the world's highest peaks: Mount Everest, Lhotse, Makalu, and Cho Oyu.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Marvel at the collection of six magnificent, pristine oligotrophic <strong>Gokyo Lakes</strong> fed by Himalayan glaciers.</li>
            <li>Climb the legendary viewpoint of <strong>Gokyo Ri (5,357m)</strong> for unparalleled panoramic vistas of Mount Everest.</li>
            <li>Hike alongside the massive <strong>Ngozumpa Glacier</strong>, the longest glacier in the entire Himalayas.</li>
            <li>Fly in and out of the thrilling mountain airstrip of <strong>Lukla Airport (2,840m)</strong>.</li>
            <li>Immerse yourself deeply in local cultures within the Sherpa settlements of <strong>Namche Bazaar</strong> and Gokyo.</li>
            <li>Enjoy a less crowded, visually dramatic mountain trail that showcases alpine nature at its finest.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Panoramic mountain views from Gokyo Ri summit.png" alt="Gokyo Ri View"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Gokyo+Ri'">
                <div class="gallery-caption">Panoramic View from Gokyo Ri</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Clear turquoise waters of the third Gokyo Lake.png" alt="Third Gokyo Lake"
                     onerror="this.src='https://placehold.co/400x250/5A7FBA/white?text=Gokyo+Lake'">
                <div class="gallery-caption">The Sacred Third Gokyo Lake</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Trekkers walking alongside the massive Ngozumpa Glacier.png" alt="Ngozumpa Glacier"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Ngozumpa+Glacier'">
                <div class="gallery-caption">The Mighty Ngozumpa Glacier</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Gokyo Valley Circuit Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), transfer to hotel and orientation briefing</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Scenic flight from Kathmandu/Ramechhap to Lukla (2,840m), trek to Phakding (2,610m)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Trek from Phakding up to the vibrant hub of Namche Bazaar (3,440m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Acclimatization Day in Namche Bazaar; optional hike to the Everest View Hotel</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Trek from Namche Bazaar through rhododendron forests to Phortse Tenga (3,680m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Trek from Phortse Tenga climbing steadily up to Machhermo (4,470m)</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Acclimatization and rest day in Machhermo; brief high-altitude acclimatization walks</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Trek from Machhermo past the first lakes to the beautiful Gokyo Village (4,790m)</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Early morning climb to <strong>Gokyo Ri (5,357m)</strong> for sunrise views; afternoon exploration of the fourth and fifth lakes</div>
            <div class="itinerary-day"><strong>Day 10:</strong> Trek down from Gokyo village through Dole to Phortse Village (3,810m)</div>
            <div class="itinerary-day"><strong>Day 11:</strong> Trek from Phortse village down along the trail back to Namche Bazaar (3,440m)</div>
            <div class="itinerary-day"><strong>Day 12:</strong> Final trek from Namche Bazaar back down to Lukla (2,840m) for a celebratory evening</div>
            <div class="itinerary-day"><strong>Day 13:</strong> Morning flight back to Kathmandu; transfer to your hotel for departure</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$1220</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-10-10">
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
                <strong id="totalPriceDisplay">US$1220</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.9 <span class="reviews-count">(10 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 1220;
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
            // trekId=5 for Gokyo Valley Circuit Trek
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=5";
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
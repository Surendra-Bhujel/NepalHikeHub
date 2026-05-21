<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Ghorepani Poon Hill Trek Banner.png" alt="Ghorepani Poon Hill Trek Banner" class="banner-image">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Annapurna">Annapurna Region Trekking</a> &gt; 
    Ghorepani Poon Hill Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Ghorepani Poon Hill Trek - 8 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>8 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Annapurna Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>Trekking/Hiking/Nature Walk</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>3,210 m (10,531 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Easy to Moderate</div>
            <div class="overview-item"><strong>Transportation</strong><br>Private Vehicle/Bus + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Tea houses and lodges</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Ghorepani Poon Hill Trek</strong> is a classic, short multi-day trek that offers a perfect introduction to hiking in the majestic Himalayas of Nepal. Ideal for families, beginners, and travelers with limited time, this route winds through vibrant local villages and pristine nature.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Enjoy an iconic sunrise from <strong>Poon Hill (3,210m)</strong> over panoramic, snow-capped Himalayan peaks.</li>
            <li>Marvel at spectacular views of <strong>Annapurna South, Machapuchare (Fishtail), and Dhaulagiri</strong>.</li>
            <li>Immerse yourself in authentic cultural experiences in traditional Gurung and Magar villages.</li>
            <li>Walk along ancient stone-staircase trails through enchanting, dense rhododendron and oak forests.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Sunrise from Poon Hill.png" alt="Poon Hill Sunrise">
                <div class="gallery-caption">Sunrise from Poon Hill (3,210m)</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Traditional Ghandruk Gurung Village.png" alt="Ghandruk Village">
                <div class="gallery-caption">Beautiful Ghandruk Village</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Blossoming Rhododendron Trail in Annapurna.png" alt="Rhododendron Trail">
                <div class="gallery-caption">Enchanting Forest Trails</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Ghorepani Poon Hill Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), transfer to hotel and trip briefing</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Drive from Kathmandu to Pokhara (822m) via scenic highway (approx. 6-7 hours)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Drive to Tikhedhunga/Ulleri, then trek to Ulleri (1,960m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Trek from Ulleri to Ghorepani (2,880m) through rhododendron forests</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Early morning hike to Poon Hill (3,210m) for sunrise views, then trek to Tadapani (2,630m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Trek from Tadapani to the beautiful Gurung village of Ghandruk (1,940m)</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Trek to Nayapul, drive back to Pokhara (822m) for a relaxing lakeside evening</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Drive or take a scenic flight from Pokhara back to Kathmandu</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$280</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-05-16">
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
                <strong id="totalPriceDisplay">US$280</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 5.0 <span class="reviews-count">(5 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 280;
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
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=8";
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
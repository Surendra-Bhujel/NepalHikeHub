<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Langtang Valley Trek Banner.png" alt="Langtang Valley Trek Banner" class="banner-image"
         onerror="this.src='https://placehold.co/1200x400/2F4A85/white?text=Langtang+Valley+Trek'">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Langtang">Langtang Region Trekking</a> &gt; 
    Langtang Valley Trek
</div>

<main class="container">
    <section class="left-column">
        <h1>Langtang Valley Trek - 10 Days</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>10 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Langtang Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>Trekking/Hiking/Culture</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>4,984 m (16,351 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Moderate</div>
            <div class="overview-item"><strong>Transportation</strong><br>Private Jeep / Public Bus</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Tea houses and local lodges</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Langtang Valley Trek</strong> is a spectacular journey into one of Nepal's most beautiful alpine sanctuaries, located remarkably close to the Kathmandu valley. Known as "the valley of glaciers," this trek offers a stunning mixture of snow-capped peaks, sweeping pine forests, and high pastures, all backdropped by the towering Langtang Lirung massif.
        </p>
        <p class="description">
            Often regarded as a less-crowded alternative to Annapurna or Everest, this trail explores the resilient and warm hospitality of the local Tamang and Tibetan-influenced communities. The adventure reaches its ultimate climax at Kyanjin Gompa, where a hike up to Kyanjin Ri reveals a jaw-dropping, 360-degree theater of ice and rock.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Climb to the top of <strong>Kyanjin Ri (4,773m) or Tserko Ri (4,984m)</strong> for unbelievable panoramic mountain views.</li>
            <li>Explore the historic, peaceful Buddhist monastery of <strong>Kyanjin Gompa</strong> and its famous local yak cheese factory.</li>
            <li>Trek through the rich biodiversity of <strong>Langtang National Park</strong>, home to the elusive Red Panda.</li>
            <li>Immerse yourself in the authentic culture, unique traditions, and architecture of the Tamang people.</li>
            <li>Walk among deep river gorges, fields of alpine wildflowers, and dramatic sweeping glacial moraines.</li>
            <li>Enjoy a convenient overland approach route that completely skips the need for domestic mountain flights.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Kyanjin Gompa settlement surrounded by high mountains.png" alt="Kyanjin Gompa"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Kyanjin+Gompa'">
                <div class="gallery-caption">Beautiful Kyanjin Gompa</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Close up view of snow capped Langtang Lirung peak.png" alt="Langtang Lirung"
                     onerror="this.src='https://placehold.co/400x250/5A7FBA/white?text=Langtang+Lirung'">
                <div class="gallery-caption">Majestic Langtang Lirung</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Yaks grazing along the river flatlands in Langtang.png" alt="Yaks in Langtang"
                     onerror="this.src='https://placehold.co/400x250/2F4A85/white?text=Yak+Pastures'">
                <div class="gallery-caption">High Altitude Yak Pastures</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Langtang Valley Trek</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), transfer to hotel, and final trip briefing</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Scenic drive from Kathmandu to Syabrubesi (1,550m) via winding mountain roads (approx. 7-8 hours)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> First day of trekking from Syabrubesi along the Langtang River to Lama Hotel (2,480m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Trek from Lama Hotel through lush forests up to the rebuilt Langtang Village (3,430m)</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Short, scenic trek from Langtang Village to the spiritual settlement of Kyanjin Gompa (3,870m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Acclimatization and Exploration Day; morning hike up to <strong>Kyanjin Ri (4,773m)</strong> or <strong>Tserko Ri (4,984m)</strong></div>
            <div class="itinerary-day"><strong>Day 7:</strong> Begin the descent from Kyanjin Gompa back down through the valley trail to Lama Hotel (2,480m)</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Trek from Lama Hotel down past terraced farmlands to Syabrubesi (1,550m)</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Drive from Syabrubesi back to Kathmandu; transfer to hotel for a relaxing final evening</div>
            <div class="itinerary-day"><strong>Day 10:</strong> Final departure drop-off to Tribhuvan International Airport</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$560</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-04-20">
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
                <strong id="totalPriceDisplay">US$560</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 4.8 <span class="reviews-count">(14 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 560;
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
            // Redirect to booking page with trekId=3 (Langtang Valley Trek)
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=3";
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
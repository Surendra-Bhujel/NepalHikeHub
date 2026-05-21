<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User" %>
<%
    User currentUser = (User) session.getAttribute("user");
    boolean isLoggedIn = (currentUser != null);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.css">

<div class="banner-container">
    <img src="${pageContext.request.contextPath}/image/Annapurna Circuit.png" alt="Annapurna Circuit with Poon Hill Trek Banner" class="banner-image">
</div>

<div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/home.jsp">Home</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp">Trekking in Nepal</a> &gt; 
    <a href="${pageContext.request.contextPath}/views/trekking.jsp?region=Annapurna">Annapurna Region Trekking</a> &gt; 
    Annapurna Circuit with Poon Hill
</div>

<main class="container">
    <section class="left-column">
        <h1>Annapurna Circuit with Poon Hill Trek</h1>
        
        <div class="overview-grid">
            <div class="overview-item"><strong>Duration</strong><br>18 days</div>
            <div class="overview-item"><strong>Country/Region</strong><br>Nepal - Annapurna Region</div>
            <div class="overview-item"><strong>Trip Type</strong><br>High Pass Alpine Circuit</div>
            <div class="overview-item"><strong>Max Altitude</strong><br>5,416 m (17,769 ft)</div>
            <div class="overview-item"><strong>Difficulty</strong><br>Strenuous</div>
            <div class="overview-item"><strong>Transportation</strong><br>Private Jeep / Local Bus + Foot</div>
            <div class="overview-item" style="grid-column: span 1;"><strong>Accommodation</strong><br>Mountain Tea houses</div>
            <div class="overview-item" style="grid-column: span 2;"><strong>Meals</strong><br>Breakfast, lunch, and dinner available</div>
        </div>

        <p class="description">
            The <strong>Annapurna Circuit with Poon Hill Trek</strong> is widely celebrated as one of the ultimate diverse long-distance walks on the planet. This expanded route takes you completely around the magnificent Annapurna Massif, beginning in lush subtropical river valleys before crossing a high-altitude mountain pass, and concluding with a detour down through the lower foothills.
        </p>
        <p class="description">
            You will climb through changing climatic zones, moving from green terraced rice fields up to the high alpine desert of Manang. The ultimate challenge is conquering the frozen crest of the <strong>Thorong La Pass</strong>. From there, you will drop into the sacred pilgrimage grounds of Muktinath, navigate down the deep Kali Gandaki Gorge, and eventually climb Poon Hill for a legendary golden sunrise over two towering mountain chains.
        </p>

        <h2>Highlights</h2>
        <ul class="highlights-list">
            <li>Conquer the world-famous high-altitude alpine col of <strong>Thorong La Pass (5,416m)</strong>.</li>
            <li>Witness an iconic, panoramic mountain sunrise from <strong>Poon Hill (3,210m)</strong> over the Dhaulagiri and Annapurna ranges.</li>
            <li>Traverse an incredible range of biodiversity, shifting from subtropical jungles to Tibetan-style desert plateaus.</li>
            <li>Visit the sacred multi-faith pilgrimage sanctuary of <strong>Muktinath Temple</strong>, famous for its 108 waterspouts.</li>
            <li>Trace paths along the Kali Gandaki Gorge, recognized as one of the deepest river canyons on Earth.</li>
            <li>Immerse deeply within the diverse regional traditions of the Gurung, Thakali, and Manangi communities.</li>
        </ul>

        <h2>Sceneries from the Trail</h2>
        <div class="trek-gallery">
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Thorong La Pass.png" alt="Thorong La Pass">
                <div class="gallery-caption">Thorong La Pass (5,416m)</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Traditional Ghandruk Gurung Village.png" alt="Traditional Ghandruk Village">
                <div class="gallery-caption">The Alpine Desert of Manang</div>
            </div>
            <div class="gallery-item">
                <img src="${pageContext.request.contextPath}/image/Sunrise from Poon Hill.png" alt="Sunrise from Poon Hill">
                <div class="gallery-caption">Sunrise Over the Annapurnas</div>
            </div>
        </div>

        <h2>Day to Day Itinerary</h2>
        <p class="itinerary-sub">Day to Day Itinerary – Annapurna Circuit with Poon Hill</p>
        
        <div class="itinerary-list">
            <div class="itinerary-day"><strong>Day 1:</strong> Arrival in Kathmandu (1,400m), transfer to hotel, and comprehensive pre-trip briefing</div>
            <div class="itinerary-day"><strong>Day 2:</strong> Scenic overland drive from Kathmandu to Besisahar, continuing by jeep to Dharapani (1,860m)</div>
            <div class="itinerary-day"><strong>Day 3:</strong> Trek from Dharapani through pine forests and gorges up to Chame (2,670m)</div>
            <div class="itinerary-day"><strong>Day 4:</strong> Trek from Chame passing the majestic wall of Paungda Danda rock to Pisang (3,200m)</div>
            <div class="itinerary-day"><strong>Day 5:</strong> Upper trail trek from Pisang offering panoramic valley views to Manang Village (3,540m)</div>
            <div class="itinerary-day"><strong>Day 6:</strong> Strategic Acclimatization and rest day in Manang; optional day hike to Gangapurna Lake</div>
            <div class="itinerary-day"><strong>Day 7:</strong> Trek from Manang climbing steadily out of the tree lines up to Yak Kharka (4,110m)</div>
            <div class="itinerary-day"><strong>Day 8:</strong> Trek from Yak Kharka along mountain scree paths to Thorong Phedi High Camp (4,850m)</div>
            <div class="itinerary-day"><strong>Day 9:</strong> Big pass day: Early morning climb to cross <strong>Thorong La Pass (5,416m)</strong>, then descend to Muktinath (3,760m)</div>
            <div class="itinerary-day"><strong>Day 10:</strong> Visit Muktinath Temple, then catch a scenic drive or trek down past Jomsom to Marpha village (2,670m)</div>
            <div class="itinerary-day"><strong>Day 11:</strong> Overland drive or trek through the deepest Kali Gandaki valley canyon to Tatopani Hot Springs (1,190m)</div>
            <div class="itinerary-day"><strong>Day 12:</strong> Steep uphill trek from Tatopani through terraced villages to the large settlement of Ghorepani (2,870m)</div>
            <div class="itinerary-day"><strong>Day 13:</strong> Dawn hike up to <strong>Poon Hill (3,210m)</strong> for sunrise, trek down through Ghandruk to Nayapul trailhead, then drive to Pokhara (822m)</div>
            <div class="itinerary-day"><strong>Day 14:</strong> Rest and leisure day in the lakeside city of Pokhara</div>
            <div class="itinerary-day"><strong>Day 15:</strong> Drive or take a domestic flight from Pokhara back to Kathmandu; transfer to hotel</div>
            <div class="itinerary-day"><strong>Day 16:</strong> Final shopping opportunities and departure transfer to International Airport</div>
        </div>
    </section>

    <aside class="right-column">
        <div class="booking-card">
            <div class="price-header">
                <div>
                    <span class="label">Price From</span>
                    <span class="price-val">US$890</span>
                </div>
                <span class="group-price">We offer group price +</span>
            </div>

            <div class="form-group">
                <label>Departure Date</label>
                <input type="date" id="departureDate" value="2026-10-02">
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
                <strong id="totalPriceDisplay">US$890</strong>
            </div>

            <div class="booking-actions">
                <button class="btn-primary" onclick="handleBookingFlow()">BOOK NOW</button>
            </div>

            <div class="rating">
                <i class="fas fa-star text-accent"></i> 5.0 <span class="reviews-count">(16 reviews)</span>
            </div>

            <button class="btn-widget-outline" style="margin-top: 15px;" onclick="sendInquiry()">Send Inquiry</button>
        </div>
    </aside>
</main>

<script>
    const basePrice = 890;
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
            window.location.href = "${pageContext.request.contextPath}/views/booking.jsp?trekId=9";
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
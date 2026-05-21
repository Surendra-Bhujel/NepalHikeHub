<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">

<main>
    <!-- Hero Section -->
    <section class="hero">
        <div class="hero-content">
            <h1>"Your Journey to the Peaks Begins Here."</h1>
            <p>Discover the beauty of Nepal's Himalayas with expert guides, seamless booking, and unforgettable experiences tailored just for you.</p>
            <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-hero">Explore More →</a>
        </div>
    </section>

    <!-- Features Section -->
    <section class="section">
        <div class="features-grid">
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-hiking"></i></div>
                <h3>Trekking</h3>
                <p>Explore through Nepal's Himalayas, where every step reveals breathtaking views.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-bus"></i></div>
                <h3>Touring</h3>
                <p>Explore Nepal's vibrant culture, ancient temples, and scenic landscapes.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-mountain"></i></div>
                <h3>Peak Climbing</h3>
                <p>Climb Nepal's majestic peaks and witness breathtaking Himalayan views.</p>
            </div>
        </div>
    </section>

    <!-- Welcome Section -->
    <section class="welcome-section">
        <div class="section-title">
            <h2>Welcome to Nepal Hike Hub</h2>
            <p>Your gateway to unforgettable adventures in the Himalayas</p>
        </div>
        <div class="welcome-content">
            <img src="${pageContext.request.contextPath}/image/prayer-flags-nepal.png" 
                 alt="Prayer Flags" 
                 class="welcome-image"
                 onerror="this.onerror=null; this.src='https://placehold.co/800x400/2F4A85/white?text=Nepal+Hike+Hub'">
            <p>Welcome to Nepal Hike Hub, your gateway to unforgettable adventures in the Himalayas. Explore breathtaking trails, conquer majestic peaks, and immerse yourself in Nepal's rich culture.</p>
            <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-hero" style="background: #2F4A85; color: white;">Explore More →</a>
        </div>
    </section>

    <!-- Best Selling Packages -->
    <section class="section">
        <div class="section-title">
            <h2>Our Best Selling Package</h2>
            <p>Discover the most popular trekking experiences in Nepal</p>
        </div>
        <div class="packages-grid">
            <!-- Everest Base Camp -->
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/image/Everest-base-Camp-trek.png" 
                         alt="Everest Base Camp"
                         onerror="this.onerror=null; this.src='https://placehold.co/400x250/2F4A85/white?text=Everest+Base+Camp'">
                    <div class="package-badge">Best Seller</div>
                </div>
                <div class="package-content">
                    <h3>Everest Base Camp Trek</h3>
                    <p>The legendary trek to the base of the world's highest mountain.</p>
                    <div class="package-price">$1,200 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=1" class="btn-book">Book Now →</a>
                </div>
            </div>
            <!-- Annapurna Circuit -->
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/image/annapurna.png" 
                         alt="Annapurna Circuit"
                         onerror="this.onerror=null; this.src='https://placehold.co/400x250/5A7FBA/white?text=Annapurna+Circuit'">
                </div>
                <div class="package-content">
                    <h3>Annapurna Circuit Trek</h3>
                    <p>Diverse landscapes from lush forests to high-altitude desert.</p>
                    <div class="package-price">$900 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=2" class="btn-book">Book Now →</a>
                </div>
            </div>
            <!-- Langtang Valley -->
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/image/langtang.png" 
                         alt="Langtang Valley"
                         onerror="this.onerror=null; this.src='https://placehold.co/400x250/2F4A85/white?text=Langtang+Valley'">
                </div>
                <div class="package-content">
                    <h3>Langtang Valley Trek</h3>
                    <p>The "Valley of Glaciers" - pristine Himalayan landscapes.</p>
                    <div class="package-price">$650 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=3" class="btn-book">Book Now →</a>
                </div>
            </div>
        </div>
        <div class="view-all">
            <a href="${pageContext.request.contextPath}/views/trekking.jsp">View All Packages →</a>
        </div>
    </section>

    <!-- Peak Climbing in Nepal Section - FIXED IMAGES -->
    <section class="section" style="background: #E1F0F4;">
        <div class="section-title">
            <h2>Peak Climbing in Nepal</h2>
            <p>Challenge yourself with these majestic peaks</p>
        </div>
        <div class="packages-grid">
            <!-- Mera Peak -->
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/image/mera%20peak.png" 
                         alt="Mera Peak"
                         onerror="this.onerror=null; this.src='https://placehold.co/400x250/5A7FBA/white?text=Mera+Peak'">
                </div>
                <div class="package-content">
                    <h3>Mera Peak Adventure</h3>
                    <p>At 6,476m, the highest trekking peak in Nepal.</p>
                    <div class="package-meta" style="display: flex; justify-content: space-between; margin: 0.5rem 0;">
                        <span><i class="fas fa-map-marker-alt"></i> Everest Region</span>
                        <span><i class="fas fa-calendar"></i> 14 Days</span>
                        <span><i class="fas fa-chart-line"></i> Hard</span>
                    </div>
                    <div class="package-price">$1,800 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=4" class="btn-book">Book Now →</a>
                </div>
            </div>
            <!-- Island Peak -->
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/image/island%20peak.png" 
                         alt="Island Peak"
                         onerror="this.onerror=null; this.src='https://placehold.co/400x250/2F4A85/white?text=Island+Peak'">
                </div>
                <div class="package-content">
                    <h3>Island Peak Climbing</h3>
                    <p>Popular climbing peak at 6,189m with spectacular views.</p>
                    <div class="package-meta" style="display: flex; justify-content: space-between; margin: 0.5rem 0;">
                        <span><i class="fas fa-map-marker-alt"></i> Everest Region</span>
                        <span><i class="fas fa-calendar"></i> 18 Days</span>
                        <span><i class="fas fa-chart-line"></i> Hard</span>
                    </div>
                    <div class="package-price">$1,600 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp?trekId=5" class="btn-book">Book Now →</a>
                </div>
            </div>
            
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="stats-grid">
            <div class="stat-item"><h3>50+</h3><p>Trekking Routes</p></div>
            <div class="stat-item"><h3>5000+</h3><p>Happy Trekkers</p></div>
            <div class="stat-item"><h3>15+</h3><p>Years Experience</p></div>
            <div class="stat-item"><h3>24/7</h3><p>Customer Support</p></div>
        </div>
    </section>
</main>

<jsp:include page="/views/includes/footer.jsp" />
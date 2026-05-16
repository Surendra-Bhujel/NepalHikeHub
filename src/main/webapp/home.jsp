<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="views/includes/header.jsp" %>
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
                <p>Explore through Nepal's Himalayas, where every step reveals breathtaking views, rich culture, and unforgettable adventures.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-bus"></i></div>
                <h3>Touring</h3>
                <p>Explore Nepal and experience vibrant culture, ancient temples, scenic landscapes, and warm hospitality.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon"><i class="fas fa-mountain"></i></div>
                <h3>Peak Climbing</h3>
                <p>Climb Nepal's majestic peaks, challenge your limits, and witness breathtaking Himalayan views.</p>
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
            <p>Welcome to Nepal Hike Hub, your gateway to unforgettable adventures in the Himalayas. Explore breathtaking trails, conquer majestic peaks, and immerse yourself in Nepal's rich culture and serene landscapes. Whether you seek thrilling treks or peaceful mountain escapes, we guide every step of your journey for memories that last a lifetime.</p>
            <a href="${pageContext.request.contextPath}/views/trekking.jsp" class="btn-hero" style="background: var(--primary-dark); color: white;">Explore More →</a>
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
                    <img src="${pageContext.request.contextPath}/images/Everest-base-Camp-trek.jpeg" alt="Everest Base Camp">
                    <div class="package-badge">Best Seller</div>
                </div>
                <div class="package-content">
                    <h3 class="package-title">Everest Base Camp Trek</h3>
                    <div class="package-meta">
                        <span><i class="fas fa-map-marker-alt"></i> Everest Region</span>
                        <span><i class="fas fa-calendar"></i> 14 Days</span>
                    </div>
                    <div class="package-meta">
                        <span><i class="fas fa-chart-line"></i> Hard</span>
                        <span><i class="fas fa-users"></i> Max 15</span>
                    </div>
                    <p class="package-desc">The legendary trek to the base of the world's highest mountain, offering breathtaking views and Sherpa culture.</p>
                    <div class="package-price">$1,200 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">View Detail →</a>
                </div>
            </div>
            <!-- Annapurna Circuit -->
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/images/annapurna.webp" alt="Annapurna Circuit">
                </div>
                <div class="package-content">
                    <h3 class="package-title">Annapurna Circuit Trek</h3>
                    <div class="package-meta">
                        <span><i class="fas fa-map-marker-alt"></i> Annapurna Region</span>
                        <span><i class="fas fa-calendar"></i> 12 Days</span>
                    </div>
                    <div class="package-meta">
                        <span><i class="fas fa-chart-line"></i> Moderate</span>
                        <span><i class="fas fa-users"></i> Max 20</span>
                    </div>
                    <p class="package-desc">Diverse landscapes from lush forests to high-altitude desert crossing Thorong La pass.</p>
                    <div class="package-price">$850 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">View Detail →</a>
                </div>
            </div>
            <!-- Langtang Valley -->
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/images/langtang.webp" alt="Langtang Valley">
                </div>
                <div class="package-content">
                    <h3 class="package-title">Langtang Valley Trek</h3>
                    <div class="package-meta">
                        <span><i class="fas fa-map-marker-alt"></i> Langtang Region</span>
                        <span><i class="fas fa-calendar"></i> 7 Days</span>
                    </div>
                    <div class="package-meta">
                        <span><i class="fas fa-chart-line"></i> Moderate</span>
                        <span><i class="fas fa-users"></i> Max 18</span>
                    </div>
                    <p class="package-desc">The "Valley of Glaciers" trek - pristine Himalayan landscapes and Tamang culture.</p>
                    <div class="package-price">$550 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">View Detail →</a>
                </div>
            </div>
        </div>
        <div class="view-all">
            <a href="${pageContext.request.contextPath}/views/trekking.jsp">View All Packages →</a>
        </div>
    </section>

    <!-- Peak Climbing Section -->
    <section class="section" style="background: var(--light);">
        <div class="section-title">
            <h2>Peak Climbing in Nepal</h2>
            <p>Challenge yourself with these majestic peaks</p>
        </div>
        <div class="packages-grid">
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/images/mera%20peak.jpg" alt="Mera Peak">
                </div>
                <div class="package-content">
                    <h3 class="package-title">Mera Peak Adventure</h3>
                    <div class="package-meta">
                        <span><i class="fas fa-map-marker-alt"></i> Everest Region</span>
                        <span><i class="fas fa-calendar"></i> 14 Days</span>
                    </div>
                    <div class="package-price">$1,800 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">View Detail →</a>
                </div>
            </div>
            <div class="package-card">
                <div class="package-image">
                    <img src="${pageContext.request.contextPath}/images/island%20peak.webp" alt="Island Peak">
                </div>
                <div class="package-content">
                    <h3 class="package-title">Island Peak Climbing</h3>
                    <div class="package-meta">
                        <span><i class="fas fa-map-marker-alt"></i> Everest Region</span>
                        <span><i class="fas fa-calendar"></i> 18 Days</span>
                    </div>
                    <div class="package-price">$1,600 <span>per person</span></div>
                    <a href="${pageContext.request.contextPath}/views/booking.jsp" class="btn-book">View Detail →</a>
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

<%@ include file="views/includes/footer.jsp" %>
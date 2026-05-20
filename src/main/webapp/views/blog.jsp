<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Pagination variables
    int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int postsPerPage = 3;
    int totalPosts = 8; // Total blog posts (you can increase)
    int totalPages = (int) Math.ceil((double) totalPosts / postsPerPage);
    int start = (currentPage - 1) * postsPerPage;
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Blog</div>
            <h1>Explore Our Travel Blog</h1>
        </div>
    </div>

    <!-- Blog Posts - Horizontal Layout -->
    <div class="blog-list">
        <!-- Post 1 -->
        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/Everest-base-Camp-trek.png" alt="Everest Base Camp">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Ram Gurung</span>
                    <span><i class="fas fa-calendar"></i> April 15, 2025</span>
                    <span><i class="fas fa-eye"></i> 2.5k views</span>
                </div>
                <h3>Top 5 Base Camp Trekking in Nepal</h3>
                <p>Base camp trekking in Nepal is one of the most rewarding high-altitude experiences on Earth. Walking through ancient Sherpa villages, crossing glacial moraines, and standing at the foot of the world's highest peaks, all without a single piece of technical trekking gear, is what draws hundreds of thousands of visitors to the Himalayas every year.</p>            </div>
        </div>

        <!-- Post 2 -->
        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/annapurna.png" alt="Annapurna">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Ram Gurung</span>
                    <span><i class="fas fa-calendar"></i> March 10, 2025</span>
                    <span><i class="fas fa-eye"></i> 1.8k views</span>
                </div>
                <h3>Trekking in Nepal - Complete Guide</h3>
                <p>Trekking in Nepal is often considered the pinnacle of adventure travel, and it's easy to see why. Nepal is home to the highest mountain on Earth - Mount Everest, along with world-renowned trekking routes like the Everest Base Camp Trek and the Annapurna Base Camp Trek.</p>
            </div>
        </div>

        <!-- Post 3 -->
        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/langtang.png" alt="Langtang">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Ram Gurung</span>
                    <span><i class="fas fa-calendar"></i> February 20, 2025</span>
                    <span><i class="fas fa-eye"></i> 1.2k views</span>
                </div>
                <h3>Langtang Trek during Winter</h3>
                <p>The Langtang Trek is often called the "Valley of Glaciers" trek — a relatively short journey from Kathmandu that immerses you in pristine Himalayan landscapes, Tamang culture, and jaw-dropping mountain views.</p>            </div>
        </div>

        <!-- Post 4 -->
        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/prayer-flags-nepal.png" alt="Prayer Flags">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Sita Rai</span>
                    <span><i class="fas fa-calendar"></i> January 5, 2025</span>
                    <span><i class="fas fa-eye"></i> 3.1k views</span>
                </div>
                <h3>Nepali Culture and Traditions on the Trail</h3>
                <p>Experience the rich culture of Nepal as you trek through ancient villages, interact with locals, and participate in traditional festivals along the Himalayan trails.</p>
            </div>
        </div>

        <!-- Post 5 -->
        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/mera%20peak.png" alt="Mera Peak">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Tenji Sherpa</span>
                    <span><i class="fas fa-calendar"></i> December 15, 2024</span>
                    <span><i class="fas fa-eye"></i> 980 views</span>
                </div>
                <h3>Mera Peak - The Highest Trekking Peak in Nepal</h3>
                <p>At 6,476 meters, Mera Peak is the highest trekking peak in Nepal. This blog covers everything you need to know about climbing Mera Peak, including permits, best seasons, and preparation tips.</p>
            </div>
        </div>

        <!-- Post 6 -->
        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/island%20peak.png" alt="Island Peak">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Pasang Lama</span>
                    <span><i class="fas fa-calendar"></i> November 28, 2024</span>
                    <span><i class="fas fa-eye"></i> 750 views</span>
                </div>
                <h3>Island Peak Climbing - A Complete Guide</h3>
                <p>Island Peak (Imja Tse) at 6,189m is one of the most popular climbing peaks in the Everest region. Learn about the challenges, rewards, and preparation needed for this adventure.</p>
            </div>
        </div>
    </div>

    
</main>

<jsp:include page="/views/includes/footer.jsp" />
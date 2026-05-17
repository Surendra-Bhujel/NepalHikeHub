<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Blog</div>
            <h1>Explore Our Travel Blog</h1>
        </div>
    </div>

    <!-- Horizontal Blog Layout -->
    <div class="blog-list">
        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/Everest-base-Camp-trek.png" alt="Everest Base Camp">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Ram Gurung</span>
                    <span><i class="fas fa-calendar"></i> April 15, 2025</span>
                </div>
                <h3>Top 5 Base Camp Trekking in Nepal</h3>
                <p>Base camp trekking in Nepal is one of the most rewarding high-altitude experiences on Earth. Walking through ancient Sherpa villages, crossing glacial moraines, and standing at the foot of the world's highest peaks...</p>
                <a href="#" class="btn-read">Continue Reading →</a>
            </div>
        </div>

        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/annapurna.png" alt="Annapurna">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Ram Gurung</span>
                    <span><i class="fas fa-calendar"></i> March 10, 2025</span>
                </div>
                <h3>Trekking in Nepal - Complete Guide</h3>
                <p>Trekking in Nepal is often considered the pinnacle of adventure travel, and it's easy to see why. Nepal is home to the highest mountain on Earth - Mount Everest, along with world-renowned trekking routes...</p>
                <a href="#" class="btn-read">Continue Reading →</a>
            </div>
        </div>

        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/langtang.png" alt="Langtang">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Ram Gurung</span>
                    <span><i class="fas fa-calendar"></i> February 20, 2025</span>
                </div>
                <h3>Langtang Trek during Winter</h3>
                <p>The Langtang Trek is often called the "Valley of Glaciers" trek — a relatively short journey from Kathmandu that immerses you in pristine Himalayan landscapes, Tamang culture, and jaw-dropping mountain views...</p>
                <a href="#" class="btn-read">Continue Reading →</a>
            </div>
        </div>

        <div class="blog-item">
            <div class="blog-image">
                <img src="${pageContext.request.contextPath}/image/prayer-flags.png" alt="Prayer Flags">
            </div>
            <div class="blog-content-horizontal">
                <div class="blog-meta">
                    <span><i class="fas fa-user"></i> Sita Rai</span>
                    <span><i class="fas fa-calendar"></i> January 5, 2025</span>
                </div>
                <h3>Nepali Culture and Traditions on the Trail</h3>
                <p>Experience the rich culture of Nepal as you trek through ancient villages, interact with locals, and participate in traditional festivals along the Himalayan trails...</p>
                <a href="#" class="btn-read">Continue Reading →</a>
            </div>
        </div>
    </div>

    <div class="pagination">
        <a href="#">Prev</a><a href="#" class="active">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">Next</a>
    </div>
</main>

<jsp:include page="/views/includes/footer.jsp" />
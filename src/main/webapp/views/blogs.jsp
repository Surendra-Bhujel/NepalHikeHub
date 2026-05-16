<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css">

<main>
    <div class="page-header">
        <div class="container"><div class="breadcrumb">Home > Blog</div><h1>Explore Our Travel Blog</h1></div>
    </div>
    
    <div class="blog-grid">
        <div class="blog-card">
            <div class="blog-image"><img src="${pageContext.request.contextPath}/images/Everest-base-Camp-trek.jpeg" alt="Everest"></div>
            <div class="blog-content">
                <div class="blog-meta"><span><i class="fas fa-user"></i> Ram Gurung</span><span><i class="fas fa-calendar"></i> April 15, 2025</span></div>
                <h3 class="blog-title">Top 5 Base Camp Trekking in Nepal</h3>
                <p class="blog-excerpt">Base camp trekking in Nepal is one of the most rewarding high-altitude experiences on Earth. Walking through ancient Sherpa villages...</p>
                <a href="#" class="btn-read">Continue Reading →</a>
            </div>
        </div>
        <div class="blog-card">
            <div class="blog-image"><img src="${pageContext.request.contextPath}/images/annapurna.webp" alt="Annapurna"></div>
            <div class="blog-content">
                <div class="blog-meta"><span><i class="fas fa-user"></i> Ram Gurung</span><span><i class="fas fa-calendar"></i> March 10, 2025</span></div>
                <h3 class="blog-title">Trekking in Nepal - Complete Guide</h3>
                <p class="blog-excerpt">Trekking in Nepal is often considered the pinnacle of adventure travel, and it's easy to see why. Nepal is home to the highest mountain...</p>
                <a href="#" class="btn-read">Continue Reading →</a>
            </div>
        </div>
        <div class="blog-card">
            <div class="blog-image"><img src="${pageContext.request.contextPath}/images/langtang.webp" alt="Langtang"></div>
            <div class="blog-content">
                <div class="blog-meta"><span><i class="fas fa-user"></i> Ram Gurung</span><span><i class="fas fa-calendar"></i> February 20, 2025</span></div>
                <h3 class="blog-title">Langtang Trek during Winter</h3>
                <p class="blog-excerpt">The Langtang Trek is often called the "Valley of Glaciers" trek — a relatively short journey from Kathmandu that immerses you in pristine Himalayan landscapes...</p>
                <a href="#" class="btn-read">Continue Reading →</a>
            </div>
        </div>
    </div>
    
    <div class="pagination">
        <a href="#">Prev</a><a href="#" class="active">1</a><a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a><a href="#">...</a><a href="#">23</a><a href="#">Next</a>
    </div>
</main>

<%@ include file="includes/footer.jsp" %>
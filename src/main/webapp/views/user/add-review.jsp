<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.nepalhikehub.model.User, com.nepalhikehub.dao.TrekDAO, com.nepalhikehub.model.Trek" %>
<%
    User currentUser = (User) session.getAttribute("user");
    if (currentUser == null) {
        response.sendRedirect(request.getContextPath() + "/views/auth/signin.jsp");
        return;
    }
    
    int bookingId = Integer.parseInt(request.getParameter("bookingId"));
    int trekId = Integer.parseInt(request.getParameter("trekId"));
    TrekDAO trekDAO = new TrekDAO();
    Trek trek = trekDAO.getTrekById(trekId);
%>
<jsp:include page="/views/includes/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">

<main>
    <div class="page-header">
        <div class="container">
            <div class="breadcrumb">Home > Write Review</div>
            <h1>Write a Review</h1>
        </div>
    </div>
    
    <div class="review-container">
        <div class="review-card">
            <h3><%= trek.getTrekName() %></h3>
            <p>Share your experience with this trek</p>
            
            <form action="${pageContext.request.contextPath}/user/submit-review" method="post">
                <input type="hidden" name="bookingId" value="<%= bookingId %>">
                <input type="hidden" name="trekId" value="<%= trekId %>">
                
                <div class="form-group">
                    <label>Rating (1-5 stars)</label>
                    <div class="star-rating">
                        <input type="radio" name="rating" value="5" id="star5"><label for="star5">★</label>
                        <input type="radio" name="rating" value="4" id="star4"><label for="star4">★</label>
                        <input type="radio" name="rating" value="3" id="star3"><label for="star3">★</label>
                        <input type="radio" name="rating" value="2" id="star2"><label for="star2">★</label>
                        <input type="radio" name="rating" value="1" id="star1"><label for="star1">★</label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Your Review</label>
                    <textarea name="comment" rows="5" placeholder="Tell us about your experience..." required></textarea>
                </div>
                
                <button type="submit" class="btn-submit">Submit Review</button>
            </form>
        </div>
    </div>
</main>

<style>
.review-container { max-width: 600px; margin: 0 auto; padding: 2rem 5% 4rem; }
.review-card { background: white; padding: 2rem; border-radius: 16px; box-shadow: 0 5px 20px rgba(0,0,0,0.1); }
.star-rating { display: flex; flex-direction: row-reverse; justify-content: flex-end; gap: 5px; }
.star-rating input { display: none; }
.star-rating label { font-size: 2rem; color: #ddd; cursor: pointer; transition: color 0.2s; }
.star-rating input:checked ~ label,
.star-rating label:hover,
.star-rating label:hover ~ label { color: #ffc107; }
</style>

<jsp:include page="/views/includes/footer.jsp" />
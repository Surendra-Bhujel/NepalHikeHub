<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/contact.css">

<main>
    <div class="page-header">
        <div class="container"><div class="breadcrumb">Home > Contact Us</div><h1>Get In Touch</h1></div>
    </div>
    
    <div class="contact-grid">
        <div class="contact-info">
            <h3><i class="fas fa-map-marker-alt"></i> Our Office</h3>
            <div class="contact-info-item"><i class="fas fa-location-dot"></i><div><strong>Address</strong><br>Pokhara, Nepal</div></div>
            <div class="contact-info-item"><i class="fas fa-phone"></i><div><strong>Phone</strong><br>+977 9802543291</div></div>
            <div class="contact-info-item"><i class="fas fa-envelope"></i><div><strong>Email</strong><br>info@nepalhikehub.com</div></div>
            <div class="contact-info-item"><i class="fas fa-clock"></i><div><strong>Business Hours</strong><br>Mon-Sun: 9:00 AM - 6:00 PM (NPT)</div></div>
        </div>
        <div class="contact-form">
            <h3>Send Us a Message</h3>
            <form action="#" method="post">
                <div class="form-group"><label>Your Name *</label><input type="text" name="name" placeholder="Enter your full name" required></div>
                <div class="form-group"><label>Your Email *</label><input type="email" name="email" placeholder="Enter your email" required></div>
                <div class="form-group"><label>Phone Number</label><input type="tel" name="phone" placeholder="Enter your phone number"></div>
                <div class="form-group"><label>Message *</label><textarea name="message" rows="5" placeholder="Your message here..." required></textarea></div>
                <button type="submit" class="btn-submit">Send Message <i class="fas fa-paper-plane"></i></button>
            </form>
        </div>
    </div>
</main>

<%@ include file="includes/footer.jsp" %>
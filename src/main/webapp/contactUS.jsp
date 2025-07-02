<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Auction System</title>
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/contact.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<!-- HEADER SECTION -->
<div class="header">
    <img src="image/logo.png" alt="Logo" class="logo">
    <h1>CEYBID</h1>
    <h1>ONLINE BIDING SYSTEM</h1>
    <p>A complete solution for managing online auctions, selling products and bids</p>
    <div class="nav">
        <ul class="nav-links">
            <li><a href="#">HOME</a></li>
            <li><a href="#">ABOUT US</a></li>
            <li><a href="#">SELLERS</a></li>
            <li><a href="#">ALL PRODUCTS</a></li>
            <li><a href="#">REGISTER</a></li>
            <li><a href="#">LOGIN</a></li>
            <li><a href="#">CONTACT US</a></li>
        </ul>
        <div class="search-container">
            <input type="text" placeholder="Search products..." class="search-bar">
            <button class="search-button">Search</button>
        </div>
    </div>
</div>

<!-- CONTACT INFO SECTION -->
<div class="contact-info-section">
    <h2>GET IN TOUCH</h2>
    <div class="info-columns">
        <div class="info-box">
            <i class="fas fa-map-marker-alt"></i>
            <h3>ADDRESS</h3>
            <p>CEYBID Headquarters<br>123 Auction Road<br>Colombo, Sri Lanka</p>
        </div>
        <div class="info-box">
            <i class="fas fa-phone-alt"></i>
            <h3>PHONE</h3>
            <p>+94 77 123 4567<br>+94 11 234 5678</p>
        </div>
        <div class="info-box">
            <i class="fas fa-envelope"></i>
            <h3>EMAIL</h3>
            <p>support@ceybid.lk<br>sales@ceybid.lk</p>
        </div>
    </div>
</div>

<!-- MESSAGE US FORM -->
<div class="message-form-section">
    <h2>Message Us</h2>
    <form action="contactServlet" method="post">
        <input type="text" name="name" placeholder="Your Name" required />
        <input type="email" name="email" placeholder="Your Email" required />
        <input type="text" name="subject" placeholder="Subject" required />
        <textarea name="message" placeholder="Write your message..." required></textarea>
        <button type="submit">Send Message</button>
    </form>
</div>

	<footer>
        <div class="footer-content">
            <p>&copy; 2025 CEYBID. All rights reserved.</p>
            <ul>
                <li><a href="#">Privacy Policy</a></li>
                <li><a href="#">Terms of Service</a></li>
                <li><a href="#">Help</a></li>
            </ul>
        </div>
    </footer>

</body>
</html>

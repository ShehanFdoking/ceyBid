<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Online Auction System</title>
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/home.css"> <!-- Additional CSS for homepage -->
</head>
<body>
    <div class="header">
        <img src="image/logo.png" alt="Logo" class="logo">
        <h1>CEYBID</h1>
        <h1>ONLINE BIDDING SYSTEM</h1>
        <p>A complete solution for managing online auctions, selling products and bids</p>

        <div class="nav">
            <ul class="nav-links">
                <li><a href="#">HOME</a></li>
                <li><a href="#">ABOUT US</a></li>
                <li><a href="#">SELLERS</a></li>
                <li><a href="#">ALL PRODUCTS</a></li>
                <li class="dropdown">
                <a href="#">REGISTER</a>
                <div class="dropdown-content">
                    <a href="buyer_register.jsp">Buyer</a>
                    <a href="seller_register.jsp">Seller</a>
                </div>
            </li>
                <li><a href="http://localhost:8090/ceyBid/login.jsp">LOGIN</a></li>
                <li><a href="#">CONTACT US</a></li>
            </ul>
            <div class="search-container">
                <input type="text" placeholder="Search products..." class="search-bar">
                <button class="search-button">Search</button>
            </div>
        </div>
    </div>

    <!-- Home Page Content -->
    <div class="home-content">
        <section class="featured-products">
            <h2>Featured Products</h2>
            <div class="product-list">
                <!-- Product 1 -->
                <div class="product">
                    <img src="image/product1.jpg" alt="Product 1">
                    <h3>Product Name 1</h3>
                    <p>Description of the product goes here.</p>
                    <a href="#">View Details</a>
                </div>
                <!-- Product 2 -->
                <div class="product">
                    <img src="image/product2.jpg" alt="Product 2">
                    <h3>Product Name 2</h3>
                    <p>Description of the product goes here.</p>
                    <a href="#">View Details</a>
                </div>
                <!-- Product 3 -->
                <div class="product">
                    <img src="image/product3.jpg" alt="Product 3">
                    <h3>Product Name 3</h3>
                    <p>Description of the product goes here.</p>
                    <a href="#">View Details</a>
                </div>
            </div>
        </section>

        <section class="categories">
            <h2>Browse Categories</h2>
            <div class="category-list">
                <div class="category">
                    <img src="image/category1.jpg" alt="Category 1">
                    <h3>Category 1</h3>
                    <a href="#">View Products</a>
                </div>
                <div class="category">
                    <img src="image/category2.jpg" alt="Category 2">
                    <h3>Category 2</h3>
                    <a href="#">View Products</a>
                </div>
                <div class="category">
                    <img src="image/category3.jpg" alt="Category 3">
                    <h3>Category 3</h3>
                    <a href="#">View Products</a>
                </div>
            </div>
        </section>
    </div>

    <!-- Footer -->
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

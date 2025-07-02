<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - CEYBID</title>
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/adminDashboard.css">
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

<!-- DASHBOARD CONTENT -->
<div class="dashboard-container">

    <!-- SELLER MANAGEMENT -->
    <div class="section">
        <h2>Seller Management</h2>
        <ul>
            <li>Approve or reject new seller applications</li>
            <li>Deactivate or ban sellers</li>
            <li>View seller activity</li>
        </ul>
        <div class="action-buttons">
            <a href="http://localhost:8090/ceyBid/displaySellerDetail.jsp">View Sellers</a>
        </div>
    </div>

    <!-- CATEGORY MANAGEMENT -->
    <div class="section">
        <h2>Category Management</h2>
        <ul>
            <li>Create new product categories</li>
            <li>Edit or delete existing categories</li>
            <li>Assign products to categories</li>
        </ul>
        <div class="action-buttons">
            <a href="http://localhost:8090/ceyBid/categoryinsert.jsp">Add Category</a>
            <a href="http://localhost:8090/ceyBid/CategoryInsert">Manage Categories</a>
        </div>
    </div>

</div>

</body>
</html>
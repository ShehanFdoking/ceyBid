<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Seller Dashboard - CEYBID</title>
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/sellerDashboard.css">
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

    <!-- MANAGE ITEMS -->
    <div class="section">
        <h2>Manage Items</h2>
        <ul>
            <li>Add new products to auction</li>
            <li>Edit or update product information</li>
            <li>Remove products from listing</li>
            <li>View bidding activity on listed items</li>
        </ul>
        <div class="action-buttons">
            <a href="http://localhost:8090/ceyBid/addItem.jsp">Add New Item</a>
            <a href="http://localhost:8090/ceyBid/viewItemsSeller.jsp">View My Items</a>
           
        </div>
    </div>

</div>

</body>
</html>
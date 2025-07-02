<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("seller_id") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Item - CEYBID</title>
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/addItem.css">
</head>
<body>

<!-- HEADER SECTION -->
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

<!-- FORM CARD SECTION -->
<div class="main-container">
    <div class="form-card">
        <h2>Add New Auction Item</h2>
        <form action="AddItemServlet" method="post">
            <div class="form-group">
                <label for="item_name">Item Name:</label>
                <input type="text" id="item_name" name="item_name" required>
            </div>

            <div class="form-group">
                <label for="starting_price">Starting Price:</label>
                <input type="number" step="0.01" id="starting_price" name="starting_price" required>
            </div>

            <div class="form-group">
                <label for="category_id">Category ID:</label>
                <input type="number" id="category_id" name="category_id" required>
            </div>

            <%
                Integer sellerId = (Integer) session.getAttribute("seller_id");
            %>
            <input type="hidden" name="seller_id" value="<%= sellerId %>">

            <div class="form-group">
                <label for="ending_date">Auction End Date:</label>
                <input type="date" id="ending_date" name="ending_date" required>
            </div>

            <div class="form-group">
                <label for="image_path">Image Path (URL or relative path):</label>
                <input type="text" id="image_path" name="image_path">
            </div>

            <div class="form-group">
                <input type="submit" value="Add Item" class="submit-btn">
            </div>
        </form>

        <% if (request.getParameter("error") != null) { %>
            <p class="error-msg"><%= request.getParameter("error") %></p>
        <% } %>
    </div>
</div>

</body>
</html>

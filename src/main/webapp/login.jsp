<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login - CeyBid</title>
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/login.css">
</head>
<body>

    <!-- Include header -->
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

    <!-- Login Form -->
    <div class="login-container">
        <h2>Login to CeyBid</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="userType">Login as:</label>
                <select id="userType" name="userType" required>
                    <option value="seller">Seller</option>
                    <option value="buyer">Buyer</option>
                    <option value="admin">Admin</option>
                </select>
            </div>

            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <button type="submit">Login</button>

            <c:if test="${not empty loginError}">
                <div class="error-message">${loginError}</div>
            </c:if>
        </form>
    </div>

</body>
</html>

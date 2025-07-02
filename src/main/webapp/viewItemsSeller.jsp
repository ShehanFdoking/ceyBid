<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, seller.ItemModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Items - CeyBid</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f4f4f4; }
        .header { text-align: center; background-color: #333; color: white; padding: 10px; }
        .header img.logo { height: 50px; }
        .header h1 { margin: 5px; }
        .nav { display: flex; justify-content: center; background-color: #444; padding: 10px; }
        .nav ul { list-style: none; padding: 0; display: flex; }
        .nav ul li { margin: 0 15px; }
        .nav ul li a { color: white; text-decoration: none; }
        .nav ul li a:hover { text-decoration: underline; }
        .search-container { margin-left: 20px; }
        .search-bar { padding: 5px; }
        .search-button { padding: 5px 10px; }
        .container { max-width: 1200px; margin: 20px auto; }
        h2 { text-align: center; color: #333; }
        .item-table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        .item-table th, .item-table td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        .item-table th { background-color: #444; color: white; }
        .item-table tr:nth-child(even) { background-color: #f9f9f9; }
        .item-table img { max-width: 100px; max-height: 100px; object-fit: cover; }
        .action-form { display: inline; }
        .update-button, .delete-button { padding: 5px 10px; margin: 2px; cursor: pointer; }
        .update-button { background-color: #4CAF50; color: white; border: none; }
        .delete-button { background-color: #f44336; color: white; border: none; }
        .no-items { text-align: center; color: #555; font-size: 18px; }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="image/logo.png" alt="Logo" class="logo">
        <h1>CEYBID</h1>
        <h1>ONLINE BIDDING SYSTEM</h1>
        <p>A complete solution for managing online auctions, selling products and bids</p>
        <div class="nav">
            <ul>
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

    <!-- Items Table -->
    <div class="container">
        <h2>Your Posted Items</h2>
        <c:choose>
            <c:when test="${empty items}">
                <p class="no-items">No items found for your account.</p>
            </c:when>
            <c:otherwise>
                <table class="item-table">
                    <tr>
                        <th>Item ID</th>
                        <th>Item Name</th>
                        <th>Starting Price</th>
                        <th>Current Bid</th>
                        <th>Category</th>
                        <th>Posted Date</th>
                        <th>End Date</th>
                        <th>Image</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach var="item" items="${items}">
                        <tr>
                            <td>${item.itemId}</td>
                            <td>${item.itemName}</td>
                            <td>Rs. ${item.startingPrice}</td>
                            <td>Rs. ${item.currentHighestBid}</td>
                            <td>${item.categoryId}</td>
                            <td>${item.postedDate}</td>
                            <td>${item.endingDate}</td>
                            <td>
                                <img src="${item.imagePath}" alt="Item Image" width="100" height="100">
                            </td>
                            <td>
                                <form action="GetItemServlet" method="get" class="action-form">
                                    <input type="hidden" name="item_id" value="${item.itemId}">
                                    <input type="submit" value="Update" class="update-button">
                                </form>
                                <form action="DeleteItemServlet" method="post" class="action-form" onsubmit="return confirm('Are you sure you want to delete this item?');">
                                    <input type="hidden" name="item_id" value="${item.itemId}">
                                    <input type="submit" value="Delete" class="delete-button">
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
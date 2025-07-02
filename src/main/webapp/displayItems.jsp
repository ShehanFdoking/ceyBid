<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Auction Items</title>
<style type="text/css">
    body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 20px;
    }
    h2 {
        color: #333;
        text-align: center;
        margin-bottom: 30px;
    }
    .items-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        gap: 20px;
        max-width: 1200px;
        margin: 0 auto;
    }
    .item-card {
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        width: 30%;
        min-width: 300px;
        padding: 20px;
        box-sizing: border-box;
        transition: transform 0.3s ease;
    }
    .item-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 12px rgba(0,0,0,0.15);
    }
    .item-name {
        font-size: 1.2em;
        font-weight: bold;
        color: #2c3e50;
        margin-bottom: 10px;
    }
    .item-price {
        margin: 8px 0;
        color: #7f8c8d;
    }
    .item-price span {
        color: #e74c3c;
        font-weight: bold;
    }
    .item-action {
        margin-top: 15px;
    }
    .item-action a {
        display: inline-block;
        background-color: #3498db;
        color: white;
        text-decoration: none;
        padding: 8px 15px;
        border-radius: 4px;
        transition: background-color 0.3s;
    }
    .item-action a:hover {
        background-color: #2980b9;
    }
    @media (max-width: 1000px) {
        .item-card {
            width: 45%;
        }
    }
    @media (max-width: 600px) {
        .item-card {
            width: 100%;
        }
    }
</style>
</head>
<body>

<h2>All Auction Items</h2>
<%@ page import="java.util.*,buyer.Item" %>
<%
    List<Item> items = (List<Item>) request.getAttribute("items");
%>

<div class="items-container">
    <% 
    if (items != null && !items.isEmpty()) {
        for (Item i : items) {
%>
    <div class="item-card">
        <div class="item-name"><%= i.getItemName() %></div>
        <div class="item-price">Starting Price: <span>$<%= i.getStartingPrice() %></span></div>
        <div class="item-price">Current Bid: <span>$<%= i.getCurrentPrice() %></span></div>
        <div class="item-action">
            <a href="ItemDetailsServlet?itemId=<%= i.getItemId() %>">View Details</a>
        </div>
    </div>
<%
        }
    } else {
%>
    <p style="text-align:center;">No auction items available.</p>
<%
    }
%>

</div>

</body>
</html>
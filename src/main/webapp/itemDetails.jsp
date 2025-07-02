<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="buyer.Item, java.text.NumberFormat, java.util.Locale, java.time.format.DateTimeFormatter" %>
<%
    Item item = (Item) request.getAttribute("item");
    if (item == null) {
        response.sendRedirect("error.jsp?message=Item+not+found");
        return;
    }
    
    NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(Locale.US);
    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("MMMM d, yyyy");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= item.getItemName() %> | Premium Auction House</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --light-gray: #f8f9fa;
            --medium-gray: #e9ecef;
            --dark-gray: #495057;
            --text-color: #212529;
            --success-color: #28a745;
        }
        
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            line-height: 1.6;
            color: var(--text-color);
            background-color: var(--light-gray);
            padding: 0;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        .back-link {
            display: inline-flex;
            align-items: center;
            color: var(--secondary-color);
            text-decoration: none;
            margin-bottom: 20px;
            font-weight: 500;
            transition: color 0.2s;
        }
        
        .back-link:hover {
            color: var(--primary-color);
            text-decoration: underline;
        }
        
        .back-link svg {
            margin-right: 5px;
        }
        
        .item-container {
            display: flex;
            flex-wrap: wrap;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            overflow: hidden;
        }
        
        .item-gallery {
            width: 50%;
            padding: 30px;
        }
        
        .main-image-container {
            position: relative;
            margin-bottom: 15px;
        }
        
        .main-image {
            width: 100%;
            height: auto;
            max-height: 500px;
            object-fit: contain;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
        }
        
        .thumbnail-container {
            display: flex;
            gap: 10px;
        }
        
        .thumbnail {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border: 1px solid var(--medium-gray);
            border-radius: 4px;
            cursor: pointer;
            transition: border-color 0.2s;
        }
        
        .thumbnail:hover {
            border-color: var(--secondary-color);
        }
        
        .item-details {
            width: 50%;
            padding: 30px;
            border-left: 1px solid var(--medium-gray);
        }
        
        .item-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--primary-color);
        }
        
        .item-condition {
            font-size: 14px;
            color: var(--dark-gray);
            margin-bottom: 20px;
        }
        
        .price-section {
            background-color: var(--light-gray);
            padding: 20px;
            border-radius: 6px;
            margin-bottom: 25px;
        }
        
        .current-price {
            font-size: 32px;
            font-weight: 700;
            color: var(--accent-color);
            margin-bottom: 5px;
        }
        
        .price-label {
            font-size: 14px;
            color: var(--dark-gray);
            margin-bottom: 5px;
        }
        
        .starting-price {
            font-size: 16px;
            color: var(--dark-gray);
        }
        
        .bid-section {
            border: 1px solid var(--medium-gray);
            border-radius: 6px;
            padding: 20px;
            margin-bottom: 25px;
        }
        
        .time-remaining {
            font-size: 16px;
            font-weight: 500;
            color: var(--accent-color);
            margin-bottom: 15px;
        }
        
        .bid-count {
            font-size: 14px;
            color: var(--dark-gray);
            margin-bottom: 20px;
        }
        
        .bid-button {
            display: inline-block;
            background-color: var(--secondary-color);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 4px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.2s;
            margin-bottom: 10px;
        }
        
        .bid-button:hover {
            background-color: #2878c9;
        }
        
        .bid-note {
            font-size: 13px;
            color: var(--dark-gray);
            margin-bottom: 15px;
        }
        
        .view-bids-link {
            display: inline-block;
            color: var(--secondary-color);
            text-decoration: none;
            font-size: 14px;
            transition: color 0.2s;
        }
        
        .view-bids-link:hover {
            text-decoration: underline;
        }
        
        .shipping-info {
            background-color: var(--light-gray);
            border-radius: 6px;
            padding: 20px;
        }
        
        .info-title {
            font-weight: 600;
            margin-bottom: 10px;
        }
        
        .info-detail {
            font-size: 14px;
            margin-bottom: 5px;
        }
        
        .item-description {
            margin-top: 30px;
            padding: 30px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        
        .section-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--medium-gray);
        }
        
        .description-text {
            line-height: 1.7;
        }
        
        @media (max-width: 768px) {
            .item-gallery, .item-details {
                width: 100%;
                border-left: none;
            }
            
            .item-details {
                border-top: 1px solid var(--medium-gray);
                padding-top: 30px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="DisplayItemsServlet" class="back-link">
            <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M19 12H5M12 19l-7-7 7-7"/>
            </svg>
            Back to All Items
        </a>
        
        <div class="item-container">
            <div class="item-gallery">
                <div class="main-image-container">
                    <img src="<%= item.getImagePath() %>" alt="<%= item.getItemName() %>" class="main-image">
                </div>
                <div class="thumbnail-container">
                    <img src="<%= item.getImagePath() %>" alt="Thumbnail" class="thumbnail">
                    <!-- Additional thumbnails would be dynamically inserted here -->
                </div>
            </div>
            
            <div class="item-details">
                <h1 class="item-title"><%= item.getItemName() %></h1>
                <div class="item-condition">Condition: Excellent</div>
                
                <div class="price-section">
                    <div class="price-label">Current Bid</div>
                    <div class="current-price"><%= currencyFormat.format(item.getCurrentPrice()) %></div>
                    <div class="starting-price">Starting price: <%= currencyFormat.format(item.getStartingPrice()) %></div>
                </div>
                
                <div class="bid-section">
                    <div class="time-remaining">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="vertical-align: middle;">
                            <circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline>
                        </svg>
                        Time remaining: 2 days 5 hours (Ends: May 14, 2025)
                    </div>
                    <div class="bid-count">15 bids</div>
                    
                    <a href="placeBid.jsp?itemId=<%= item.getItemId() %>" class="bid-button">
                        Place Bid
                    </a>
                    
                    <div class="bid-note">
                        Your bid must be at least <%= currencyFormat.format(item.getCurrentPrice() + 1) %>
                    </div>
                    
                    <a href="bids?itemId=<%= item.getItemId() %>" class="view-bids-link">
                        View My Bids
                    </a>
                </div>
                
                <div class="shipping-info">
                    <div class="info-title">Shipping & Delivery</div>
                    <div class="info-detail">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="vertical-align: middle;">
                            <rect x="1" y="3" width="15" height="13"></rect><polygon points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon><circle cx="5.5" cy="18.5" r="2.5"></circle><circle cx="18.5" cy="18.5" r="2.5"></circle>
                        </svg>
                        Standard Shipping: $5.99
                    </div>
                    <div class="info-detail">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" style="vertical-align: middle;">
                            <circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline>
                        </svg>
                        Estimated delivery: Thu, May 16 - Mon, May 20
                    </div>
                </div>
            </div>
        </div>
        
    </div>
</body>
</html>
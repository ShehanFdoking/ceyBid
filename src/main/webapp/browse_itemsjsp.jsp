<%@ page import="seller.ItemController, seller.ItemModel, java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get all items (you'll need to implement getAllItems() in ItemController)
    // For now, I'll show how to display items by seller as that's what's implemented
    int sellerId = 1; // You should get this from session or parameter
    List<ItemModel> items = ItemController.getItemsBySeller(sellerId);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Browse Items</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .header {
            text-align: center;
            margin-bottom: 30px;
        }
        .categories {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }
        .category-btn {
            padding: 8px 15px;
            margin: 5px;
            background-color: #4285f4;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .items-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }
        .item-card {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .item-card:hover {
            transform: translateY(-5px);
        }
        .item-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .item-info {
            padding: 15px;
        }
        .item-title {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .item-price {
            color: #e53935;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .item-bid {
            color: #666;
            margin-bottom: 10px;
        }
        .item-time {
            color: #666;
            font-size: 0.9em;
        }
        .bid-btn {
            display: block;
            width: 100%;
            padding: 8px;
            background-color: #34a853;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }
        .action-btns {
            display: flex;
            gap: 5px;
            margin-top: 10px;
        }
        .edit-btn, .delete-btn {
            flex: 1;
            padding: 6px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            font-size: 14px;
        }
        .edit-btn {
            background-color: #fbbc05;
            color: white;
        }
        .delete-btn {
            background-color: #ea4335;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>My Auction Items</h1>
            <a href="add_item.jsp" class="category-btn">Add New Item</a>
        </div>
        
        <div class="categories">
            <button class="category-btn" onclick="filterItems('all')">All Categories</button>
            <!-- Add more category buttons dynamically from database -->
        </div>
        
        <div class="items-grid">
            <% for (ItemModel item : items) { %>
                <div class="item-card">
                    <img src="<%= item.getImagePath() %>" alt="<%= item.getItemName() %>" class="item-image">
                    <div class="item-info">
                        <div class="item-title"><%= item.getItemName() %></div>
                        <div class="item-price">Starting Price: Rs. <%= item.getStartingPrice() %></div>
                        <div class="item-bid">Current Bid: Rs. <%= item.getCurrentHighestBid() %></div>
                        <div class="item-time">Ends: <%= item.getEndingDate() %></div>
                        <a href="place_bid.jsp?item_id=<%= item.getItemId() %>" class="bid-btn">View Bids</a>
                        <div class="action-btns">
                            <a href="edit_item.jsp?item_id=<%= item.getItemId() %>" class="edit-btn">Edit</a>
                            <a href="DeleteItemServlet?item_id=<%= item.getItemId() %>" class="delete-btn" 
                               onclick="return confirm('Are you sure you want to delete this item?')">Delete</a>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
    
    <script>
        function filterItems(categoryId) {
            // AJAX call to filter items by category
            // Implement this based on your needs
        }
    </script>
</body>
</html>
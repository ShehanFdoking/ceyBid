<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="buyer.Bid" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bid History | AuctionPro</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 30px;
            background: #f4f4f4;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            max-width: 900px;
            margin: auto;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .page-title {
            font-size: 26px;
            margin-bottom: 20px;
        }
        .bids-table {
            width: 100%;
            border-collapse: collapse;
        }
        .bids-table th, .bids-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .bids-table th {
            background-color: #007BFF;
            color: white;
        }
        .highlight-bid {
            background-color: #e7f3ff;
            font-weight: bold;
        }
        .btn {
            padding: 5px 12px;
            font-size: 13px;
            border-radius: 4px;
            text-decoration: none;
            color: white;
        }
        .btn-primary {
            background-color: #007BFF;
        }
        .btn-outline {
            background-color: transparent;
            border: 1px solid #007BFF;
            color: #007BFF;
        }
        .btn-outline:hover {
            background-color: #007BFF;
            color: white;
        }
        .bid-status {
            padding: 5px 10px;
            border-radius: 4px;
            font-weight: bold;
        }
        .status-winning {
            background-color: #28a745;
            color: white;
        }
        .status-outbid {
            background-color: #dc3545;
            color: white;
        }
        .bid-actions a {
            margin: 2px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="page-title">My Bids</h1>

        <div>
            <%
                List<buyer.Bid> bids = (List<Bid>) request.getAttribute("bids");
                int itemId = (int) request.getAttribute("itemId");
                if (bids != null && !bids.isEmpty()) {
                    NumberFormat nf = NumberFormat.getCurrencyInstance(Locale.US);
                    double highest = bids.stream().mapToDouble(Bid::getBidAmount).max().orElse(0);
            %>
            <table class="bids-table">
                <thead>
                    <tr>
                        <th>Bid ID</th>
                        <th>Buyer ID</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Bid b : bids) {
                            boolean isTop = b.getBidAmount() == highest;
                    %>
                    <tr class="<%= isTop ? "highlight-bid" : "" %>">
                        <td>#<%= b.getBidId() %></td>
                        <td>User#<%= b.getBuyerId() %></td>
                        <td><%= nf.format(b.getBidAmount()) %></td>
                        <td>
                            <span class="bid-status <%= isTop ? "status-winning" : "status-outbid" %>">
                                <%= isTop ? "Winning" : "Outbid" %>
                            </span>
                        </td>
                        <td class="bid-actions">
                            <a class="btn btn-outline" href="editBid.jsp?bidId=<%= b.getBidId() %>">Edit</a>
                            <a class="btn btn-outline" href="deleteBid.jsp?bidId=<%= b.getBidId() %>" onclick="return confirm('Delete this bid?');">Delete</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <%
                } else {
            %>
            <p>No bids found for this item.</p>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>

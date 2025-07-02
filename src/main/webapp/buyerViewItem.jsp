<%@ page import="java.util.Map, java.util.List, seller.ItemModel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Browse Items</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h2>Browse Items</h2>

    <c:forEach var="entry" items="${categoryMap}">
        <h3>${entry.key}</h3>
        <div class="item-grid">
            <c:forEach var="item" items="${entry.value}">
                <div class="item-card">
                    <img src="${item.picture}" alt="Item Image" width="150" height="150"/>
                    <p>Start Price: $${item.startingPrice}</p>
                    <p>Highest Bid: $${item.highestBid}</p>
                    <p>End Date: ${item.endDate}</p>
                    <a href="placeBidServlet?itemId=${item.id}">Place Bid</a>
                </div>
            </c:forEach>
        </div>
    </c:forEach>
</body>
</html>

<%@ page import="seller.ItemModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ItemModel item = (ItemModel) request.getAttribute("item");
    if (item == null) {
        out.println("<p>Item not found.</p>");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Item</title>
    <!-- <link rel="stylesheet" href="style.css"> <!-- optional: link to your external CSS -->
</head>
<body>

    <h2>Update Auction Item</h2>

    <form action="UpdateItemServlet" method="post">
        <input type="hidden" name="item_id" value="<%= item.getItemId() %>">

        <label for="item_name">Item Name:</label><br>
        <input type="text" id="item_name" name="item_name" value="<%= item.getItemName() %>" required><br><br>

        <label for="starting_price">Starting Price:</label><br>
        <input type="number" step="0.01" id="starting_price" name="starting_price" value="<%= item.getStartingPrice() %>" required><br><br>

        <label for="category_id">Category:</label><br>
        <input type="number" step="0" id="category_id" name="category_id" required><br><br>

        <label for="ending_date">Auction End Date:</label><br>
        <input type="date" id="ending_date" name="ending_date" value="<%= item.getEndingDate() %>" required><br><br>

        <label for="image_path">Image Path (URL or relative path):</label><br>
        <input type="text" id="image_path" name="image_path" value="<%= item.getImagePath() %>"><br><br>

        <input type="submit" value="Update Item">
    </form>

    <% if (request.getParameter("error") != null) { %>
        <p style="color:red;"><%= request.getParameter("error") %></p>
    <% } %>
    
    
    
    <%
	    String error = request.getParameter("error");
	    if (error != null) {
	%>
	    <script>
	        alert("<%= error %>");
	    </script>
	<%
	    }
	%>
    

</body>
</html>

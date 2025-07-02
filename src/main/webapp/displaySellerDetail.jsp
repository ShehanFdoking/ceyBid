<%@ page import="java.util.*, adminM.SellerModel, adminM.SellerController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Seller Management</title>
</head>
<body>
<h2>Seller Management</h2>
<table border="1" cellpadding="10">
    <tr>
        <th>ID</th><th>Name</th><th>Username</th><th>Email</th><th>NIC</th><th>Status</th><th>Actions</th>
    </tr>
    <%
        List<SellerModel> sellers = SellerController.getAllSellers();
        for (SellerModel s : sellers) {
    %>
    <tr>
        <td><%= s.getSellerId() %></td>
        <td><%= s.getSellerName() %></td>
        <td><%= s.getSellerUN() %></td>
        <td><%= s.getEmail() %></td>
        <td><%= s.getNic() %></td>
        <td><%= s.getStatus() %></td>
        <td>
            <% if ("pending".equals(s.getStatus())) { %>
                <form action="ApproveSellerServlet" method="post" style="display:inline;">
                    <input type="hidden" name="seller_id" value="<%= s.getSellerId() %>">
                    <input type="submit" value="Approve">
                </form>
            <% } %>
            <form action="GetSellerServlet" method="get" style="display:inline;">
                <input type="hidden" name="seller_id" value="<%= s.getSellerId() %>">
                <input type="submit" value="Edit">
            </form>
            <form action="DeleteSellerServlet" method="post" style="display:inline;" onsubmit="return confirm('Delete seller?');">
                <input type="hidden" name="seller_id" value="<%= s.getSellerId() %>">
                <input type="submit" value="Delete">
            </form>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>

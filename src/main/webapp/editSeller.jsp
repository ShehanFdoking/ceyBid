<%@ page import="adminM.SellerModel" %>
<%
    SellerModel seller = (SellerModel) request.getAttribute("seller");
%>
<html>
<head><title>Edit Seller</title></head>
<body>
<h2>Edit Seller</h2>
<form action="EditSellerServlet" method="post">
    <input type="hidden" name="seller_id" value="<%= seller.getSellerId() %>">
    Name: <input type="text" name="seller_name" value="<%= seller.getSellerName() %>"><br>
    Username: <input type="text" name="seller_un" value="<%= seller.getSellerUN() %>"><br>
    Password: <input type="text" name="seller_pw" value="<%= seller.getSellerPW() %>"><br>
    Email: <input type="email" name="email" value="<%= seller.getEmail() %>"><br>
    NIC: <input type="text" name="nic" value="<%= seller.getNic() %>"><br>
    <input type="submit" value="Update Seller">
</form>
</body>
</html>

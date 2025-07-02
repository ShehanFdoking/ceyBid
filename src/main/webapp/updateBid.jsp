<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="UpdateBidServlet" method="post">
    Buyer ID: <input type="text" name="buyerId"><br>
    Item ID: <input type="text" name="itemId"><br>
    New Bid Amount: <input type="text" name="newAmount"><br>
    <input type="submit" value="Update Bid">
</form>


</body>
</html>
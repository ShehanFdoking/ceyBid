<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Seller Registration - CeyBid</title>
    <link rel="stylesheet" href="styles/Sregister.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <div class="register-container">
        <h2>Register as Seller</h2>
        <form action="registerSeller" method="post">
            <div class="form-group">
                <label for="name">Full Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="nic">NIC:</label>
                <input type="text" id="nic" name="nic" required>
            </div>

            <button type="submit">Register</button>

            <c:if test="${not empty registerError}">
                <div class="error-message">${registerError}</div>
            </c:if>

            <c:if test="${not empty registerSuccess}">
                <div class="success-message">${registerSuccess}</div>
            </c:if>
        </form>
    </div>

</body>
</html>

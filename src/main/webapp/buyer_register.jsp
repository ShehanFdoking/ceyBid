<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Buyer Registration</title>
</head>
<body>
    <h2>Buyer Registration Form</h2>
    <form action="registerBuyer" method="post">
        <label for="name">Full Name:</label><br/>
        <input type="text" id="name" name="name" required><br/><br/>

        <label for="username">Username:</label><br/>
        <input type="text" id="username" name="username" required><br/><br/>

        <label for="password">Password:</label><br/>
        <input type="password" id="password" name="password" required><br/><br/>

        <label for="email">Email:</label><br/>
        <input type="email" id="email" name="email" required><br/><br/>

        <label for="nic">NIC:</label><br/>
        <input type="text" id="nic" name="nic" required><br/><br/>

        <input type="submit" value="Register as Buyer">
    </form>
</body>
</html>

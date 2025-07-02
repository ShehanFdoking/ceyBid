<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category Details</title>
<link rel="stylesheet" href="styles/header.css">
<link rel="stylesheet" href="styles/category.css">
</head>
<body>

<!-- Header Section -->
<div class="header">
    <img src="image/logo.png" alt="Logo" class="logo">
    <h1>CEYBID</h1>
    <h1>ONLINE BIDDING SYSTEM</h1>
    <p>A complete solution for managing online auctions, selling products and bids</p>

    <div class="nav">
        <ul class="nav-links">
            <li><a href="#">HOME</a></li>
            <li><a href="#">ABOUT US</a></li>
            <li><a href="#">SELLERS</a></li>
            <li><a href="#">ALL PRODUCTS</a></li>
            <li><a href="#">REGISTER</a></li>
            <li><a href="#">LOGIN</a></li>
            <li><a href="#">CONTACT US</a></li>
        </ul>
        <div class="search-container">
            <input type="text" placeholder="Search products..." class="search-bar">
            <button class="search-button">Search</button>
        </div>
    </div>
</div>

<!-- Category Table -->

<h1 class="topic">Category Details</h1>
<br>
<table>
    <tr>
        <th>No</th>
        <th>Category Name</th>
        <th>Category Code</th>
        <th>Description</th>
        <th>Status</th>
        <th>Date</th>
        <th>Admin Id</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>

    <c:forEach var="cus" items="${cusDetails}">
        <c:set var="id" value="${cus.id}" />
        <c:set var="name" value="${cus.name}" />
        <c:set var="code" value="${cus.code}" />
        <c:set var="description" value="${cus.description}" />
        <c:set var="status" value="${cus.status}" />
        <c:set var="date" value="${cus.date}" />
        <c:set var="admin_id" value="${cus.admin_id}" />

        <tr>
            <td>${id}</td>
            <td>${name}</td>
            <td>${code}</td>
            <td>${description}</td>
            <td>${status}</td>
            <td>${date}</td>
            <td>${admin_id}</td>
            <td>
                <c:url value="updatecategory.jsp" var="updateLink">
                    <c:param name="id" value="${id}" />
                    <c:param name="name" value="${name}" />
                    <c:param name="code" value="${code}" />
                    <c:param name="description" value="${description}" />
                    <c:param name="status" value="${status}" />
                    <c:param name="date" value="${date}" />
                    <c:param name="admin_id" value="${admin_id}" />
                </c:url>
                <a href="${updateLink}">
                    <input type="button" value="Update" />
                </a>
            </td>
            <td>
                <c:url value="deletecategory.jsp" var="deleteLink">
                    <c:param name="id" value="${id}" />
                    <c:param name="name" value="${name}" />
                    <c:param name="code" value="${code}" />
                    <c:param name="description" value="${description}" />
                    <c:param name="status" value="${status}" />
                    <c:param name="date" value="${date}" />
                    <c:param name="admin_id" value="${admin_id}" />
                </c:url>
                <a href="${deleteLink}">
                    <input type="button" value="Delete" />
                </a>
            </td>
        </tr>
    </c:forEach>
</table>


</body>
</html>

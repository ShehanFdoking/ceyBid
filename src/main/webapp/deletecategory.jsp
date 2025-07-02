<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Delete Category</title>

    <!-- Link to external CSS files -->
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/deleteCategory.css">
</head>
<body>

    <!-- HEADER -->
    <div class="header">
        <img src="image/logo.png" alt="Logo" class="logo">
        <h1>CEYBID</h1>
        <h1>ONLINE BIDING SYSTEM</h1>
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

    <!-- GET PARAMETERS -->
    <%
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String code = request.getParameter("code");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String date = request.getParameter("date");
        String admin_id = request.getParameter("admin_id");
    %>

    <!-- DELETE FORM -->
    <h1 class="topic">Delete Category</h1><br>
    <div class="dlt-container">
    <form action="DeleteCategoryServlet" method="post" onsubmit="return confirmDelete()">
        

        No<input type="text" name="cusid" value="<%= id%>" readonly><br>
        Category Name<input type="text" name="name" value="<%= name%>" readonly><br>
        Category Code<input type="text" name="code" value="<%= code%>" readonly><br>
        Description<input type="text" name="description" value="<%= description%>" readonly><br>
        Status<input type="text" name="status" value="<%= status%>" readonly><br>
        Date<input type="date" name="date" value="<%= date%>" readonly><br>
        Admin id<input type="text" name="adminid" value="<%= admin_id%>" readonly><br>

        <input type="submit" name="submit" value="Delete Category">
    </form>
    </div>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this category?");
        }
    </script>

</body>
</html>

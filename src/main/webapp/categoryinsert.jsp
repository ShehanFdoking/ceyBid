<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category Form</title>
    <link rel="stylesheet" href="styles/header.css">
    <link rel="stylesheet" href="styles/categoryForm.css">
</head>
<body>

    <%@ include file="header.jsp" %>

    <div class="container">
        <div class="form-box">
            <form action="CategoryInsert" method="post" onsubmit="return confirmInsert()">
                <h1>Category Form</h1>

                <label for="name">Category Name</label>
                <input type="text" id="name" name="name" required>

                <label for="code">Category Code</label>
                <input type="text" id="code" name="code" required>

                <label for="description">Description</label>
                <input type="text" id="description" name="description" required>

                <label for="status">Status</label>
                <select name="status" id="status" required>
                    <option value="">--Select Status--</option>
                    <option value="Active">Active</option>
                    <option value="Inactive">Inactive</option>
                </select>

                <label for="date">Date</label>
                <input type="date" name="date" id="date" required>

                <input type="submit" name="submit" value="Create Category">
            </form>
        </div>
    </div>

    <script>
        function confirmInsert() {
            return confirm("Are you sure you want to create this category?");
        }
    </script>

</body>
</html>

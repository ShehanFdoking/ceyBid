<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Category - CeyBid</title>
<link rel="stylesheet" href="styles/header.css">
<link rel="stylesheet" href="styles/categoryUpdate.css">
</head>
<body>

    <%@ include file="header.jsp" %>

	<div class="form-container">
		<h1 class="topic">Update Category Details</h1>

		<%
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String code = request.getParameter("code");
			String description = request.getParameter("description");
			String status = request.getParameter("status");
			String date = request.getParameter("date");
			String admin_id = request.getParameter("admin_id");
		%>

		<form action="UpdateCategoryServlet" method="post" onsubmit="return confirmUpdate()">
		    <label>No</label>
		    <input type="text" name="cusid" value="<%= id %>" readonly>

		    <label>Category Name</label>
		    <input type="text" name="name" value="<%= name %>">

		    <label>Category Code</label>
		    <input type="text" name="code" value="<%= code %>">

		    <label>Description</label>
		    <input type="text" name="description" value="<%= description %>" required>

		    <label>Status</label>
		    <select name="status" required>
		        <option value="Active" <%= status.equals("Active") ? "selected" : "" %>>Active</option>
		        <option value="Inactive" <%= status.equals("Inactive") ? "selected" : "" %>>Inactive</option>
		    </select>

		    <label>Date</label>
		    <input type="date" name="date" value="<%= date %>">

		    <label>Admin ID</label>
		    <input type="text" name="admin_id" value="<%= admin_id %>">

		    <input type="submit" name="submit" value="Update Category">
		</form>
	</div>

	<script>
	    function confirmUpdate() {
	        return confirm("Are you sure you want to update this category?");
	    }
	</script>

</body>
</html>

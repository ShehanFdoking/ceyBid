<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="buyer.Item, buyer.BidDBUtil" %>
<%
    String itemIdParam = request.getParameter("itemId");
    Integer buyerId = (Integer) session.getAttribute("buyerId");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Place a Bid</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="card shadow p-4">
        <h2 class="mb-4">Place Your Bid</h2>

        <% if (itemIdParam == null || itemIdParam.isEmpty()) { %>
            <div class="alert alert-danger">Error: Item ID is missing. Please go back and try again.</div>
        <% } else { 
            try {
                int itemId = Integer.parseInt(itemIdParam);
                Item item = BidDBUtil.getItemById(itemId);

                if (item != null) {
                    double minBid = item.getCurrentPrice() + 1;
        %>
                    <form action="BidInsertServlet" method="post" class="needs-validation" novalidate>
                        <% if (buyerId == null) { %>
                            <div class="mb-3">
                                <label for="buyerId" class="form-label">Buyer ID (required)</label>
                                <input type="number" name="buyerId" id="buyerId" class="form-control" required>
                            </div>
                        <% } else { %>
                            <input type="hidden" name="buyerId" value="<%= buyerId %>">
                        <% } %>

                        <input type="hidden" name="itemId" value="<%= itemId %>">

                        <div class="mb-3">
                            <label for="bidAmount" class="form-label">Your Bid (Minimum: $<%= String.format("%.2f", minBid) %>)</label>
                            <input type="number" step="0.01" min="<%= minBid %>" name="bidAmount" id="bidAmount" class="form-control" value="<%= minBid %>" required>
                        </div>

                        <button type="submit" class="btn btn-primary">Submit Bid</button>
                        <a href="javascript:history.back()" class="btn btn-secondary">Cancel</a>
                    </form>
        <%
                } else {
        %>
                    <div class="alert alert-warning">Item not found for ID: <%= itemId %></div>
        <%
                }
            } catch (NumberFormatException e) {
        %>
                <div class="alert alert-danger">Invalid Item ID format.</div>
        <%
            }
        } %>
    </div>
</div>

<script>
    // Bootstrap form validation
    (() => {
        'use strict';
        const forms = document.querySelectorAll('.needs-validation');
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>
</body>
</html>

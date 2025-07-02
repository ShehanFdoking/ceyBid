<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="buyer.BidDBUtil" %>
<%
    String bidIdParam = request.getParameter("bidId");
    if (bidIdParam != null) {
        int bidId = Integer.parseInt(bidIdParam);
        boolean isDeleted = BidDBUtil.deleteBid(bidId);

        if (isDeleted) {
            response.sendRedirect("DisplayItemsServlet");
        } else {
        	response.sendRedirect("DisplayItemsServlet");
        }
    } else {
        out.println("<p style='color:red;'>No bid ID provided.</p>");
    }
%>

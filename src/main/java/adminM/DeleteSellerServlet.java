package adminM;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import seller.DBConnection;

@WebServlet("/DeleteSellerServlet")
public class DeleteSellerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sellerId = Integer.parseInt(request.getParameter("seller_id"));
        SellerController.deleteSeller(sellerId);
        response.sendRedirect("ViewSellerServlet");
    }
}


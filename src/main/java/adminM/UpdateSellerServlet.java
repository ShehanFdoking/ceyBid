package adminM;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import seller.DBConnection;

public class UpdateSellerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sellerId = Integer.parseInt(request.getParameter("sellerId"));
        String sellerName = request.getParameter("sellerName");
        String sellerUN = request.getParameter("sellerUN");
        String sellerPW = request.getParameter("sellerPW");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");

        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DBConnection.getConnection();
            String query = "UPDATE sellers SET sellerName = ?, sellerUN = ?, sellerPW = ?, email = ?, nic = ? WHERE sellerId = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, sellerName);
            pstmt.setString(2, sellerUN);
            pstmt.setString(3, sellerPW);
            pstmt.setString(4, email);
            pstmt.setString(5, nic);
            pstmt.setInt(6, sellerId);
            pstmt.executeUpdate();

            response.sendRedirect("ViewSellersServlet");  // Redirect to view sellers page
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.closePreparedStatement(pstmt);
            DBConnection.closeConnection(conn);
        }
    }
}

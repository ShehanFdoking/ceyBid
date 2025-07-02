package adminM;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import seller.DBConnection;

@WebServlet("/ViewSellerServlet")
public class ViewSellerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<SellerModel> sellers = SellerController.getAllSellers();
        request.setAttribute("sellers", sellers);
        request.getRequestDispatcher("displaySellerDetail.jsp").forward(request, response);
    }
}


package adminM;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import seller.DBConnection;

@WebServlet("/EditSellerServlet")
public class EditSellerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        SellerModel s = new SellerModel();
        s.setSellerId(Integer.parseInt(request.getParameter("seller_id")));
        s.setSellerName(request.getParameter("seller_name"));
        s.setSellerUN(request.getParameter("seller_un"));
        s.setSellerPW(request.getParameter("seller_pw"));
        s.setEmail(request.getParameter("email"));
        s.setNic(request.getParameter("nic"));

        SellerController.updateSeller(s);
        response.sendRedirect("ViewSellerServlet");
    }
}


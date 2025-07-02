package adminM;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetSellerServlet")
public class GetSellerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sellerId = Integer.parseInt(request.getParameter("seller_id"));
        SellerModel seller = SellerController.getSellerById(sellerId);
        request.setAttribute("seller", seller);
        request.getRequestDispatcher("editSeller.jsp").forward(request, response);
    }
}


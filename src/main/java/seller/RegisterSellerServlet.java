package seller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerSeller")
public class RegisterSellerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");

        sellerModel seller = new sellerModel(name, uname, pass, email, nic);
        sellerController controller = new sellerController();
        boolean result = controller.registerSeller(seller);

        if (result) {
            response.sendRedirect("seller_success.jsp");
        } else {
            response.sendRedirect("seller_error.jsp");
        }
    }
}


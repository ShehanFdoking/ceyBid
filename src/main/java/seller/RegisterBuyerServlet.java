package seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerBuyer")
public class RegisterBuyerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        String nic = request.getParameter("nic");

        buyerModel buyer = new buyerModel(name, uname, pass, email, nic);
        buyerController controller = new buyerController();
        boolean result = controller.registerBuyer(buyer);

        if (result) {
            response.sendRedirect("buyer_success.jsp");
        } else {
            response.sendRedirect("buyer_error.jsp");
        }
    }
}

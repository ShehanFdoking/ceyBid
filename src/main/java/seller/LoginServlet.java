package seller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType"); // could be 'seller', 'buyer', or 'admin'

        boolean loginSuccess = false;
        String targetPage = "";
        
        HttpSession session = request.getSession();

        if ("seller".equals(userType)) {
            loginSuccess = sellerController.authenticateSeller(username, password);
            
            if (loginSuccess) {
                int sellerId = sellerController.getSellerIdByUsername(username);
                session.setAttribute("seller_id", sellerId);
                targetPage = "SellerDashboard.jsp";
            }

        } else if ("buyer".equals(userType)) {
            loginSuccess = buyerController.authenticateBuyer(username, password);
            
            if (loginSuccess) {
                int buyerId = buyerController.getBuyerIdByUsername(username);
                session.setAttribute("buyer_id", buyerId);
                targetPage = "DisplayItemsServlet";
            }

        } else if ("admin".equals(userType)) {
            loginSuccess = AdminController.authenticateAdmin(username, password);
            if (loginSuccess) {
                session.setAttribute("admin", username); 
                targetPage = "ADashBoard.jsp";
            }
        }


        if (loginSuccess) {
            response.sendRedirect(targetPage);
        } else {
            request.setAttribute("loginError", "Invalid username or password.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

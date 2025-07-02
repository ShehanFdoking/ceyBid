package seller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewItemsSellerServlet")
public class ViewItemsSellerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get session and verify seller is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("seller_id") == null) {
            System.out.println("No session or seller_id found, redirecting to login");
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve seller_id from session
        int sellerId = (Integer) session.getAttribute("seller_id");
        System.out.println("Fetching items for seller_id: " + sellerId);

        // Fetch items from database
        List<ItemModel> items = ItemController.getItemsBySeller(sellerId);
        System.out.println("Items retrieved: " + (items != null ? items.size() : "null"));

        // Set items as request attribute
        request.setAttribute("items", items);

        // Forward to JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewItemsSeller.jsp");
        dispatcher.forward(request, response);
    }
}
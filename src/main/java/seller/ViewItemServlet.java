package seller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ViewItemsSellerServlet")
public class ViewItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        
        // Ensure a session exists and seller is logged in
        if (session == null || session.getAttribute("seller_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int sellerId = (int) session.getAttribute("seller_id");

            // Get items belonging to the seller
            List<ItemModel> items = ItemController.getItemsBySeller(sellerId);

            // Debug log (optional)
            System.out.println("Seller ID: " + sellerId);
            System.out.println("Items found: " + (items != null ? items.size() : 0));

            request.setAttribute("items", items);
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewItemsSeller.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to retrieve seller items.");
            request.getRequestDispatcher("viewItemsSeller.jsp").forward(request, response);
        }
    }
}

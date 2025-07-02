package seller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/AddTestItemServlet")
public class AddTestItemServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get session and verify seller is logged in
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("seller_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve seller_id
        int sellerId = (Integer) session.getAttribute("seller_id");

        // Create a test item
        ItemModel testItem = new ItemModel();
        testItem.setItemName("Test Item");
        testItem.setStartingPrice(100.00);
        testItem.setCategoryId(1); // Assume category_id 1 exists
        testItem.setSellerId(sellerId);
        testItem.setEndingDate(Date.valueOf("2025-12-31"));
        testItem.setImagePath("/images/test_item.jpg");

        // Add item to database
        boolean success = ItemController.addItem(testItem);

        // Set response message
        if (success) {
            request.setAttribute("message", "Test item added successfully!");
        } else {
            request.setAttribute("message", "Failed to add test item.");
        }

        // Forward back to view items page
        RequestDispatcher dispatcher = request.getRequestDispatcher("ViewItemsSellerServlet");
        dispatcher.forward(request, response);
    }
}
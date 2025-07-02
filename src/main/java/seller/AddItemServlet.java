package seller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/AddItemServlet")
public class AddItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Retrieve and validate inputs
            String itemName = request.getParameter("item_name");
            double startingPrice = Double.parseDouble(request.getParameter("starting_price"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String sellerIdStr = request.getParameter("seller_id");
            String imagePath = request.getParameter("image_path");

            Date endingDate = Date.valueOf(request.getParameter("ending_date"));
            Date today = new Date(System.currentTimeMillis());

            if (endingDate.before(today)) {
                response.sendRedirect("addItem.jsp?error=Ending date cannot be in the past");
                return;
            }

            int sellerId = Integer.parseInt(sellerIdStr);

            // Create item
            ItemModel item = new ItemModel();
            item.setItemName(itemName);
            item.setStartingPrice(startingPrice);
            item.setCategoryId(categoryId);
            item.setEndingDate(endingDate);
            item.setSellerId(sellerId);
            item.setImagePath(imagePath);

            // Insert item
            boolean isSuccess = ItemController.addItem(item);

            if (isSuccess) {
                response.sendRedirect("viewItemsSeller.jsp");
            } else {
                response.sendRedirect("addItem.jsp?error=Failed to add item");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addItem.jsp?error=Something went wrong");
        }
    }
}

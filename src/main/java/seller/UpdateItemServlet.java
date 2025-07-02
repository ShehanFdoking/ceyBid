package seller;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateItemServlet")
public class UpdateItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int itemId = Integer.parseInt(request.getParameter("item_id"));
            String itemName = request.getParameter("item_name");
            double startingPrice = Double.parseDouble(request.getParameter("starting_price"));
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            Date endingDate = Date.valueOf(request.getParameter("ending_date")); // fixed: convert to java.sql.Date
             // Validate ending date is not in the past
            Date today = new Date(System.currentTimeMillis());
            if (endingDate.before(today)) {
                response.sendRedirect("updateItem.jsp?item_id=" + request.getParameter("item_id") + "&error=Ending date cannot be in the past");
                return;
            }
            String imagePath = request.getParameter("image_path");

            ItemModel item = new ItemModel();
            item.setItemId(itemId);
            item.setItemName(itemName);
            item.setStartingPrice(startingPrice);
            item.setCategoryId(categoryId);
            item.setEndingDate(endingDate);
            item.setImagePath(imagePath);

            boolean updated = ItemController.updateItem(item);

            if (updated) {
                response.sendRedirect("viewItemsSeller.jsp");
            } else {
                response.sendRedirect("updateItem.jsp?item_id=" + itemId + "&error=Update failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("updateItem.jsp?item_id=" + request.getParameter("item_id") + "&error=Exception occurred");
        }
    }
    
    
    
}


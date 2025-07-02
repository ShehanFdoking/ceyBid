package buyer;

import java.io.IOException;
import java.util.List;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ItemDetailsServlet")
public class ItemDetailsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        Item item = BidDBUtil.getItemById(itemId);  // Ensure getItemById method is correctly implemented
        request.setAttribute("item", item);
        
        // Fetch bids for the item and set them as an attribute
        List<PlaceBid> bids = BidDBUtil.getAllBids(itemId);  // Assuming the method returns List<PlaceBid>
        request.getSession().setAttribute("bids", bids);
        
        RequestDispatcher dis = request.getRequestDispatcher("itemDetails.jsp");
        dis.forward(request, response);
    }
}
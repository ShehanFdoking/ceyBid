package buyer;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/bids")
public class BidListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int itemId = Integer.parseInt(request.getParameter("itemId")); // Get itemId from URL
        List<Bid> bids = BidDBUtil.getBidsByItemId(itemId);

        request.setAttribute("bids", bids);
        request.setAttribute("itemId", itemId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("myBids.jsp");
        dispatcher.forward(request, response);
    }
}


package buyer;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DisplayItemsServlet")
public class DisplayItemsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Item> items = BidDBUtil.getAllItems();
        request.setAttribute("items", items);
        RequestDispatcher dis = request.getRequestDispatcher("displayItems.jsp");
        dis.forward(request, response);
    }
}
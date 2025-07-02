package seller;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GetItemServlet")
public class GetItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int itemId = Integer.parseInt(request.getParameter("item_id"));
            ItemModel item = ItemController.getItemById(itemId); // Make sure this method exists
            request.setAttribute("item", item);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateItem.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("viewItemsSeller.jsp?error=Could not load item for update");
        }
    }
}

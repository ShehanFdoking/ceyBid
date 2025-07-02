package seller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int itemId = Integer.parseInt(request.getParameter("item_id"));
        boolean deleted = ItemController.deleteItem(itemId);

        if (deleted) {
            response.sendRedirect("viewItemsSeller.jsp");
        } else {
            response.sendRedirect("viewItemsSeller.jsp?error=Delete failed");
        }
    }
}


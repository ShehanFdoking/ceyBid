package buyer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BidInsertServlet")
public class BidInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        // Retrieve buyerId from session
        HttpSession session = request.getSession();
        Integer buyerId = (Integer) session.getAttribute("buyerId");

        if (buyerId == null) {
            // If buyerId is not in session, display the form to input buyerId manually
            String manualBuyerId = request.getParameter("buyerId");

            if (manualBuyerId != null) {
                try {
                    // Validate and set the buyerId from the manual input
                    buyerId = Integer.parseInt(manualBuyerId);
                    session.setAttribute("buyerId", buyerId); // Store in session
                } catch (NumberFormatException e) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Invalid Buyer ID. Please enter a valid number.');");
                    out.println("location='placeBid.jsp';");
                    out.println("</script>");
                    return;
                }
            } else {
                // If buyerId is still null, ask the user to manually input it
                out.println("<script type='text/javascript'>");
                out.println("alert('You need to provide your Buyer ID.');");
                out.println("location='placeBid.jsp';");
                out.println("</script>");
                return;
            }
        }

        // Retrieve itemId and bidAmount from the form
        String itemIdParam = request.getParameter("itemId");
        String bidAmountParam = request.getParameter("bidAmount");

        if (itemIdParam == null || bidAmountParam == null) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Missing parameters');");
            out.println("location='placeBid.jsp?itemId=" + itemIdParam + "';");
            out.println("</script>");
            return;
        }

        try {
            int itemId = Integer.parseInt(itemIdParam);
            double bidAmount = Double.parseDouble(bidAmountParam);

            // Insert bid into the database
            boolean isInserted = BidDBUtil.insertBid(buyerId, itemId, bidAmount);

            if (isInserted) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Bid placed successfully');");
                out.println("window.history.go(-2);");
                out.println("</script>");
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('Failed to place bid');");
                out.println("location='placeBid.jsp';");
                out.println("</script>");
            }
        } catch (NumberFormatException e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid input. Please ensure all fields are filled correctly.');");
            out.println("location='placeBid.jsp';");
            out.println("</script>");
        }
    }
}

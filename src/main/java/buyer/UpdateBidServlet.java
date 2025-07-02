package buyer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateBidServlet")
public class UpdateBidServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int bidId = Integer.parseInt(request.getParameter("bidId"));
        double newAmount = Double.parseDouble(request.getParameter("newAmount"));

        boolean isUpdated = BidDBUtil.updateBidAmountById(bidId, newAmount);

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (isUpdated) {
            out.println("<script type='text/javascript'>");
            out.println("alert('✅ Bid updated successfully');");
            out.println("window.history.go(-2);");  // Go two steps back in the browser history
            out.println("window.location.reload();");
            out.println("</script>");
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('❌ Failed to update bid');");
            out.println("window.history.go(-2);");  // Go two steps back if update fails
            out.println("</script>");
        }
    }
}


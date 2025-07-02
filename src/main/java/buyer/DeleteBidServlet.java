package buyer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteBidServlet")
public class DeleteBidServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        int bidId = Integer.parseInt(request.getParameter("bidId"));

        boolean isDeleted = BidDBUtil.deleteBid(bidId);

        if (isDeleted) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Bid deleted successfully');");
            out.println("location='/CustomerDemo/DisplayItemsServlet';");
            out.println("</script>");
        } else {
            out.println("<script type='text/javascript'>");
            out.println("alert('Failed to delete bid');");
            out.println("location='viewBids.jsp';");
            out.println("</script>");
        }
    }
}


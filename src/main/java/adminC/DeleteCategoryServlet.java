package adminC;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("cusid");
		boolean isTrue;
		
		isTrue = CategoryDBUtil.deleteCategory(id);
		
		if (isTrue == true) {
			List<Category> cusDetails = CategoryDBUtil.getCategoryDetails(id);
			request.setAttribute("cusDetails", cusDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("category.jsp");
			dispatcher.forward(request, response);
		}
		else {
			
			List<Category> cusDetails = CategoryDBUtil.getCategoryDetails(id);
			request.setAttribute("cusDetails", cusDetails);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("category.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

}


package adminC;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateCategoryServlet")
public class UpdateCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("cusid");
		String name = request.getParameter("name");
		String code = request.getParameter("code");
		String description = request.getParameter("description");
		String status = request.getParameter("status");
		String date = request.getParameter("date");
		String admin_id = request.getParameter("admin_id");
		
		boolean isTrue;
		
		isTrue = CategoryDBUtil.updatecategory(id, name, code, description, status, date,admin_id);
		
		if(isTrue == true) {
			
			List<Category> cusDetails = CategoryDBUtil.getCategoryDetails(id);
			request.setAttribute("cusDetails", cusDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("category.jsp");
			dis.forward(request, response);
		}
		else {

			List<Category> cusDetails = CategoryDBUtil.getCategoryDetails(id);
			request.setAttribute("cusDetails", cusDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("categoryjsp");
			dis.forward(request, response);
		}
	}


}

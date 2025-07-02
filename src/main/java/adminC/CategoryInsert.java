package adminC;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CategoryInsert")
public class CategoryInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String name = request.getParameter("name");
		String code = request.getParameter("code");
		String description = request.getParameter("description");
		String status = request.getParameter("status");
		String date = request.getParameter("date");
		

		
		boolean isTrue;
		
		isTrue = CategoryDBUtil.insertcategory(name, code, description, status, date);
		
		if(isTrue == true) {

				List<Category> cusDetails = CategoryDBUtil.getCategory();
				request.setAttribute("cusDetails", cusDetails);
				
				RequestDispatcher dis = request.getRequestDispatcher("category.jsp");
				dis.forward(request, response);
				
			} else {
				RequestDispatcher dis2 = request.getRequestDispatcher("category.jsp");
				dis2.forward(request, response);
			}

	}

}


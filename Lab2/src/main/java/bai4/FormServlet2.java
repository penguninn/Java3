package bai4;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/form-update-2")
public class FormServlet2 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		user.setFullname("Nguyen Van Teo");
		user.setGender(true);
		user.setCountry("US");
		request.setAttribute("user", user);
		request.setAttribute("editabled", true);
		request.getRequestDispatcher("/bai4/form.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		System.out.println(fullname);
		request.getRequestDispatcher("/bai4/form.jsp").forward(request, response);
	}

}

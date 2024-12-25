package bai3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/form-update-1")
public class FormServlet1 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<>();
		map.put("fullname", "Nguyễn Văn Teo123");
		map.put("gender", true);
		map.put("country", "US");
		request.setAttribute("user", map);
		request.setAttribute("editabled", true);
		request.getRequestDispatcher("/bai3/form.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		System.out.println(fullname);
		request.getRequestDispatcher("/bai3/form.jsp").forward(request, response);
	}

}

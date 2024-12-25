package bai2;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/calculate/add", "/calculate/sub"})
public class Caculator extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("message", "Nhập số và chọn phép tính");
		request.getRequestDispatcher("/bai2/caculator.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String a = request.getParameter("a");
		String b = request.getParameter("b");
		String path = request.getServletPath();
		if(path.endsWith("/add")) {
		double c = Double.valueOf(a) + Double.valueOf(b);
		request.setAttribute("message", a + " + " + b + " = " + c);
		} else {
		double c = Double.valueOf(a) - Double.valueOf(b);
		request.setAttribute("message", a + " - " + b + " = " + c);
		}
		request.getRequestDispatcher("/bai2/caculator.jsp").forward(request, response);
	}

}

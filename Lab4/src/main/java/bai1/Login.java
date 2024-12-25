package bai1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/account/Login")
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("message", "Enter username and password");
		request.getRequestDispatcher("/bai1/login.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username.equalsIgnoreCase("FPT") && password.equals("poly")) {
		request.setAttribute("message", "Login successfully");
		} else {
		request.setAttribute("message", "Invalid username or password");
		}
		request.getRequestDispatcher("/bai1/login.jsp").forward(request, response);

	}
	

}

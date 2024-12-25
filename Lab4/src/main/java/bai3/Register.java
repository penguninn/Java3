package bai3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/bai3/register")
public class Register extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("uname", "fpoly");
		request.setAttribute("pass", "fpoly123");
		request.setAttribute("gender", true);
		request.setAttribute("family", true);
		request.setAttribute("country", "JP");
		request.setAttribute("note", "fpoly mai yeu");
		String[] hobbies = {"read", "", "music", "diff"};
		String hobbiesStr = String.join(",", hobbies);
		request.setAttribute("hobbies", hobbiesStr);
		request.getRequestDispatcher("/bai3/register.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		Boolean gender = Boolean.valueOf(request.getParameter("gender")); 
		String[] hobbies = request.getParameterValues("hobbies");
		Boolean family = Boolean.valueOf(request.getParameter("family")) != null; 
		String country = request.getParameter("country");
		String note = request.getParameter("note");
		
		System.out.println("Tên đăng nhập: " + uname);
		System.out.println("Mật khẩu: " + pass);
		System.out.println("Giới tính: " + (gender ? "Nam" : "Nữ"));
		System.out.println((family ? "Đã có" : "Chưa có") + " gia đình");
		System.out.println("Quốc tịch: " + country);
		System.out.print("Sở thích: ");
		if(hobbies != null) {
			for (String hb : hobbies) {
				System.out.print(hb + ", ");
			}
		}
		System.out.println();
		System.out.println("Ghi chú: " + note);
	}

}

package com.daipc.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import com.daipc.dao.ImplementUserDAO;
import com.daipc.dao.UserDAO;
import com.daipc.entity.User;

@WebServlet({ "/user/login", "/user/submitLogin", "/user/register", "/user/submitRegister", "/user/logout",
		"/user/forgot-password", "/user/tools", "/user/details" })
public class UserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest reqest, HttpServletResponse response) throws ServletException, IOException {
		String uri = reqest.getRequestURI();
		if (uri.contains("login")) {
			System.out.println("login");
			reqest.getRequestDispatcher("/view/signin.jsp").forward(reqest, response);
		} else if (uri.contains("register")) {
			System.out.println("register");
			reqest.getRequestDispatcher("/view/signup.jsp").forward(reqest, response);
		}
		else if (uri.contains("tools")) {
			System.out.println("tools");
			reqest.getRequestDispatcher("/view/tools.jsp").forward(reqest, response);
		} else if (uri.contains("logout")) {
			System.out.println("logout");
			HttpSession session = reqest.getSession();
			session.removeAttribute("username");
			session.invalidate();
			reqest.getRequestDispatcher("/news/home").forward(reqest, response);
		} else if (uri.contains("forgot-password")) {
			System.out.println("forgot");
			reqest.getRequestDispatcher("/view/forgot-password.jsp").forward(reqest, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String uri = request.getRequestURI();
		if (uri.contains("submitRegister")) {
			System.out.println("submitRegister");
			User user = new User(request.getParameter("id"), request.getParameter("password"),
					request.getParameter("fullName"), request.getParameter("birthday"),
					Boolean.parseBoolean(request.getParameter("gender")), request.getParameter("mobile"),
					request.getParameter("email"));
			UserDAO dao = new ImplementUserDAO();
			if (dao.create(user) > 0) {
				System.out.println("Tao tk thanh cong");
				HttpSession session = request.getSession();
				session.setAttribute("username", user.getId());
				request.setAttribute("status", "success");
			} else {
				System.out.println("Tao tk that bai");
				request.setAttribute("status", "error");
			}
			request.getRequestDispatcher("/view/signup.jsp").forward(request, response);
		} else if (uri.contains("submitLogin")) {
			System.out.println("submitLogin");
			String uname = request.getParameter("username");
			String pass = request.getParameter("password");

			UserDAO dao = new ImplementUserDAO();
			User user = dao.getByID(uname);
			if (user != null && user.getPassword().equals(pass)) {
				HttpSession session = request.getSession();
				session.setAttribute("username", user.getId());
				session.setAttribute("role", user.isRole());
				response.sendRedirect(request.getContextPath() + "/news/home");
			} else {
				HttpSession session = request.getSession();
				session.removeAttribute("username");
				session.invalidate();
				request.getRequestDispatcher("/view/signin.jsp").forward(request, response);
			}
		}
	}

}

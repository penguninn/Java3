package com.daipc.controller;

import jakarta.mail.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import com.daipc.dao.ImplementNewsDAO;
import com.daipc.dao.ImplementUserDAO;
import com.daipc.entity.News;
import com.daipc.entity.NewsLetter;

@WebServlet({ "/Management", "/Management/news", "/Management/category", "/Management/user", "/Management/newsletter",
		"/Management/detail" })
public class Management extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("username");
		Boolean role = (Boolean) session.getAttribute("role");

		if (uname == null) {
			response.sendRedirect("home.jsp");
			return;
		}

		ImplementNewsDAO dao = new ImplementNewsDAO();
		ImplementUserDAO user = new ImplementUserDAO();
		String action = request.getParameter("action");
		String uri = request.getRequestURI();

		if (uri.contains("detail")) {
			String id = request.getParameter("id");
			News news = dao.getByID(id);
			request.setAttribute("item", news);
		}
		if (action == null) {
			request.setAttribute("listCategory", dao.getAllCategory());
			request.setAttribute("listCategory", dao.getAllCategory());
			if (role != null && role) {
				request.setAttribute("listNews", dao.getAll());
			} else {
				request.setAttribute("listNews", dao.getAllByAuthor(uname));
			}
		} else {
			switch (action) {
			case "news":
				request.setAttribute("listCategory", dao.getAllCategory());
				if (role != null && role) {
					request.setAttribute("listNews", dao.getAll());
				} else {
					request.setAttribute("listNews", dao.getAllByAuthor(uname));
				}
				break;
			case "category":
				request.setAttribute("listCategory", dao.getAllCategory());
				break;
			case "user":
				request.setAttribute("listUser", user.getAll());
				break;
			case "newsletter":
				request.setAttribute("listNewsletter", user.getAllMail());
				break;
			default:
				// Handle unknown actions
				response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
				return;
			}

		}

		request.getRequestDispatcher("/view/tools.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ImplementNewsDAO dao = new ImplementNewsDAO();
		ImplementUserDAO user = new ImplementUserDAO();
		String uri = request.getRequestURI();
		String action = request.getParameter("subaction");
		if (uri.contains("news")) {
			HttpSession session = request.getSession();
			String uname = (String) session.getAttribute("username");
			News news = new News(request.getParameter("id"), request.getParameter("title"),
					request.getParameter("content"),
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")), uname, 0,
					request.getParameter("categoryId"), Boolean.valueOf(request.getParameter("home")));
			switch (action) {
			case "create":
				if(dao.create(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			case "update":
				if(dao.update(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			case "delete":
				if(dao.deleteById(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			}
			response.sendRedirect(request.getContextPath() + "/Management");
		}
		
		if (uri.contains("news")) {
			HttpSession session = request.getSession();
			String uname = (String) session.getAttribute("username");
			News news = new News(request.getParameter("id"), request.getParameter("title"),
					request.getParameter("content"),
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")), uname, 0,
					request.getParameter("categoryId"), Boolean.valueOf(request.getParameter("home")));
			switch (action) {
			case "create":
				if(dao.create(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			case "update":
				if(dao.update(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			case "delete":
				if(dao.deleteById(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			}
			response.sendRedirect(request.getContextPath() + "/Management");
		}
		
		if (uri.contains("news")) {
			HttpSession session = request.getSession();
			String uname = (String) session.getAttribute("username");
			News news = new News(request.getParameter("id"), request.getParameter("title"),
					request.getParameter("content"),
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")), uname, 0,
					request.getParameter("categoryId"), Boolean.valueOf(request.getParameter("home")));
			switch (action) {
			case "create":
				if(dao.create(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			case "update":
				if(dao.update(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			case "delete":
				if(dao.deleteById(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			}
			response.sendRedirect(request.getContextPath() + "/Management");
		}
		
		if (uri.contains("news")) {
			HttpSession session = request.getSession();
			String uname = (String) session.getAttribute("username");
			News news = new News(request.getParameter("id"), request.getParameter("title"),
					request.getParameter("content"),
					LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")), uname, 0,
					request.getParameter("categoryId"), Boolean.valueOf(request.getParameter("home")));
			switch (action) {
			case "create":
				if(dao.create(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			case "update":
				if(dao.update(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			case "delete":
				if(dao.deleteById(news) > 0) {
					System.out.println("Thanh Cong");
				} else {
					System.out.println("That Bai");
				}
				break;
			}
			response.sendRedirect(request.getContextPath() + "/Management");
		}
	}

}

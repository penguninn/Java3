package com.daipc.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.Image;
import java.io.IOException;

import com.daipc.dao.ImplementNewsDAO;
import com.daipc.dao.ImplementUserDAO;
import com.daipc.dao.NewsDAO;
import com.daipc.entity.News;

@WebServlet({"/news/home", "/news/detail", "/news/catogery", "/news/xemnhieu", "/news/moinhat", "/news/daxem"})
public class NewsServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ImplementNewsDAO dao = new ImplementNewsDAO();
		String uri = request.getRequestURI();
		request.setAttribute("categories", dao.getAllCategory());
		if(uri.contains("home")) {
			request.setAttribute("list", dao.getAll());
			request.setAttribute("isHomePage", true); 
			request.getRequestDispatcher("/view/home.jsp").forward(request, response);
		}
		else if(uri.contains("detail")) {
			String id = request.getParameter("id");
			News news = dao.getByID(id);
			request.setAttribute("item", news);
			request.setAttribute("sameCatogery", dao.getNewsByCatogery(news.getCategoryId()));
			request.getRequestDispatcher("/view/detail.jsp").forward(request, response);
		} else if(uri.contains("catogery")) {
			String id = request.getParameter("idCategory");
			request.setAttribute("list", dao.getNewsByCatogery(id));
			request.getRequestDispatcher("/view/home.jsp").forward(request, response);
		}
		else if(uri.contains("xemnhieu")) {
			request.setAttribute("list", dao.getNewsByView());
			request.getRequestDispatcher("/view/home.jsp").forward(request, response);
		}
		else if(uri.contains("moinhat")) {
			request.setAttribute("list", dao.getNewsByPosted());
			request.getRequestDispatcher("/view/home.jsp").forward(request, response);
		}else if(uri.contains("daxem")) {
			request.getRequestDispatcher("/view/home.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

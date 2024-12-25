package com.fpoly;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/url-info")
public class UrlInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String url = request.getRequestURL().toString();
        String uri = request.getRequestURI();
        String queryString = request.getQueryString();
        String servletPath = request.getServletPath();
        String contextPath = request.getContextPath();
        String pathInfo = request.getPathInfo();
        String method = request.getMethod();

        response.getWriter().write("<html><body>");
        response.getWriter().write("<h1>Thông tin URL</h1>");
        response.getWriter().write("<p><strong>URL:</strong> " + url + "</p>");
        response.getWriter().write("<p><strong>URI:</strong> " + uri + "</p>");
        response.getWriter().write("<p><strong>QueryString:</strong> " + (queryString != null ? queryString : "None") + "</p>");
        response.getWriter().write("<p><strong>ServletPath:</strong> " + servletPath + "</p>");
        response.getWriter().write("<p><strong>ContextPath:</strong> " + contextPath + "</p>");
        response.getWriter().write("<p><strong>PathInfo:</strong> " + (pathInfo != null ? pathInfo : "None") + "</p>");
        response.getWriter().write("<p><strong>Method:</strong> " + method + "</p>");
        response.getWriter().write("</body></html>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); 
    }
}

package com.fpoly;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/crud/create", "/crud/update", "/crud/delete", "/crud/edit/2024"})
public class CrudServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String path = request.getServletPath();
    	
    	switch (path) {
        case "/crud/create":
            response.getWriter().write("<h1>Handling CREATE operation</h1>");
            break;
        case "/crud/update":
            response.getWriter().write("<h1>Handling UPDATE operation</h1>");
            break;
        case "/crud/delete":
            response.getWriter().write("<h1>Handling DELETE operation</h1>");
            break;
        case "/crud/edit/2024":
            response.getWriter().write("<h1>Handling EDIT operation for 2024</h1>");
            break;
        default:
            response.getWriter().write("<h1>Unknown operation</h1>");
            break;
    }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}

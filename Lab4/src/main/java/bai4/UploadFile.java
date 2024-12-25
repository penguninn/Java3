package bai4;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
@MultipartConfig()
@WebServlet("/upload")
public class UploadFile extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/bai4/upload.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part photo = request.getPart("photo");
		String path = photo.getSubmittedFileName();
		String fileName = request.getServletContext().getRealPath(path);
		photo.write(fileName);
		request.getRequestDispatcher("/bai4/upload.jsp").forward(request, response);
	}

}

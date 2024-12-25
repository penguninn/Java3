package poly;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet({"/home/index", "/home/about", "/home/contact"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String uri = req.getRequestURI();
        if (uri.contains("index")) {
            req.setAttribute("view", "/view/home/index.jsp");
        } else if (uri.contains("about")) {
            req.setAttribute("view", "/view/home/about.jsp");
        } else if (uri.contains("contact")) {
            req.setAttribute("view", "/view/home/contact.jsp");
        }

        req.getRequestDispatcher("/view/layout.jsp").forward(req, resp);
    }
}

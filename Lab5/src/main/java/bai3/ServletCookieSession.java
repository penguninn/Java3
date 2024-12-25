package bai3;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Base64;

@WebServlet("/login")
public class ServletCookieSession extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String sessionUsername = (String) request.getSession().getAttribute("username");
        if (sessionUsername != null) {

            request.setAttribute("message", "Da dang nhap " + sessionUsername);
            request.getRequestDispatcher("/bai3/index.jsp").forward(request, response);
            return;
        }


        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user")) {
                    String encoded = cookie.getValue();
                    byte[] bytes = Base64.getDecoder().decode(encoded);
                    String[] userInfo = new String(bytes).split(",");
                    request.setAttribute("username", userInfo[0]);
                    request.setAttribute("password", userInfo[1]);

                    request.getSession().setAttribute("username", userInfo[0]);
                    request.setAttribute("message", "Da dang nhap");
                    request.getRequestDispatcher("/bai3/index.jsp").forward(request, response);
                    return;
                }
            }
        }


        request.getRequestDispatcher("/bai3/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String remember = request.getParameter("remember-me");

        if (username.equalsIgnoreCase("FPT") && password.equals("poly")) {
            request.setAttribute("message", "Dang nhap thanh cong!");
            request.getSession().setAttribute("username", username);


            if (remember != null) {
                byte[] bytes = (username + "," + password).getBytes();
                String userInfo = Base64.getEncoder().encodeToString(bytes);
                Cookie cookie = new Cookie("user", userInfo);
                cookie.setMaxAge(30 * 24 * 60 * 60);
                cookie.setPath("/");
                response.addCookie(cookie);
            }


            request.getRequestDispatcher("/bai3/index.jsp").forward(request, response);

        } else {
            request.getSession().invalidate();
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        cookie.setValue("");
                        cookie.setMaxAge(0);
                        cookie.setPath("/");
                        response.addCookie(cookie);
                    }
                }
            }
            request.setAttribute("message", "Sai thong tin!");
            request.getRequestDispatcher("/bai3/index.jsp").forward(request, response);
        }
    }
}

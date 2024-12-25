package poly;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*")
public class I18n extends HttpFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String lang = request.getParameter("lang");
        if(lang != null) {
            httpRequest.getSession().setAttribute("lang", lang);
        } else if (httpRequest.getSession().getAttribute("lang") == null) {
            httpRequest.getSession().setAttribute("lang", "vi"); // Mặc định là tiếng Việt
        }
        chain.doFilter(httpRequest, response);
    }
}


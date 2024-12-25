package bai1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Date;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.beanutils.converters.DateTimeConverter;

@WebServlet("/save")
public class ServletBeanUtils extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/bai1/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Staff bean = new Staff();
        try {

            DateTimeConverter dtc = new DateConverter(new Date());
            dtc.setPattern("MM/dd/yyyy");
            ConvertUtils.register(dtc, Date.class);

            BeanUtils.populate(bean, request.getParameterMap());
            System.out.println(bean.getFullname());
            System.out.println(bean.getBirthday());
            System.out.println(bean.isGender() ? "Nam" : "Nữ");
            for (String hb : bean.getHobbies()) {
                System.out.println(hb);
            }
            System.out.println(bean.getCountry());
            System.out.println(bean.getSalary());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

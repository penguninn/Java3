package poly.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import poly.dao.EmpolyeeDAO;
import poly.dao.EmployeeDAOImpl;
import poly.entity.Emlpoyee;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

@WebServlet({"/EmployeeServlet", "/empoloyees/index", "/empoloyees/edit/*", "/empoloyees/create",
		"/empoloyees/update", "/empoloyees/delete", "/empoloyees/reset" })
public class EmployeeServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Emlpoyee form = new Emlpoyee();
		try {
			BeanUtils.populate(form, req.getParameterMap());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		EmpolyeeDAO dao = new EmployeeDAOImpl();
		String path = req.getServletPath();
		if (path.contains("edit")) {
			String id = req.getPathInfo().substring(1);
			form = dao.findById(id);
		} else if (path.contains("create")) {
			dao.create(form);
			form = new Emlpoyee();
		} else if (path.contains("update")) {
			dao.update(form);
		} else if (path.contains("delete")) {
			dao.deleteById(form.getId());
			form = new Emlpoyee();
		} else {
			form = new Emlpoyee();
		}
		req.setAttribute("item", form);
		List<Emlpoyee> list = dao.findAll();
		for (Emlpoyee e : list) {
			System.out.println(e.getId());
		}
		req.setAttribute("list", list);
		req.getRequestDispatcher("/employees.jsp").forward(req, resp);
	}

}

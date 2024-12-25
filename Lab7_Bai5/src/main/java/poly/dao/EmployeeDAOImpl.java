package poly.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import poly.entity.Emlpoyee;
import poly.utils.Jdbc;

public class EmployeeDAOImpl implements EmpolyeeDAO {
	@Override
	public List<Emlpoyee> findAll() {
		String sql = "SELECT * FROM Employees";
		try {
			List<Emlpoyee> entities = new ArrayList<>();
			Object[] values = {};
			ResultSet rs = Jdbc.executeQuery(sql, values);
			while (rs.next()) {
				entities.add(new Emlpoyee(
							rs.getString(1),
							rs.getString(2),
							rs.getString(3),
							rs.getString(4),
							rs.getBoolean(5),
							rs.getString(6),
							rs.getInt(7),
							rs.getString(8)
						));
			}
			return entities;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public Emlpoyee findById(String id) {
		String sql = "SELECT * FROM Employees WHERE Id=?";
		try {
			Object[] values = { id };
			ResultSet rs = Jdbc.executeQuery(sql, values);
			if (rs.next()) {
				Emlpoyee entity = new Emlpoyee(
						rs.getString(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getBoolean(5),
						rs.getString(6),
						rs.getInt(7),
						rs.getString(8)
						);
				return entity;
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		throw new RuntimeException("Not found");
	}

	@Override
	public void create(Emlpoyee entity) {
		String sql = "INSERT INTO Employees (Id, Password, Fullname, Photo, Gender, Birthday, Salary, DepartmentID) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Object[] values = { 
					entity.getId(), 
					entity.getPassword(), 
					entity.getFullName(),
					entity.getPhoto(),
					entity.isGender(),
					entity.getBirthday(),
					entity.getSalary(),
					entity.getDepartmentID()
				};
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void update(Emlpoyee entity) {
		String sql = "UPDATE Employees SET Password = ?, Fullname = ?, Photo = ?, Gender = ?, Birthday = ?, Salary = ?,  DepartmentID = ? where id = ?";
		try {
			Object[] values = { 
					entity.getPassword(), 
					entity.getFullName(),
					entity.getPhoto(),
					entity.isGender(),
					entity.getBirthday(),
					entity.getSalary(),
					entity.getDepartmentID(),
					entity.getId()
				};
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void deleteById(String id) {
		String sql = "DELETE FROM Employees WHERE Id=?";
		try {
			Object[] values = { id };
			Jdbc.executeUpdate(sql, values);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}

package com.daipc.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.daipc.entity.NewsLetter;
import com.daipc.entity.User;
import com.daipc.util.DBConnect;

public class ImplementUserDAO implements UserDAO {
	
	public ImplementUserDAO() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public List<User> getAll() {
		String sql = "select * from USERS";
		try {
			List<User> list = new ArrayList<>();
			Object[] values = {};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			while (rs.next()) {
				list.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
						rs.getString(6), rs.getString(7), rs.getBoolean(8)));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<NewsLetter> getAllMail() {
		String sql = "select * from NEWSLETTERS";
		try {
			List<NewsLetter> list = new ArrayList<>();
			Object[] values = {};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			while (rs.next()) {
				list.add(new NewsLetter(rs.getString(1), rs.getBoolean(2)));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public User getByID(String id) {
		String sql = "select * from USERS where id = ?";
		try {
			List<User> list = new ArrayList<>();
			Object[] values = { id };
			ResultSet rs = DBConnect.executeQuery(sql, values);
			if (rs.next()) {
				return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getBoolean(5),
						rs.getString(6), rs.getString(7), rs.getBoolean(8));
			} 
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int create(User user) {
		String sql = "INSERT INTO USERS (Id, Passwords, Fullname, Birthday, Gender, Mobile, Email, Roles) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Object[] values = {user.getId(), user.getPassword(), user.getFullName(), user.getBirthday(), user.isGender(), user.getMobile(), user.getEmail(), user.isRole()};
			return  DBConnect.executeUpdate(sql, values);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	@Override
	public int update(User user) {
		String sql = "update users set Passwords = ? , Fullname = ?,  Birthday = ? , Gender = ? , Mobile= ? , Email = ? , Roles = ? where id = ?";
		try {
			Object[] values = {user.getId(), user.getPassword(), user.getFullName(), user.getBirthday(), user.isGender(), user.getMobile(), user.getEmail(), user.isRole()};
			return  DBConnect.executeUpdate(sql, values);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	@Override
	public int deleteById(User user) {
		String sql = "delete from users where id = ?";
		try {
			Object[] values = {user.getId()};
			return  DBConnect.executeUpdate(sql, values);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}
}

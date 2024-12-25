package com.daipc.dao;

import java.util.List;

import com.daipc.entity.User;

public interface UserDAO {

	List<User> getAll();
	
	User getByID(String id);
	
	int create(User user);
	
	int update(User user);
	
	int deleteById(User user);
}

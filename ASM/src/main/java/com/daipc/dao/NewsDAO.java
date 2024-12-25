package com.daipc.dao;

import java.util.List;

import com.daipc.entity.News;
import com.daipc.entity.User;

public interface NewsDAO {
	
	List<News> getAll();
	
	News getByID(String id);
	
	int create(News news);
	
	int update(News news);
	
	int deleteById(News news);
}

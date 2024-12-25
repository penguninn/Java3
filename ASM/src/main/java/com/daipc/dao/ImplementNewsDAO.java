package com.daipc.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.daipc.entity.Category;
import com.daipc.entity.News;
import com.daipc.entity.User;
import com.daipc.util.DBConnect;

public class ImplementNewsDAO implements NewsDAO{
	@Override
	public List<News> getAll() {
		String sql = "select * from News";
		try {
			List<News> list = new ArrayList<>();
			Object[] values = {};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			while (rs.next()) {
				list.add(new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getBoolean(9)));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<News> getAllByAuthor(String id) {
		String sql = "select * from News where Author = ?";
		try {
			List<News> list = new ArrayList<>();
			Object[] values = {id};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			while (rs.next()) {
				list.add(new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getBoolean(9)));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public News getByID(String id) {
		String sql = "select * from News where id = ?";
		try {
			Object[] values = {id};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			if (rs.next()) {
				return new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getBoolean(9));
			}
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<Category> getAllCategory() {
		String sql = "select * from CATEGORIES";
		try {
			List<Category> list = new ArrayList<>();
			Object[] values = {};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			while (rs.next()) {
				list.add(new Category(rs.getString(1), rs.getString(2)));
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<News> getNewsByCatogery(String idCatogery) {
		String sql = "select * from News where CategoryId = ?";
		try {
			List<News> list = new ArrayList<>();
			Object[] values = {idCatogery};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			
			while (rs.next()) {
				
				list.add(new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getBoolean(9)));
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<News> getNewsByView() {
		String sql = "SELECT * FROM News ORDER BY ViewCount DESC LIMIT 5";
		try {
			List<News> list = new ArrayList<>();
			Object[] values = {};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			int cnt = 0;
			while (rs.next()) {
				cnt++;
				list.add(new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getBoolean(9)));
			}
			System.out.println(cnt);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public List<News> getNewsByPosted() {
		String sql = "SELECT * FROM News ORDER BY PostedDate DESC LIMIT 5";
		try {
			List<News> list = new ArrayList<>();
			Object[] values = {};
			ResultSet rs = DBConnect.executeQuery(sql, values);
			int cnt = 0;
			while (rs.next()) {
				cnt++;
				list.add(new News(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getInt(7), rs.getString(8), rs.getBoolean(9)));
			}
			System.out.println(cnt);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public int create(News news) {
		String sql = "INSERT INTO NEWS (Id, Title, Content, Images, PostedDate, Author, ViewCount, CategoryId, Home) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			Object[] values = {news.getId(), news.getTitle(), news.getContent(), "default.jpg", news.getPostedDate(), news.getAuthor(),  news.getViewCount(), news.getCategoryId(), news.isHome()};
			return  DBConnect.executeUpdate(sql, values);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int update(News news) {
		String sql = "update NEWS set Title = ? , Content = ? , Images = ? , PostedDate = ? , Author = ? ,  ViewCount = ? , CategoryId = ? , Home = ? where id = ?";
		try {
			Object[] values = {news.getTitle(), news.getContent(), "default.jpg", news.getPostedDate(), news.getAuthor(),  news.getViewCount(), news.getCategoryId(), news.isHome(), news.getId()};
			return  DBConnect.executeUpdate(sql, values);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public int deleteById(News news) {
		String sql = "delete from NEWS where id = ?";
		try {
			Object[] values = {news.getId()};
			return  DBConnect.executeUpdate(sql, values);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	
}

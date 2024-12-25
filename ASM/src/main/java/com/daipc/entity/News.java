package com.daipc.entity;

import java.util.Date;

public class News {
	private String id;
	private String title;
	private String content;
	private String image;
	private String postedDate;
	private String author;
	private long viewCount;
	private String categoryId;
	private boolean home;

	public News(String id, String title, String content, String image, String postedDate, String author, long viewCount,
			String categoryId, boolean home) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.postedDate = postedDate;
		this.author = author;
		this.viewCount = viewCount;
		this.categoryId = categoryId;
		this.home = home;
	}
	
	

	public News(String id, String title, String content, String postedDate, String author, long viewCount, String categoryId,
			boolean home) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.postedDate = postedDate;
		this.author = author;
		this.categoryId = categoryId;
		this.home = home;
		this.viewCount = viewCount;
	}

	@Override
	public String toString() {
	    return "News{" +
	            "id='" + id + '\'' +
	            ", title='" + title + '\'' +
	            ", content='" + content + '\'' +
	            ", postedDate='" + postedDate + '\'' +
	            ", author='" + author + '\'' +
	            ", categoryId='" + categoryId + '\'' +
	            ", home=" + home +
	            '}';
	}


	public News() {
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPostedDate() {
		return postedDate;
	}

	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public long getViewCount() {
		return viewCount;
	}

	public void setViewCount(long viewCount) {
		this.viewCount = viewCount;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public boolean isHome() {
		return home;
	}

	public void setHome(boolean home) {
		this.home = home;
	}

}

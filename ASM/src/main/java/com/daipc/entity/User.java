package com.daipc.entity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class User {
	private String id;
	private String password;
	private String fullName;
	private String birthday;
	private boolean gender;
	private String mobile;
	private String email;
	private boolean role;

	public User() {
	}

	public User(String id, String password, String fullName, String birthday, boolean gender, String mobile, String email,
			boolean role) {
		super();
		this.id = id;
		this.password = password;
		this.fullName = fullName;
		setBirthday(birthday);
		this.gender = gender;
		this.mobile = mobile;
		this.email = email;
		this.role = role;
	}
	
	public User(String id, String password, String fullName, String birthday, boolean gender, String mobile, String email) {
		super();
		this.id = id;
		this.password = password;
		this.fullName = fullName;
		setBirthday(birthday);
		this.gender = gender;
		this.mobile = mobile;
		this.email = email;
	}

	@Override
	public String toString() {
	    return "User [id=" + id + ", password=" + password + ", fullName=" + fullName + 
	           ", birthday=" + birthday + ", gender=" + gender + 
	           ", mobile=" + mobile + ", email=" + email + ", role=" + role + "]";
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);
        try {
            sdf.parse(birthday);
            this.birthday = birthday;
        } catch (ParseException e) {
            throw new IllegalArgumentException("Invalid date format. Use yyyy-MM-dd");
        }
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isRole() {
		return role;
	}

	public void setRole(boolean role) {
		this.role = role;
	}

}

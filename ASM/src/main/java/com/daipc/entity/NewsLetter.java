package com.daipc.entity;

public class NewsLetter {
	private String email;
	private boolean enableds;

	public NewsLetter() {
	}

	public NewsLetter(String email, boolean enableds) {
		this.email = email;
		this.enableds = enableds;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isEnableds() {
		return enableds;
	}

	public void setEnableds(boolean enableds) {
		this.enableds = enableds;
	}

}

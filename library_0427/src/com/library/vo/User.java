package com.library.vo;

public class User {
	
	private int no;
	private String id;
	private String name;
	private String adminyn;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	
	
	public User(int no, String id, String name, String adminyn) {
		super();
		this.no = no;
		this.id = id;
		this.name = name;
		this.adminyn = adminyn;
	}



	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdminyn() {
		return adminyn;
	}

	public void setAdminyn(String adminyn) {
		this.adminyn = adminyn;
	}
	
	

}

package com.login.dao;

public class membersell {
	String sname,email,category,brand,phone,discription,location,price,gender,imageFileName,uname;
	public membersell() {
		super();
	}

	public membersell(String sname,String uname, String email, String category, String brand, String phone, String discription,
			String location, String price, String gender,String imageFileName) {
		super();
		this.sname = sname;
		this.uname = uname;
		this.email = email;
		this.category = category;
		this.brand = brand;
		this.phone = phone;
		this.discription = discription;
		this.location = location;
		this.price = price;
		this.gender = gender;
		this.imageFileName=imageFileName;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	
}

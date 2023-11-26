package com.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.login.Member;

public class SellerRegisterdao {

	public String url="jdbc:mysql://db:3306/jsp";
	public String sql="insert into seller(sname,uname,email,category,brand,phone,discription,location,price,gender,imageFileName) values(?,?,?,?,?,?,?,?,?,?,?)";
	String result="Data entered successfully";
	int rs=0;
	public int insert(membersell member) 
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,"root","root");
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,member.getSname());
			ps.setString(2,member.getUname());
			ps.setString(3,member.getEmail());
			ps.setString(4,member.getCategory());
			ps.setString(5,member.getBrand());
			ps.setString(6,member.getPhone());
			ps.setString(7,member.getDiscription());
			ps.setString(8,member.getLocation());
			ps.setString(9,member.getPrice());
			ps.setString(10,member.getGender());
			ps.setString(11,member.getImageFileName());
			rs=ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			return rs;
		}
		return rs;
	}
}

package com.login.dao;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.login.*;
public class RegisterDao {
	
	private String url="jdbc:mysql://db:3306/jsp";
	private String sql="insert into login values(?,?,?,?)";
	String result="Data entered successfully";
	int rs=0;
	public int insert(Member member) 
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,"root","root");
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,member.getUname());
			ps.setString(2,member.getEmail());
			ps.setString(3,member.getPhone());
			ps.setString(4,member.getPass());
			rs=ps.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			return rs;
		}
		return rs;
	}
	public void create(Member member) {
		try {
		String table_name=member.getUname();
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		String sql1="create table "+table_name+"(mesg_id INT NOT NULL AUTO_INCREMENT primary key,uname varchar(100),message varchar(2000))";
		System.out.println("IN the create "+sql1);
		st.executeUpdate(sql1);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return;
	}
}

package com.login;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.*;

@WebServlet("/Register")
public class Register extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
		String uname=request.getParameter("uname");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String pass=request.getParameter("pass");
		Member member = new Member(uname,email,phone,pass);
		
		RegisterDao rDao = new RegisterDao();
		int result=rDao.insert(member);
		rDao.create(member);
		if(result!=0) {
			response.sendRedirect("RegisterSuccess.jsp");
		}
		else {
			response.sendRedirect("RegisterFailed.jsp");		
		}
		
		
		
	}

}

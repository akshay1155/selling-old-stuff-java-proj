package com.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/Forgot")
public class Forgot extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname=request.getParameter("uname");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
			PreparedStatement ps=con.prepareStatement("select * from login where uname=? and email=? and phone=? ");
			ps.setString(1,uname);
			ps.setString(2,email);
			ps.setString(3,phone);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				String pass=rs.getString("pass");
				//System.out.println("The pass word is injava: "+pass);
				request.getSession().setAttribute("password", pass);
			    response.sendRedirect("forgot.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

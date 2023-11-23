package com.login;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.login.dao.SellerRegisterdao;
import com.login.dao.membersell;

@MultipartConfig
@WebServlet("/SellData")
public class SellData extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("inside the do post method");
		String sname=request.getParameter("sname");
		String uname=request.getParameter("uname");
		System.out.println("user name is :"+uname);
		String category=request.getParameter("category");
		String email=request.getParameter("email");
		String brand=request.getParameter("brand");
		String phone=request.getParameter("phone");
		String discription=request.getParameter("description");
		String location=request.getParameter("location");
		String price=request.getParameter("price");
		String gender=request.getParameter("gender");
		Part file=request.getPart("image");
		String imageFileName=(String)(file.getSubmittedFileName()); 
		System.out.println(sname);
		System.out.println(uname);
		System.out.println(category);
		System.out.println(email);
		System.out.println(brand);
		System.out.println(phone);
		System.out.println(discription);
		System.out.println(location);
		System.out.println(price);
		System.out.println(gender);
		System.out.println("selected image FIle Name: "+imageFileName);
		String uploadPath="C:/Users/user/eclipse-workspace/demo/src/main/webapp/images2/"+imageFileName; //upload path where we have to upload out actual image
		System.out.println("Upload Path : "+uploadPath);
		try {
			FileOutputStream fos=new FileOutputStream(uploadPath);
			InputStream is=file.getInputStream();
			byte[] data=new byte[(is.available())];
			is.read(data);
			fos.write(data);
			fos.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		membersell member=new membersell(sname,uname,email,category,brand,phone,discription,location,price,gender,imageFileName);
		
		SellerRegisterdao rDao = new SellerRegisterdao();
		int result=rDao.insert(member);
		if(result!=0) {
			response.sendRedirect("success.jsp");
		}
		else {
			PrintWriter out=response.getWriter();
			out.println("Insertion failed");
		}
	}

}

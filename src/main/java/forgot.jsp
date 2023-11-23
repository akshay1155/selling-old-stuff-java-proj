<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Sell | page</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,
           wght@0,300;0,400;0,500;0,700;1,600&display=swap"
      rel="stylesheet"/>
    <link rel="stylesheet" href="form1.css" />
  </head>
  <body>
    <%
		//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
		//response.setHeader("Pragma", "no-cache");//HTTP 1.0
		//response.setHeader("Expires","0");// Proxies
		String ab=(String)(session.getAttribute("username"));
		if(ab!=null)
		{
			response.sendRedirect("logout.jsp");
		}
	
	%>
	<% String pass = (String) request.getSession().getAttribute("password");
		if(pass!=null)
			//System.out.println("pass word is "+pass); %>
    <div class="container">
      <div class="title">Forgot Password?</div>
      <div><h3>Enter your username,email and phone to verify.We will show your password</h3></div>
      <form action="Forgot" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Username</span>
            <input type="text" placeholder="Username" name="uname" />
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="Enter your Email" name="email" />
          </div>
          <div class="input-box">
            <span class="details">Phone No.</span>
            <input type="text" placeholder="Enter your number" name="phone" />
          </div>
        <input name="uname" type="hidden" value=${username} />
        <div class="button">
          <input type="submit" value="show password" />
        </div>
      </form>
      <% if(pass!=null){%>
      <div class="title">Your password is : <%=pass %></div><%
		HttpSession session1=request.getSession();
		session1.removeAttribute("username");
		session1.invalidate();
}%>
    </div>
    
  </body>
</html>
    
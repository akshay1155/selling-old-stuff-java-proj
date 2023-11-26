<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Remove item</title>
<link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,
           wght@0,300;0,400;0,500;0,700;1,600&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="form1.css" />
</head>
<body style="background:#e6ffff">
<% 
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://db:3306/jsp","root","root");
String id=request.getParameter("sid");
System.out.println("sid value is :"+id);
PreparedStatement ps=con.prepareStatement("delete from seller where sid=?");
ps.setString(1,id);
int r=ps.executeUpdate();
if(r==0)
out.println("Deletion failure");
else
%>
<div class="input-box">
    	<h1 style="text-align: center;"><b>Your AD has been removed</b></h1>
    	<br><br>
    	<h3 style="text-align: center;">Now you can login</h3>
    	<br><br><br>
    	<form action="myproducts.jsp" method="post" class="cls">
		<div class="button">
			<input type="submit" value="GO TO MYProducts">
		</div>
		</form>
    	
    </div>
<%
con.close();
%>
</body>
</html>
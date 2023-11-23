<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Logout?</title>
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
		response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
		response.setHeader("Pragma", "no-cache");//HTTP 1.0
		response.setHeader("Expires","0");// Proxies
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("login.jsp");
		}
	%> 

    <div class="input-box">
    	<h1 style="text-align: center;"><b>${username}  Are you sure to logout?</b></h1>
    	<br><br>
    	<h3 style="text-align: center;">You will be redirected to login page...</h3>
    	<br><br><br>
    	<form action="Logout" method="post" class="cls">
		<div class="button">
			<input type="submit" value="YES">
			</div>
		</form>
    	<form action="WelcomeRedirect" method="post" class="cls">
    	<div class="button">
			<input type="submit" value="NO">
			</div>
		</form>
		
    	
    	
    </div>
          
</body>
</html>
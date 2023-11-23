<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>success</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,
           wght@0,300;0,400;0,500;0,700;1,600&display=swap"
      rel="stylesheet"/>
    <link rel="stylesheet" href="form1.css" />
</head>
<body style="background:#e6ffff">
    <div class="input-box">
    	<h1 style="text-align: center;"><b>Oops! UserName already exists</b></h1>
    	<br><br>
    	<h3 style="text-align: center;">Try using unique UserName</h3>
    	<br><br><br>
    	<form action="Login" method="post" class="cls">
		<div class="button">
			<input type="submit" value="Go to Registration Page">
		</div>
		</form>
    </div>     
</body>
</html>
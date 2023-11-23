<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
String sid=request.getParameter("unamebuy");
String n=request.getParameter("messg");
String m=request.getParameter("unameseller");
PreparedStatement ps=con.prepareStatement("insert into "+m+"(uname,message) values(?,?)");
ps.setString(1,sid);
ps.setString(2,n);
int r=ps.executeUpdate();
if(r==0)
out.println("failure");
else
{%>
<h2><%=sid %><br/>Your message has been sent to the seller</h2>
<%}
con.close();
%>
</body>
</html>
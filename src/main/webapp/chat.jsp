<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Chat</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,
           wght@0,300;0,400;0,500;0,700;1,600&display=swap"
      rel="stylesheet"/>
      <style>
      .title {
 	 text-align: center;
  	margin: 0 auto 20px;
  	position: relative;
  	line-height: 60px;
  	color: #555;}</style>
  </head>
  <body>
  <% 
String uname=request.getParameter("uname");
//System.out.println(uname);
String sname=request.getParameter("sname");
//System.out.println(sname);
%>
    <div class="header">
      <div class="container" >
        <div class="navbar">
          <div class="logo">
            <a href="index.jsp"><img src="images/logo.png" width="125px" />
              </a>
          </div>
          <nav>
            <ul id=MenuItems">
              <li><a href="index.jsp">Home</a></li>
              <li><a href="products.jsp">Buy</a></li>
              <li><a href="sell.jsp">Sell</a></li>
              <li><a href="myproducts.jsp">My Ads</a></li>
              <li><a href="login.jsp">Account</a></li>
              <%
              if(session.getAttribute("username")!=null)
				{
					%>
					<li><a href="logout.jsp">Logout</a></li>
					<%
				}
              %>
            </ul>
          </nav>
        <!-- chat icon bootstrap cdn -->
        <% 
        if(session.getAttribute("username")!=null)
		{
		%>
          <a href="chat.jsp?uname=${username}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
  				<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/></svg>
		  </a>
		<%
		}
          %>
        </div>

        <div class="row" style="background:#FFFFFF">
          <div class="col-2">
          <%
            Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://db:3306/jsp","root","root");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select distinct uname from "+uname+" ");
			%>
			<div style="width:500px;height:auto;border:1px solid #000;">
			<div><h2 style="color:blue;text-align:center;" class="title">Chat-Inbox</h2></div><br/>
			<% 
			while(rs.next()){
				%>
				<div style="width:auto;height:50px;border:1px solid #000;">
				<a href="chat.jsp?sname=<%=rs.getString("uname") %>&uname=${username}"><h4 style="width: 100px;
								margin-left: auto;
								margin-right: auto;"><%=rs.getString("uname") %></h4></a>
				</div>
				<%
				}
				con.close();
				%>
			</div>
          </div>
          <div class="col-2">
           <div style="width:600px;height:auto;border:1px solid #000;">
            <%
            Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conc=DriverManager.getConnection("jdbc:mysql://db:3306/jsp","root","root");
			Statement stat=conc.createStatement();
			ResultSet ps=stat.executeQuery("select * from "+uname+" where uname='"+sname+"' ");
			%>
			<div><h2 style="color:blue;text-align:center;" class="title"><%= sname!=null ? sname:"Click on any chat" %></h2></div><br/>
			<% 
			while(ps.next()){
				%>
				<div style="width:auto;border:0px solid #000;">
				-><h4 style="max-width: 80%;"><%=ps.getString("message") %></h4>
				</div>
				<%
			}
				%>
				<%
				if(sname!=null){%><div>
            		<form action="aftermessg.jsp" method="post"> 
            			<input type="hidden" name="unameseller" value=<%=sname %>>
            			<input type="hidden" name="unamebuy" value=${username}>
            			 <br/>
            	   		<textarea name="messg" rows="5" cols="50"></textarea>
            	   		<div><button type="submit" class="btn" style="width:250px">Send</button></div>
            		</form>
           		</div><% }%>
				</div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>
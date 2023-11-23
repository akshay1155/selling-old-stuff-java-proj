<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>All Products - RedStore</title>
    <link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,
           wght@0,300;0,400;0,500;0,700;1,600&display=swap"
      rel="stylesheet"/>
      <style>
      .categories-prod {
          margin: 20px 0;
      }
      .row-m {
          justify-content: space-between;
          margin: 20px auto 10px;
      }
      .boxContainer{
		margin:auto;
		position:relative;
		width:300px;
		height:42px;
		border:4px solid #2980b9;
		padding:0px 10px;
		border-radius:50px;
	}
	.elementsContainer{
		width:100%;
		height:100%;
		vertical-align:middle;
	}
	.search{
		border:none;
		height:100%;
		width:100%;
		padding:0px 5px;
		border-radius:50px;
		font-size:18px;
		font-family:"Nunito";
		color:#424242;
		font-weight:500;
	}
	.search:focus{
		outline:none;
	}
      </style>
    
  </head>
  <body>
     <div class="container">
        <div class="navbar">
          <div class="logo">
            <a href="index.jsp"><img src="images/newlogo.png" width="235px" /></a>
          </div>
          <nav>
            <ul id="MenuItems">
              <li><a href="index.jsp">Home</a></li>
              <li><a href="login.jsp">Account</a></li>
              <%if(session.getAttribute("username")!=null){%>
					<li><a href="myproducts.jsp">My Ads</a></li>
					<%}%>
				<li><a href="sell.jsp">Sell</a></li>
              <%if(session.getAttribute("username")!=null){%>
					<li><a href="logout.jsp">Logout</a></li>
			<%}%>
              
            </ul>
          </nav>
          <!-- chat icon bootstrap cdn -->
        <% 
        if(session.getAttribute("username")!=null)
		{
		%>
          <a href="chat.jsp?uname=${username}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
  				<path d="M2.678 11.894a1 1 0 0 1 .287.801 10.97 10.97 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8.06 8.06 0 0 0 8 14c3.996 0 7-2.807 7-6 0-3.192-3.004-6-7-6S1 4.808 1 8c0 1.468.617 2.83 1.678 3.894zm-.493 3.905a21.682 21.682 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a9.68 9.68 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9.06 9.06 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105z"/>
			</svg></a>
				<%
		}
              %>
        </div>
      </div>
    <div>
        <div class="row row-m small-container"">
            <a href="products.jsp"><h2>All Products</h2></a>
            <select>
                <option>Default View</option>
                <option>Sort by price(low to high)</option>
                <option>Sort by price(high to low)</option>
            </select>
        </div>
        <div class="boxContainer">
			<table class="elementsContainer">
			<form action="products.jsp" method="post">
				<tr>
				<td>
					<input type="text" placeholder="Search" class="search" name="search">
				</td>
				<td>
					<input type="submit" name="search" value="search">
				</td>
				</tr>
				</form>
			</table>
		</div>
<%
ResultSet rs;
Connection con;
String sql="select * from seller";
String search=(String)request.getParameter("search");
if(search!=null){
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
	Statement st=con.createStatement();
    rs=st.executeQuery("select * from seller where lower(category)='"+search+"'");
	
}
else{
	Class.forName("com.mysql.cj.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jsp","root","root");
	Statement st=con.createStatement();
	rs=st.executeQuery("select * from seller ");
}

if(rs.next()==false){
%>
	</br>
	<h2 style="text-align: center;"><b>Oops! No Search Results</b></h2>
	</br></br>
    	
<%
}
else{
%>
<div style="display:grid; grid-template-columns: repeat(12,1fr); margin: 10px;"> 
<%
do{
	String imgFileName=rs.getString("imageFileName");
%>
<div class="categories-prod" style="grid-column: auto/span 4;">
      <div class="small-container">
        <div >
            <a href="product-detail.jsp?sid=<%=rs.getString("sid")%> "><img src="images2/<%=imgFileName%>" style="width:340px;height:300px"></a>
			<h3 align="center"><%=rs.getString("category") %> </h3>
			<h3 align="center"> ₹ <%=rs.getString("price") %> </h3>
        </div>
      </div>
    </div>
<%
}while(rs.next());
}

con.close();
%>
    </div>
    </div>
    <!------footer------------->
    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="footer-col-1">
            <h3>Download our App</h3>
            <p>Download App for Android and ios mobile phone.</p>
            <div class="app-logo">
              <img src="images/play-store.png">
              <img src="images/app-store.png">
            </div>
          </div>
          <div class="footer-col-2">
            <img src="images/newlogo.png">
            <p>Our Purpose is to sustainably Make the Pleaure and Benefits of Sports Accesible to the Many.</p>
          </div>
          <div class="footer-col-3">
            <h3>Useful Links</h3>
            <ul>
              <li>Coupons</li>
              <li>Blog Post</li>
              <li>Return Policy</li>
              <li>Join Affiliate</li>
            </ul>
          </div>
          <div class="footer-col-4">
            <h3>Follow us</h3>
            <ul>
              <li>Facebook</li>
              <li>Twitter</li>
              <li>Instagram</li>
              <li>Youtube</li>
            </ul>
          </div>
        </div>
        <hr>
        <p class="copyright">Copyright 2021-Akshay Kumar</p>
      </div>
    </div>
  </body>
</html>

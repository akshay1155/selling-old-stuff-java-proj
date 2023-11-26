<!-- -------To display the Products table ---------- -->
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
<title>My Ads</title>
<link rel="stylesheet" href="table.css" />
<link rel="stylesheet" href="style.css" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,
           wght@0,300;0,400;0,500;0,700;1,600&display=swap"
      rel="stylesheet"/>
</head>
<body>
	<%
		//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
		//response.setHeader("Pragma", "no-cache");//HTTP 1.0
		//response.setHeader("Expires","0");// Proxies
		String ab=(String)(session.getAttribute("username"));
		if(ab==null)
		{
			response.sendRedirect("login.jsp");
		}
	
	%>
	<div class="container">
        <div class="navbar">
          <div class="logo">
           <a href="index.jsp"><img src="images/newlogo.png" width="235px" /></a>
          </div>
          <nav>
            <ul id="MenuItems">
              <li><a href="index.jsp">Home</a></li>
              <li><a href="products.jsp">Buy</a></li>
               <li><a href="sell.jsp">Sell</a></li>
              <li><a href="myproducts.jsp">My Ads</a></li>
              <li><a href="logout.jsp">Logout</a></li>
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
      <hr>
<center>
<div style="background:#e6ffff">
<h2>Welcome ${username}</h2>
<h2>These are the ads you have posted </h2>
<h4><br><b>You can remove the ads if it is sold</b></h4>
</div>
<hr style="border:none;height:1px;background:#dddddd;width:30%">
<div>
<table class="content-table">
<tr>
	<th>Item</th>
	<th>Brand</th>
	<th>Description</th>
	<th>Price</th>
	<th>Seller Name</th>
	<th>Seller PhoneNumber</th>
	<th>Photo</th>
	<th>Remove</th>
</tr>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://db:3306/jsp","root","root");
Statement st=con.createStatement();
System.out.println("First line");
ResultSet rs=st.executeQuery("select * from seller where uname='"+ab+"' ");
if(rs.next()==false){
%>
	</br>
	<h2 style="text-align: center;color: rgba(0,47,52,.64);font-weight: 700;">You haven't listed anything yet</h2>
	</br></br>
	<h3 style="text-align: center;">Let go of what you</br> don't use anymore</h3>
    	</br>
    	 <a href="sell.jsp" class="btn">Sell now</a>
<%
}
else{
do{
	String imgFileName=rs.getString("imageFileName");
%>
<tr>
	<td><%=rs.getString("category") %> </td>
	<td><%=rs.getString("brand") %> </td>
	<td><%=rs.getString("discription") %> </td>
	<td><%=rs.getString("price") %> </td>
	<td><%=rs.getString("sname") %> </td>
	<td><%=rs.getString("phone") %> </td>
	<td><img src="images2/<%=imgFileName%>" style="width:300px;height:350px"></td>
	<td>
		<form action="deleteitem.jsp" method="post">
			<input name="sid" type="hidden" value=<%=rs.getString("sid") %>>
			<button type="submit" class="btn">Remove</button>
		</form>
	</td>
</tr>
<%
}while(rs.next());
%>
</center>
</table>
</div>
<% 
con.close();
}
%>

<!-------Footer-------->
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

<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<title>All Products - RedStore</title>
    	<link rel="stylesheet" href="style.css" />
    	<link rel="preconnect" href="https://fonts.gstatic.com" />
    	<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,
           wght@0,300;0,400;0,500;0,700;1,600&display=swap" rel="stylesheet" />
  </head>
  <body>
  <%
		//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");//HTTP 1.1
		//response.setHeader("Pragma", "no-cache");//HTTP 1.0
		//response.setHeader("Expires","0");// Proxies
		if(session.getAttribute("username")==null)
		{
			response.sendRedirect("login.jsp");
		}
	
	%>
      <div class="container">
        <div class="navbar">
          <div class="logo">
            <img src="images/newlogo.png" width="235px" />
          </div>
          <nav>
            <ul id="MenuItems">
              <li><a href="index.jsp">Home</a></li>
              <li><a href="products.jsp">Buy</a></li>
              <li><a href="sell.jsp">Sell</a></li>
              <li><a href="myproducts.jsp">My Ads</a></li>
              <li><a href="logout.jsp">Logout</a></li>
            </ul>
          </nav><% 
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
      <!-----Account-page----->
      <div class="account-page">
          <div class="container">
              <div class="row">
                  <div class="col-2">
                      <img src="images/24472.jpg" width="100%">
                  </div>
                  <div class="col-2">
                      <div class="form-container" style="background-color:Linen" >
                         <h3 style="">Welcome ${username}<br><hr><br><br>Do you want to sell or buy?<br><br></h3>
                         <br>
                         <a href="sell.jsp" class=btn>Sell</a>
                         <a href="products.jsp" class=btn>Buy</a>
                         <p>Click any one of the buttons</p>
                      </div>  
                  </div>
              </div>
          </div>
      </div>


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
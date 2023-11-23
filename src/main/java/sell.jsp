<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8"%>
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
		if(ab==null)
		{
			response.sendRedirect("login.jsp");
		}
	
	%>
    <div class="container">
      <div class="title">POST YOUR AD</div>
      <form action="SellData" method="post" enctype="multipart/form-data">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" placeholder="Enter your name" name="sname" />
          </div>
          <div class="input-box">
            <span class="details">CHOOSE A CATEGORY</span>
            <select
              name="category"
              id="dropdown"
              style="appearance: none;
              outline: 0;
              background:#00ffff;
              background-image: none;
              width: 100%;
              height: 60%;
              color: black;
              cursor: pointer;
              border:1px solid black;
              border-radius:3px;"">
              <option value="Mobiles">Mobiles</option>
              <option value="Bikes">Bikes</option>
              <option value="Cars">Cars</option>
              <option value="Electronics">Electronics & Appliances</option>
              <option value="Furniture">Furniture</option>
              <option value="Books">Books</option>
              <option value="Others">Others</option>
            </select>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="Enter your Email" name="email" />
          </div>
          <div class="input-box">
            <span class="details">Brand & Details</span>
            <input type="text" placeholder="Details" name="brand"  />
          </div>
          <div class="input-box">
            <span class="details">Phone No.</span>
            <input type="text" placeholder="Enter your number" name="phone" />
          </div>
          <div class="input-box">
            <span class="details">Description</span>
            <input type="text" placeholder=" " name="description" />
          </div>
          <div class="input-box">
            <span class="details">Location</span>
            <input type="text" placeholder="Enter City name" name="location" />
          </div>
          <div class="input-box">
            <span class="details"><b>SET A PRICE</b></span>
            <input type="text" placeholder="Rs." name="price" />
          </div>
            Insert Image:
            <input type="file" name="image">        
        </div>
        <div class="gender-details">
          <input type="radio" name="gender" value="male" id="dot-1" />
          <input type="radio" name="gender" value="female"id="dot-2" />
          <input type="radio" name="gender" value="not" id="dot-3" />
          <span class="gender-title">Gender</span>
          <div class="category">
            <label for="dot-1">
              <span class="dot one"></span>
              <span class="gender">Male</span>
            </label>
            <label for="dot-2">
              <span class="dot two"></span>
              <span class="gender">Female</span>
            </label>
            <label for="dot-3">
              <span class="dot three"></span>
              <span class="gender">Prefer not to say</span>
            </label>
          </div>
        </div>
        <input name="uname" type="hidden" value=${username} />
        <div class="button">
          <input type="submit" value="Post Now" />
        </div>
      </form>
    </div>
    
  </body>
</html>
    
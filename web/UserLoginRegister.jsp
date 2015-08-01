<%-- 
    Document   : UserLoginRegister
    Created on : Jul 13, 2015, 1:21:26 PM
    Author     : nilaymitash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%  boolean check = false;
    String loginId =null;
    String adminEmail =null;
    
    
    if(session.getAttribute("loginId")!= null){
        response.sendRedirect("index.jsp");
    }
    if( session.getAttribute("adminEmail") != null){
        response.sendRedirect("AdminHome.jsp");
    }
    
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MobEx</title>
    <link rel="shortcut icon" href="css/images/favicon.ico" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
    <script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
    <script src="js/jquery-func.js" type="text/javascript"></script>
    <script type="text/javascript">
            function passwordRematch(){
                //Set the colors we will be using ...
                var goodColor = "#66cc66";
                var badColor = "#ff6666";
                var message = document.getElementById("confirmMessage");

                pass1 = document.getElementById("pass1");
                pass2 = document.getElementById("pass2");
                
                if( pass1.value === pass2.value ){
                    pass2.style.backgroundColor = goodColor;
                    message.style.color = goodColor;
                    message.innerHTML = "Passwords Match!";
                }
                else{
                    pass2.style.backgroundColor = badColor;
                    message.style.color = badColor;
                    message.innerHTML = "Passwords Do Not Match!";
                }
            }
            
            function checkForSubmission(){
                pass1 = document.userRegisterForm.userPassword.value;
                pass2 = document.userRegisterForm.userRePassword.value;
                
                if( pass1 === pass2 ){
                    return true;
                }
                else{
                    document.getElementById("confirmMessage").innerHTML="Passwords Do Not Match!";
                    return false;
                }
            }
        </script>
</head>


<body>
<!-- Shell -->
<div class="shell">

  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="index.jsp">mobiex</a></h1>
    
    
    
    
    <!-- Cart -->
    <div id="cart">
        
        
        <%
    
        if(check){
            if(loginId != null){
        %>
            <a href="UserCart.jsp" class="cart-link">Your Cart</a>
        <%
            }
        }%>
            
      <div class="cl">&nbsp;</div>
      <span> <strong></strong></span> &nbsp;&nbsp; <span> <strong></strong></span> </div>
    <!-- End Cart -->
    
    
    
    
    
    
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="support.jsp">Support</a></li>
        <%
    
        if(check){
            if(loginId != null){
        %>
            <li><a href="UserAccountSettings.jsp">My Account</a></li>
        <%
            }
        }%>
        <li><a href="contact.jsp">Contact</a></li>
      </ul>
    </div>
    <!-- End Navigation -->
  
  
  </div><!-- End Header -->
  
  
  
  
  <!-- Main -->
  <div id="main">
    <div class="cl">&nbsp;</div>
    <!-- Content -->
    <div id="content">
     
     
      <!-- Content Slider -->
      <div id="slider" class="box">
        <div id="slider-holder">
          <ul>
            <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/slide2.jpg" alt="" /></a></li>
          </ul>
        </div>
        <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
      </div>
      <!-- End Content Slider -->
      
      
      
      
      
      
      
      
        <!-- Products -->
        
        <h3>User Login</h3>
        <form action="userLogin" method="post" name="userLoginForm">
            <table>
                <tr>
                    <td>User Id/Email</td>
                    <td><input type="text" name="loginId" required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="userPassword" required/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="userLogin" value="Login"/>
                    </td>
                </tr>
            </table>
        </form>
        <br/>
        <hr/>
        <br/>
        <h3>Register Here</h3>
        <form action="userRegister" name="userRegisterForm" method="post" onsubmit="return checkForSubmission()">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Full Name</td>
                        <td><input type="text" name="userName" required/></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="userEmail" required/></td>
                    </tr>
                    <tr>
                        <td>User Id(your login Id)</td>
                        <td><input type="text" name="userId" required/></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="userPassword" id="pass1" required/></td>
                    </tr>
                    <tr>
                        <td>Re enter Password</td>
                        <td><input type="password" name="userRePassword" id="pass2"  onkeyup="passwordRematch(); return false;" required/></td>
                        <td><span id="confirmMessage" class="confirmMessage"></span></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <input type="submit" value="Register" name="userRegister"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        
        
        
      <!-- End Products -->
    
      
      
      
      
    
    
    
    
    
    
    
    
    
    
    
    
    </div>
    <!-- End Content -->
    <!-- Sidebar -->
    <div id="sidebar">
      
      
      
      
      
      
      
      
      
      
      
      
      <!-- Search--> <%@include file="searchheader.jsp" %><!-- End Search -->
      
            
      
      
      
    </div>
    <!-- End Sidebar -->
    <div class="cl">&nbsp;</div>
  </div>
  <!-- End Main -->
  <!-- Side Full -->
  <div class="side-full">
    
    
  </div>
  <!-- End Side Full -->
  
  
  
  
  <!-- Footer -->
  <div id="footer">
    <p class="left">
     	<a href="index.jsp">Home</a> 
    <span>|</span> 
    	<a href="support.jsp">Support</a> 
    <span>|</span> 
    <%
    
        if(check){
            if(loginId != null){
        %>
            <a href="UserAccountSettings.jsp">My Account</a><span>|</span> 
        <%
            }
        }%>
    	
    	<a href="contact.jsp">Contact</a> 
    </p>
    
    <p class="right"> Copyright @ Nilay Mitash 2015</p>
  </div>
  <!-- End Footer -->



</div>
<!-- End Shell -->
<div align=center>&nbsp;</div></body>
</html>

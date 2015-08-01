<%-- 
    Document   : UserAccountSttings
    Created on : Jul 13, 2015, 4:37:33 PM
    Author     : nilaymitash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String loginId = (String)session.getAttribute("loginId");
    
    boolean check = false;
    
    if(session.getAttribute("loginId")!= null){
        check = true;
        loginId = (String)session.getAttribute("loginId");
        //adminEmail = (String)session.getAttribute("adminEmail");
    }
    else{
        response.sendRedirect("UserLoginRegister.jsp");
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
    
     <%
    
        if(check){
            if(loginId != null){
            %>
            <div align="right">
                Welcome, <%=loginId%>
                <img src="getuserimage.jsp?userId=<%=loginId%>" width="25" border="0"/>
            </div>
            <div align="right"><a href="Logout.jsp">Logout</a></div>
            <%
            }
            
        }
        else{
            %>
            <div align="right"><a href="UserLoginRegister.jsp">Login/Register</a></div>
            <div align="right"><a href="AdminLogin.jsp">Administrator Login</a></div>
            <%
        }
        %>
    

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
        <li><a href="UserAccountSettings.jsp" class="active">My Account</a></li>
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
        
        Welcome <%=loginId%>!
            <br/><hr/><br/>
        <img src="getuserimage.jsp?userId=<%=loginId%>" width="115" border="1"/>
        
        <h3>Change Photo</h3>
        <form action="uploadUserImage" name="uploaduserimageForm" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    
                    <td colspan="2"><input type="hidden" name="loginId" value="<%=loginId%>" /></td>
                </tr>
                <tr>
                    <td>Choose Image</td>
                    <td><input type="file" accept="image/*" name="userImage" size="25"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="uploadImage" value="Upload"/>
                    </td>
                </tr>
                
            </table>
        </form>
         <br/><hr/><br/>
        <h3>Update Address</h3>
        <form action="updateuseraddress" name="updateaddressForm" method="post">
            <table>
                <tr>
                    
                    <td colspan="2"><input type="hidden" name="loginId" value="<%=loginId%>" /></td>
                </tr>
                <tr>
                    <td>Street Address Line1*</td>
                    <td><input type="text" name="line1" required/></td>
                </tr>
                <tr>
                    <td>Street Address Line2</td>
                    <td><input type="text" name="line2" /></td>
                </tr>
                <tr>
                    <td>City*</td>
                    <td><input type="text" name="city" required></td>
                </tr>
                <tr>
                    <td>State*</td>
                    <td><input type="text" name="state" required></td>
                </tr>
                <tr>
                    <td>Country*</td>
                    <td><input type="text" name="country" required></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="updateAddress" value="Update"/>
                    </td>
                </tr>
                
            </table>
        </form>
                
            <br/><hr/><br/>    
                <h3>Update Contact Number</h3>
        <form action="updateusercontact" name="updatecontactForm" method="post">
            <table>
                <tr>
                    
                    <td colspan="2"><input type="hidden" name="loginId" value="<%=loginId%>" /></td>
                </tr>
                <tr>
                    <td>Contact Number</td>
                    <td>
                        <input type="text" name="countryCode" maxlength="3" size="3"/> - 
                        <input type="text" name="contactNum" maxlength="10" size="10"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="updateContact" value="Update"/>
                    </td>
                </tr>
                
            </table>
        </form>
                <br/><hr/><br/>
                
                <h3>Update Password</h3>
                
                
        <form action="updateUserPassword" name="updatepasswordForm" method="post" onsubmit="return checkForSubmission()">
            <table>
                <tr>
                    
                    <td colspan="2"><input type="hidden" name="loginId" value="<%=loginId%>" /></td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td><input type="password" name="userPassword" id="pass1"/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td>
                        <input type="password" name="confirmuserPassword" id="pass2" onkeyup="passwordRematch(); return false;"/>
                        <span id="confirmMessage" class="confirmMessage"></span>
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="updateAddress" value="Update"/>
                        
                    </td>
                </tr>
                
            </table>
        </form>
                <br/><hr/><br/>
                <h3>Your Orders</h3>
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

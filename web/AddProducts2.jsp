<%-- 
    Document   : AddProducts2
    Created on : Jul 11, 2015, 1:59:43 PM
    Author     : nilaymitash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String adminEmail=null;
    boolean check = false;
    
    if(session.getAttribute("adminEmail")==null){
        response.sendRedirect("AdminLogin.jsp");
    }
    else{
     adminEmail=(String)session.getAttribute("adminEmail");
     check = true;
    }
    
    String phoneId = (String)session.getAttribute("phoneId");
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
</head>


<body>
<!-- Shell -->
<div class="shell">
    
     <%
    
        if(check){
            if(adminEmail != null){
            %>
            <div align="right">
                Welcome, <%=adminEmail%>
                
            </div>
            <div align="right"><a href="Logout.jsp">Logout</a></div>
            <%
            }
            
        }
        
        %>
    

  <!-- Header -->
  <div id="header">
    <h1 id="logo"><a href="index.jsp">mobiex</a></h1>
    
    
    
    
    <!-- Cart -->
    <div id="cart">
        
        
        <%
    
        %>
            
      <div class="cl">&nbsp;</div>
      <span> <strong></strong></span> &nbsp;&nbsp; <span> <strong></strong></span> </div>
    <!-- End Cart -->
    
    
    
    
    
    
    <!-- Navigation -->
    <div id="navigation">
      <ul>
        <li><a href="AdminHome.jsp">Home</a></li>
        <li><a href="support.jsp">Support</a></li>
        <%
    
        if(check){
            if(adminEmail != null){
        %>
        <li><a href="AdminAccountSettings.jsp">My Account</a></li>
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
        
        <h3>Details added to the database. Add Photo for the phone</h3>
        <br/><hr/><br/>
        
        <form action="uploadPhoneImage" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Phone ID </td>
                    <td><%=phoneId%><input type="hidden" name="phoneId" value="<%=phoneId%>" /></td>
                </tr>
                <tr>
                    <td>Phone Image</td>
                    <td><input type="file" accept="image/*" name="phoneImage" size="25"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="uploadImage" value="Upload"/>
                    </td>
                </tr>
                
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
            if(adminEmail != null){
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

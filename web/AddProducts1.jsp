<%-- 
    Document   : AddProducts1
    Created on : Jul 11, 2015, 1:59:31 PM
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
        <h3>STEP 1</h3>
        <form name="addproducts1form" action="uploadphonedetails" method="post">
            <table>
                <tr>
                    <td>Phone ID</td>
                    <td><input type="text" name="phoneId" required/></td>
                </tr>
                <tr>
                    <td>Phone Company</td>
                    <td><input type="text" name="phoneCompany" required/></td>
                </tr>
                <tr>
                    <td>Phone Name</td>
                    <td><input type="text" name="phoneName" required/></td>
                </tr>
                <tr>
                    <td>Phone Category</td>
                    <td>
                    <select name="phoneCategory" required>
                        <option value="default">Category</option>
                        <option value="ancient">Ancient Phones</option>
                        <option value="multimedia">Multi Media</option>
                        <option value="smartphone">Smart Phones</option>
                        <option value="tablet">Tabs</option>
                        <option value="smartwatch">Smart Watches</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>Quantity(integer)</td>
                    <td><input type="number" name="phoneQty" required/></td>
                </tr>
                 
                <tr>
                    <td>Phone Summary</td>
                    <td><textarea name="phoneSummary" style="resize:none" rows="5" cols="25"></textarea></td>
                </tr>
                <tr>
                    <td>Phone Tags</td>
                    <td><input type="text" name="phoneTags"/></td>
                </tr>
                
                
                <tr>
                    <td>Screen Size</td>
                    <td><input type="text" name="screenSize"/></td>
                </tr>
                <tr>
                    <td>Processor</td>
                    <td><input type="text" name="processor"/></td>
                </tr>
                <tr>
                    <td>ROM</td>
                    <td><input type="text" name="rom"/></td>
                </tr>
                <tr>
                    <td>RAM</td>
                    <td><input type="text" name="ram"/></td>
                </tr>
                <tr>
                    <td>Primary Camera</td>
                    <td><input type="text" name="priCamera"/></td>
                </tr>
                <tr>
                    <td>Secondary Camera</td>
                    <td><input type="text" name="secCamera"/></td>
                </tr>
                <tr>
                    <td>Operating System</td>
                    <td><input type="text" name="os"/></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price" required/></td>
                </tr>
                
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="submit" value="Next"/>
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

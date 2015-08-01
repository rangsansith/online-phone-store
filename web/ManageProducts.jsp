<%-- 
    Document   : ManageProducts
    Created on : Jul 11, 2015, 12:36:10 AM
    Author     : nilaymitash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
    <script>
            function confirmDelete(){
                var check = confirm("Do you want to delete this product?");
                
                if(check === true){
                    return true;
                }
                else{
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
        <h3>Add Product:</h3>
        <a href="AddProducts1.jsp">Add</a>
        
        <br/><hr/><br/>
       
        
        
        <h3>View Product</h3><!--Provide the whole product table in a dynamic way-->
        
        
        <table border="1">
            
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Company</th>
                <th>Phone ID</th>
                <th>Qty</th>
                <th>Category</th>
                <th>Summary</th>
                <th>Tags</th>
                <th>Screen Size</th>
                <th>ROM</th>
                <th>RAM</th>
                <th>Processor</th>
                <th>Primary Camera</th>
                <th>Secondary Camera</th>
                <th>Operating System</th>
                <th>Price</th>
            </tr>
            
            <%  Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonestore", "root", "");
            PreparedStatement st = con.prepareStatement("select * from phone");

            ResultSet rs = st.executeQuery();
            while(rs.next()){

                String phoneId = rs.getString("phone_id");
                String phoneName = rs.getString("phone_name");
                String phoneCategory = rs.getString("phone_category");
                int phoneQty = rs.getInt("phone_qty");
                String phoneCompany = rs.getString("phone_Company");
                String screenSize = rs.getString("screen_size");
                String processor = rs.getString("phone_processor");
                String rom = rs.getString("phone_ROM");
                String ram = rs.getString("phone_RAM");
                String priCam = rs.getString("pri_cam");
                String secCam = rs.getString("sec_cam");
                String summary = rs.getString("phone_summary");
                double price = rs.getDouble("phone_price");
                String os = rs.getString("phone_os");
                String tags = rs.getString("phone_tags");
    
            %>
            <tr>
                <td><img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="115" border="0"/></td>
                <td><%=phoneName%></td>
                <td><%=phoneCompany%></td>
                <td><%=phoneId%></td>
                <td><%=phoneQty%></td>
                <td><%=phoneCategory%></td>
                <td><%=summary%></td>
                <td><%=tags%></td>
                <td><%=screenSize%></td>
                <td><%=rom%></td>
                <td><%=ram%></td>
                <td><%=processor%></td>
                <td><%=priCam%></td>
                <td><%=secCam%></td>
                <td><%=os%></td>
                <td><%=price%></td>
                <td>
                    <form name="phonedeleteform" action="deletephone" method="post" onsubmit="return confirmDelete()">
                        <input type="hidden" name="phoneId" value="<%=phoneId%>"/>
                        <input type="hidden" name="phoneName" value="<%=phoneName%>"/>
                        <input type="submit" name="delete" value="Delete"/>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            
        </table>
        
        <br/><hr/><br/>

        <h3>Update Product Image</h3>
        <form action="uploadPhoneImage" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>
                       Phone Id 
                    </td>
                    <td>
                        <input type="text" name="phoneId"/>
                    </td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" accept="image/*" name="phoneImage" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="imageupdate" value="Update"/>
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

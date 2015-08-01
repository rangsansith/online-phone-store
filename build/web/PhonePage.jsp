<%-- 
    Document   : PhonePage
    Created on : Jul 13, 2015, 7:53:35 PM
    Author     : nilaymitash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String phoneId=null;
    if(request.getParameter("phoneId")!= null)
        phoneId = request.getParameter("phoneId");
    else
        response.sendRedirect("index.jsp");
    
    String phoneCompany=null;
    String phoneName=null;
    String phoneCategory=null;
    int phoneQty=0;
    String phoneSummary=null;
    String phoneTags=null;
    String screenSize=null;
    String processor=null;
    String rom=null;
    String ram=null;
    String priCamera=null;
    String secCamera=null;
    String os=null;
    double price=0.00;
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonestore", "root", "");
    
    PreparedStatement st = con.prepareStatement("SELECT * FROM phone WHERE phone_id=?");
    st.setString(1, phoneId);
    ResultSet rs = st.executeQuery();
    if(rs.next()){
        phoneCompany = rs.getString("phone_company");
        phoneName = rs.getString("phone_name");
        phoneCategory = rs.getString("phone_category");
        phoneQty = rs.getInt("phone_qty");
        phoneSummary = rs.getString("phone_summary");
        phoneTags = rs.getString("phone_tags");
        screenSize = rs.getString("screen_size");
        processor = rs.getString("phone_processor");
        rom = rs.getString("phone_ROM");
        ram = rs.getString("phone_RAM");
        priCamera = rs.getString("pri_cam");
        secCamera = rs.getString("sec_cam");
        os = rs.getString("phone_os");
        price = rs.getDouble("phone_price");
    }
    
    String loginId=null;
    boolean check = false;
    if(session.getAttribute("loginId")!=null){
        loginId = (String)session.getAttribute("loginId");
        check = true;
    }
    
%>




<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%  //boolean check = false;
    //String loginId =null;
    String adminEmail =null;
    
//    String phoneId="";
//    String phoneName="";
//    String phoneCompany="";
    Double phonePrice=0.0;
//    String phoneSummary="";
//    int phoneQty=0;
    
    
    
    
    if(session.getAttribute("loginId")!= null || session.getAttribute("adminEmail") != null){
        check = true;
        loginId = (String)session.getAttribute("loginId");
        adminEmail = (String)session.getAttribute("adminEmail");
    }
    
    
    Class.forName("com.mysql.jdbc.Driver");
    
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
            if(loginId != null){
            %>
            <div align="right">
                Welcome, <%=loginId%>
                <img src="getuserimage.jsp?userId=<%=loginId%>" width="25" border="0"/>
            </div>
            <div align="right"><a href="Logout.jsp">Logout</a></div>
            <%
            }
            if(adminEmail != null){
            %>
            <div align="right">Welcome, <%=adminEmail%></div>
            <div align="right"><a href="AdminHome.jsp">Admin Home</a></div>
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
      
      
      
      <!--Phone details-->
      
      <table width="60%">
          <tr>
              <td rowspan="6"><h3><img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="200" border="1"/></h3></td>
              
          </tr>
          <tr>
              <td><h3>Company: <%=phoneCompany%></h3></td>
          </tr>
          <tr>
              <td><h3>Name: <%=phoneName%></h3></td>
          </tr>
          <tr>
              <td><h3>Price: $<%=price%></h3></td>
          </tr>
          <tr>
              <td><h3>
                  <%
                if(phoneQty>0){
            %>
             Available in Stock<br>
             <%
                if(loginId != null){
             %>
             <form action="addtocart" method="post" name="addtocartform">
                <input type="hidden" name="loginId" value="<%=loginId%>"/>
                <input type="hidden" name="phoneId" value="<%=phoneId%>"/>
                <input type="number" name="phoneQty" min="1" max="10" value="1"/>
                <input type="submit" name="addtocart" value="Add to Cart"/>
             </form>
             <%
                }
             %>
             
            <%
                }
                else{
            %>
            Sold Out. Not Available
            <%
                
                }
            %>
                  </h3></td>
          </tr>
          <tr>
              <td><h3>Summary: <%=phoneSummary%></h3></td>
          </tr>
      </table>
      
      
      
        <div>
            <h2>Specifications:</h2>
            <table width="60%"  cellspacing="20">
                <tr>
                    <th><h2>Name</h2></th>
                    <td><h2><%=phoneName%></h2></td>
                </tr>
                <tr>
                    <th><h2>Screen</h2></th>
                    <td><h2><%=screenSize%></h2></td>
                </tr>
                <tr>
                    <th><h2>RAM</h2></th>
                    <td><h2><%=ram%></h2></td>
                </tr>
                <tr>
                    <th><h2>ROM</h2></th>
                    <td><h2><%=rom%></h2></td>
                </tr>
                <tr>
                    <th><h2>Processor</h2></th>
                    <td><h2><%=processor%></h2></td>
                </tr>
                <tr>
                    <th><h2>Primary Camera</h2></th>
                    <td><h2><%=priCamera%></h2></td>
                </tr>
                <tr>
                    <th><h2>Secondary Camera</h2></th>
                    <td><h2><%=secCamera%></h2></td>
                </tr>
                <tr>
                    <th><h2>Operating System</h2></th>
                    <td><h2><%=os%></h2></td>
                </tr>
            </table>
        </div>
        
        <div>
            <%
            if(loginId != null){
            %>
            <form name="addreviewForm" action="review" method="post">
                <input type="hidden" name="loginId" value="<%=loginId%>"/>
                <input type="hidden" name="phoneId" value="<%=phoneId%>"/>
                <textarea name="review" style="resize:none" rows="5" cols="40"></textarea>
                <input type="submit" value="Add Review"/>
            </form>
            <%
            }
            %>
        </div>
        
        
        <div>
            <%
            String username=null;
            String review=null;
            
            String userId=null;
            
            
            PreparedStatement stRev = con.prepareStatement("SELECT * FROM review WHERE phone_id=?");
            stRev.setString(1, phoneId);
            ResultSet rsRev = stRev.executeQuery();
            while(rsRev.next()){
                //get login id from review table and fetch corresponding user data: name
                userId = rsRev.getString("login_id");
                review = rsRev.getString("review");
                
                PreparedStatement stUser = con.prepareStatement("SELECT * FROM userdetails WHERE user_id=?");
                stUser.setString(1, userId);
                ResultSet rsUser = stUser.executeQuery();
                if(rsUser == null){
                    PreparedStatement stUser1 = con.prepareStatement("SELECT * FROM userlogin WHERE user_email=?");
                    stUser1.setString(1,userId);
                    ResultSet rsUser1 = stUser1.executeQuery();
                    while(rsUser1.next()){
                        userId = rsUser1.getString("user_id");
                        PreparedStatement stUser2 = con.prepareStatement("SELECT * FROM userdetails WHERE user_id=?");
                        stUser2.setString(1, userId);
                        ResultSet rsUser2 = stUser2.executeQuery();
                        while(rsUser2.next()){
                            username = rsUser2.getString("user_name");
            %>
                    
                    <table cellspacing="10">
                        <tr>
                            <td><div style="text-align:center; height:20px; width:200px; color:#FFF; background-color: #8b0000; font-size:20px;"><%=username%></div></td>
                        </tr>
                        
                        <tr>
                            <td><div style=" width:200px; color:#FFF; background-color: #b84d4d; font-size:16px;"><%=review%></div></td>
                        </tr>
                    </table>
                    
                    
            <%
                        }
                    }
                }
                else{
                    while(rsUser.next()){
                        username = rsUser.getString("user_name");
            %>
                    
                    
                    <table cellspacing="10">
                        <tr>
                            <td><div style="text-align:center; height:20px; width:200px; color:#FFF; background-color: #8b0000; font-size:20px;"><%=username%></div></td>
                        </tr>
                        
                        <tr>
                            <td><div style=" width:200px; color:#FFF; background-color: #b84d4d; font-size:16px;"><%=review%></div></td>
                        </tr>
                    </table>
                    
                    
                    
            <%
                    }
                }
            
            }
            %>
        </div>
      
      
      
      
      
      <!--End Phone details-->
      
      
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

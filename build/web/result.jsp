<%-- 
    Document   : result
    Created on : Jul 26, 2015, 2:49:12 AM
    Author     : nilaymitash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="phonestore.other.DB_Conn" id="dbconn" scope="session"/>
<%
    boolean check = false;
    String loginId =null;
    String adminEmail =null;
    
    
    if(session.getAttribute("loginId")!= null || session.getAttribute("adminEmail") != null){
        check = true;
        loginId = (String)session.getAttribute("loginId");
        adminEmail = (String)session.getAttribute("adminEmail");
    }
    
    
    
    
    String category = request.getParameter("phoneCategory");
    String searchKeyword = request.getParameter("searchKeyword");
    
    if(category==null && searchKeyword==null){
        response.sendRedirect("index.jsp");
    }
    
    
    Connection con = dbconn.getConnection();
    if(category == "default"){}
    
    if(category == "ancient" || category == "multimedia" || category == "smartphone" || category == "tablet" || category == "smartwatch"){
        PreparedStatement st1 = con.prepareStatement("SELECT * FROM phone WHERE phone_category=?");
        st1.setString(1, category);
        
        ResultSet rs1 = st1.executeQuery(); //do further coding for category search
    }
    
    
    PreparedStatement st = con.prepareStatement("SELECT * FROM phone WHERE phone_name LIKE ? OR phone_tags LIKE ?");
    st.setString(1, "%"+searchKeyword+"%");
    st.setString(2, "%"+searchKeyword+"%");
     
            
    ResultSet rs = st.executeQuery();
    
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
        <li><a href="index.jsp" class="active">Home</a></li>
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
      <div class="products">
        <div class="cl">&nbsp;</div>
        <ul>
        
            
            
            
        <%
        int counter=0;
        
        
            while(rs.next()){
                String phoneId = rs.getString("phone_id");
                String phoneName = rs.getString("phone_name");
                String phoneCompany = rs.getString("phone_company");
                double phonePrice = rs.getDouble("phone_price");
                String phoneSummary = rs.getString("phone_summary");
                    if(phoneSummary==""){phoneSummary="Summary not available";}
                int phoneQty = rs.getInt("phone_qty");
        %>
        
        
            <li> <a href="PhonePage.jsp?phoneId=<%=phoneId%>"><img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="200" border="0"/></a>
            <div class="product-info">
              <h3><%=phoneCompany%> <%=phoneName%></h3>
              <div class="product-desc">
                <h4><%
                    if(phoneQty>0){
                    %>
                    <a href="AddToCart.jsp?phoneId=<%=phoneId%>">Add to cart</a>
                    <%}
                    else{%>
                    
                    Sold Out
                    <%}%></h4>
                <p><%=phoneSummary%></p>
                <strong class="price">$<%=phonePrice%></strong> </div>
            </div>
          </li>
          <%
          counter++;
          while(counter==4){%>
             <br> 
         <%
              counter=1;
          }
        }
        %>
          
          
        </ul>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Products -->
      <%
            while(rs.next()){
                String phoneId = rs.getString("phone_id");
                String phoneName = rs.getString("phone_name");
                double phonePrice = rs.getDouble("phone_price");
                String phoneSummary = rs.getString("phone_summary");
                int phoneQty = rs.getInt("phone_qty");

        %>
        
        <div align="center">
        <table border="1">
            <tr>
                <td rowspan="3">
                    <a href="PhonePage.jsp?phoneId=<%=phoneId%>">
                    <img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="115" border="0"/>
                    </a>
                </td>
                <td colspan="2"><%=phoneName%></td>
            </tr>
            <tr>
                <td><%=phonePrice%></td>
                <td>
                    <%
                    if(phoneQty>0){
                    %>
                    <a href="AddToCart.jsp?phoneId=<%=phoneId%>">Add to cart</a>
                    <%}
                    else{%>
                    
                    Sold Out
                    <%}%>
                </td>
            </tr>
            <tr>
                <td colspan="2"><%=phoneSummary%></td>
            </tr>
        </table>
        </div>
            <br>
        <%
        }
        %>
    
      
      
      
      
    
    
    
    
    
    
    
    
    
    
    
    
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

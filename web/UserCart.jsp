<%-- 
    Document   : UserCart
    Created on : Jul 22, 2015, 5:43:32 PM
    Author     : nilaymitash
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="dbconn" class="phonestore.other.DB_Conn" scope="session"/>

<%
    String loginId="";
    
    String phoneId="";
    int phoneCartQty=0;
    int cartId=0;
    
    String phoneName="";
    double phonePrice=0.0;
    
    double productPrice=0.0;
    double totalPrice=0.0;
    
    boolean check = false;
    
    if(session.getAttribute("loginId")!= null){
        loginId = (String)session.getAttribute("loginId");
        check=true;
    }
    else{
        response.sendRedirect("index.jsp");
    }
    
    Connection con = dbconn.getConnection();
    PreparedStatement st = con.prepareStatement("SELECT * FROM cart_items WHERE login_id=? AND purchased=?");
    st.setString(1, loginId);
    st.setString(2, "NO");
    
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
        <li><a href="UserAccountSettings.jsp" >My Account</a></li>
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
        
        <table border="0" cellspacing="15">
            <tr>
                <th colspan="2">
                    <h2> Product</h2>
                </th>
                <th>
                    <h2>Unit Price</h2>
                </th>
                <th>
                    <h2>Quantity</h2>
                </th>
                <th>
                    <h2>Total</h2>
                </th>
            </tr>
            <%
        
       //array to carry product id to reciept page:
        
        //String[] productIdArray = new String[n];
        ArrayList<String> productIdArray = new ArrayList<String>();
        
        //array to carry product qty in cart to reciept page:
        
        //int[] productQtyCart = new int[n];
        ArrayList<Integer> productQtyCart = new ArrayList<Integer>();
        
        
            
            ResultSet rs = st.executeQuery();
            
            while(rs.next()){
                
                phoneId = rs.getString("phone_id");
                phoneCartQty = rs.getInt("phone_qty");
                cartId = rs.getInt("cart_items_id");
                
                productIdArray.add(phoneId);
                productQtyCart.add(phoneCartQty);
                
                PreparedStatement st1 = con.prepareStatement("SELECT * FROM phone WHERE phone_id=?");
                st1.setString(1, phoneId);
                ResultSet rs1 = st1.executeQuery();
                while(rs1.next()){
                    phoneName = rs1.getString("phone_name");
                    phonePrice = rs1.getDouble("phone_price");
                    
                    productPrice = phoneCartQty*phonePrice;
                    
                    totalPrice += productPrice;
                    
                    
            %>
            <tr>
                <td><img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="40" border="0"/></td>
                <td><%=phoneName%></td>
                <td>$ <%=phonePrice%></td>
                <td><%=phoneCartQty%></td>
                <td>$ <%=productPrice%></td>
                <td>
                    <form name="deletecartitem" method="post" action="deleteitem">
                        <input type="hidden" value="<%=cartId%>" name="cartId"/>
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
            <%
                }
            }
            session.setAttribute("cartitems", productIdArray);
            session.setAttribute("cartitemqty", productQtyCart);
            %>
            <tr>
                <td  colspan="4" align="right">Total Price</td>
                <td align="right">$ <%=totalPrice%></td>
            </tr>
        </table>
        
            <div align="center">
                <a href="Checkout.jsp">Proceed to Checkout</a>
            </div>
        
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

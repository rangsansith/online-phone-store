<%-- 
    Document   : AddToCart
    Created on : Jul 21, 2015, 8:36:17 PM
    Author     : nilaymitash
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="phonestore.other.DB_Conn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String loginId = null;
    String phoneId = request.getParameter("phoneId");
    //boolean flag = false; //used for db transaction check
    int defaultPhoneQty = 1;
    
    int phoneQty=0; //actual quantity of phones
    int newPhoneQty=0;
    
    
    if(session.getAttribute("loginId") == null){
        response.sendRedirect("UserLoginRegister.jsp");
    }
    else{
        loginId = (String)session.getAttribute("loginId");
        
        DB_Conn db = new DB_Conn();
        Connection con = db.getConnection();
        
        //add phoneId userID and quantity to cart table
        PreparedStatement st = con.prepareStatement("INSERT INTO cart_items (login_id, phone_id, phone_qty) values(?,?,?)");
        st.setString(1, loginId);
        st.setString(2, phoneId);
        st.setInt(3, defaultPhoneQty);
        
        int row = st.executeUpdate();
        if(row>0){
            //decrease the quantity of products in the database
                
                PreparedStatement st1 = con.prepareStatement("SELECT phone_qty FROM phone WHERE phone_id=?");
                st1.setString(1, phoneId);
                ResultSet rs = st1.executeQuery();
                while(rs.next()){
                    phoneQty = rs.getInt("phone_qty");
                    
                    newPhoneQty = phoneQty - defaultPhoneQty;
                    
                    //update the new phone quantity:
                    PreparedStatement st2 = con.prepareStatement("UPDATE phone SET phone_qty=? WHERE phone_id=?");
                    st2.setInt(1, newPhoneQty);
                    st2.setString(2, phoneId);
                    
                    int row1 = st2.executeUpdate();
                    if(row1>0){
                        out.print("Item added to cart");
                        response.sendRedirect("index.jsp");
                    }
                }
            
        }
        else{
            out.println("Item not added to cart");
            response.sendRedirect("index.jsp");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
        <h1>Add to Cart</h1>
        <%=phoneId%>+<%=defaultPhoneQty%>
    </body>
</html>

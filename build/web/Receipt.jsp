<%-- 
    Document   : Reciept
    Created on : Jul 25, 2015, 7:42:03 PM
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
    
    
    String phoneName="";
    double phonePrice=0.0;
    
    double productPrice=0.0;
    double totalPrice=0.0;
    
    if(session.getAttribute("loginId")!= null){
        loginId = (String)session.getAttribute("loginId");
    }
    else{
        response.sendRedirect("index.jsp");
    }
    
    
    
    Connection con = dbconn.getConnection();
    
    
    
    //get userdetails for the bill
    String name=null;
    String address=null;
    String contactNum=null;
    
    PreparedStatement st2 = con.prepareStatement("SELECT * FROM userdetails WHERE user_id=?");
    st2.setString(1, loginId);
    
    PreparedStatement st3 = con.prepareStatement("SELECT user_id FROM userlogin WHERE user_email=?");
    st3.setString(1, loginId);
    
    ResultSet rs2=st2.executeQuery();
    if(rs2.next()){
        name=rs2.getString("user_name");
        address = rs2.getString("user_address");
        contactNum = rs2.getString("user_mob_num");
    }
    else{
        ResultSet rs3 = st3.executeQuery();
        if(rs3.next()){
            String userId = rs3.getString("user_id");
            st2.setString(1, userId);
            ResultSet rs4 = st2.executeQuery();
            
            if(rs4.next()){
                name=rs2.getString("user_name");
                address = rs2.getString("user_address");
                contactNum = rs2.getString("user_mob_num");
            }
        }
    }
    
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phone Store Order Receipt</title>
    </head>
    <body>
        <div align="center"><img src="css/images/logo.png" width="250"/></div>
        <h1>Order Successful, Here is your order receipt!</h1>
        <table>
            <tr>
                <td><%=name%></td>
                
            </tr>
            <tr>
                <td><%=contactNum%></td>
               
            </tr>
            <tr>
                 <td><%=address%></td>
            </tr>
        </table>
        
        <table border="1" align="center" width="90%">
            <tr>
                <th colspan="2">
                    Product
                </th>
                <th>
                    Unit Price
                </th>
                <th>
                    Quantity
                </th>
                <th>
                    Total
                </th>
            </tr>
            <%
            ArrayList<String> productIdArray = (ArrayList<String>)session.getAttribute("cartitems");
            ArrayList<Integer> productQty = (ArrayList<Integer>)session.getAttribute("cartitemqty");
            
            for(int i=0; i<productIdArray.size(); i++){
                phoneId = productIdArray.get(i);
                phoneCartQty = productQty.get(i);
                
                PreparedStatement ps = con.prepareStatement("SELECT * FROM phone WHERE phone_id=?");
                ps.setString(1, phoneId);
                ResultSet psrs = ps.executeQuery();
                while(psrs.next()){
                    phoneName = psrs.getString("phone_name");
                    phonePrice = psrs.getDouble("phone_price");
                    
                    productPrice = phoneCartQty*phonePrice;
                    
                    totalPrice += productPrice;
                    %>
            <tr align="center">
                <td><img src="getphoneimage.jsp?phoneId=<%=phoneId%>" width="50" border="0"/></td>
                <td><%=phoneName%></td>
                <td>$ <%=phonePrice%></td>
                <td><%=phoneCartQty%></td>
                <td>$ <%=productPrice%></td>
            </tr>
            <%
                } 
                
            }
            %>
           
            <tr>
                <td colspan="5" align="right">$ <%=totalPrice%></td>
            </tr>
        </table>
            
            <div align="center"><input type="submit" value="print" onClick="window.print()" /></div>
    </body>
</html>

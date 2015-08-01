<%-- 
    Document   : getuserimage
    Created on : Jul 14, 2015, 7:28:14 PM
    Author     : nilaymitash
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="userimage" class="phonestore.other.GetUserImage" scope="session"/>

<%  Class.forName("com.mysql.jdbc.Driver");
    String userId;
    Connection con = null;        

    if(request.getParameter("userId") != null){
        userId = request.getParameter("userId");
        
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonestore", "root", "");
            
            //get the image from the database
            byte[] imgData = userimage.getImage(con, userId);
            
            //display the image
            response.setContentType("image/jpeg");
            OutputStream o = response.getOutputStream();
            o.write(imgData);
            o.flush();
            o.close();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
        finally{
            con.close();
        }
    }
    
    
    
%>
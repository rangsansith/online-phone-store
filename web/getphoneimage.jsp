<%-- 
    Document   : viewadminphone
    Created on : Jul 11, 2015, 11:03:02 PM
    Author     : nilaymitash
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="image" class="phonestore.other.GetImage" scope="session"/>

<%  Class.forName("com.mysql.jdbc.Driver");
    String phoneId;
    Connection con = null;        

    if(request.getParameter("phoneId") != null){
        phoneId = request.getParameter("phoneId");
        
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonestore", "root", "");
            
            //get the image from the database
            byte[] imgData = image.getImage(con, phoneId);
            
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
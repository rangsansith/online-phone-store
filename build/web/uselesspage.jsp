<%-- 
    Document   : AddProducts3
    Created on : Jul 11, 2015, 2:25:43 PM
    Author     : nilaymitash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String phoneCompany = request.getParameter("phoneCompany");
    String phoneName = request.getParameter("phoneName");
    String phoneCategory = request.getParameter("phoneCategory");
    String phoneQty = request.getParameter("phoneQty"); //int
    String phoneSummary = request.getParameter("phoneSummary");
    String phoneTags = request.getParameter("phoneTags");
    String screenSize = request.getParameter("screenSize");
    String processor = request.getParameter("processor");
    String rom = request.getParameter("rom");
    String ram = request.getParameter("ram"); //int
    String priCamera = request.getParameter("priCamera");
    String secCamera = request.getParameter("secCamera");
    String os = request.getParameter("os");
    String price = request.getParameter("price");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>FINAL STEP</h3>
        <form action="uploadphone" method="post" enctype="multipart/form-data">
            <table>
                <tr>
                    <td>Image</td>
                    <td><input type="file" accept="image/*" name="phoneImage" size="50"/></td>
                </tr>
                <tr>
                    <td><input type="submit" name="upload" value="Upload"/></td>
                </tr>
            </table>
            
            
            
            <br><br><br><br>
            
            <%=phoneCompany%><br>
            <%=phoneName%><br>
            <%=phoneCategory%><br>
            <%=phoneQty%><br>
            <%=phoneSummary%><br>
            <%=phoneTags%><br>
            <%=screenSize%><br>
            <%=processor%><br>
            <%=rom%><br>
            <%=ram%><br>
            <%=priCamera%><br>
            <%=secCamera%><br>
            <%=os%><br>
            <%=price%><br>
        </form>
    </body>
</html>

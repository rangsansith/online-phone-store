<%-- 
    Document   : Checkout
    Created on : Jul 25, 2015, 7:27:01 PM
    Author     : nilaymitash
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String loginId=(String)session.getAttribute("loginId");
    
//    if(loginId==null)
//        response.sendRedirect("UserLoginRegister.jsp");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>checkout</title>
    </head>
    <body>
        <form name="checkoutForm" action="checkout" method="post">
            <table>
                <tr>
                    <td>Card Number</td>
                    <td>
                        <input type="text" size="4" maxlength="4" name="card1"/>-<input type="text" size="4" maxlength="4" name="card2"/>-<input type="text" size="4" maxlength="4" name="cart3"/>-<input type="text" size="4" maxlength="4" name="cart4"/>
                    </td>
                </tr>
                <tr>
                    <td>CVV</td>
                    <td><input type="text" size="3" maxlength="3" name="cvv"></td>
                </tr>
                <tr>
                    <td>Name on Card</td>
                    <td><input type="text" name="nameoncard"></td>
                </tr>
            <input type="hidden" name="loginId" value="<%=loginId%>">
            <tr><td colspan="2" align="center"><input type="submit" name="checkout" value="Pay"></td></tr>
            </table>
        </form>
    </body>
</html>

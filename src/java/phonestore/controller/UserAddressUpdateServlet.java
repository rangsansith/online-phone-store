/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phonestore.model.User;

/**
 *
 * @author nilaymitash
 */
public class UserAddressUpdateServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String line1 = req.getParameter("line1");
        String line2 = req.getParameter("line2");
        if(line2==null){line2="";}
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String country = req.getParameter("country");
        
        
        String loginId = req.getParameter("loginId");
        String userAddress = line1+", "+line2+", "+city+", "+state+", "+country;
            
        User user = new User();
        
        boolean check = user.updateUserAddress(loginId, userAddress);
        
        if(check){
            out.println("<h3>Address Updated</h3>");
            out.println("<a href=\"UserAccountSettings.jsp\">Account settings</a>");
        }
        else{
            out.println("<h3>Address NOT Updated</h3>");
            out.println("<a href=\"UserAccountSettings.jsp\">Account settings</a>");
        }
    }
    
}

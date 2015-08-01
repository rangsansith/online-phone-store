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
public class UserContactUpdateServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String countryCode = req.getParameter("countryCode");
        String contactNum = req.getParameter("contactNum");
        
        String loginId = req.getParameter("loginId");
        String userMob = countryCode+"-"+contactNum;
        
        User user = new User();
        
        boolean check = user.updateUserContact(userMob, loginId);
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        if(check){
            out.println("<h3>Contact Number Updated</h3>");
            out.println("<a href=\"UserAccountSettings.jsp\">Account settings</a>");
        }
        else{
            out.println("<h3>Contact Number NOT Updated</h3>");
            out.println("<a href=\"UserAccountSettings.jsp\">Account settings</a>");
        }
    }
    
}

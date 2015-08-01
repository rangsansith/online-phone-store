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
public class UserPasswordUpdateServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginId = req.getParameter("loginId");
        String password = req.getParameter("userPassword");
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        User user = new User();
        
        boolean check = user.updateUserPassword(loginId, password);
        
        if(check){
            out.println("<h3>Password Updated</h3>");
            out.println("<a href=\"UserAccountSettings.jsp\">Account settings</a>");
        }
        else{
            out.println("<h3>Password NOT Updated</h3>");
            out.println("<a href=\"UserAccountSettings.jsp\">Account settings</a>");
        }
    }
    
}

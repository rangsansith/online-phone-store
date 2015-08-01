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
public class UserRegisterServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String userName = req.getParameter("userName");
        String userEmail = req.getParameter("userEmail");
        String userPassword = req.getParameter("userPassword");
        String userId = req.getParameter("userId");
        
        User user = new User(userId, userEmail, userPassword, userName);
       
        boolean check = user.registerUser();
        
        if(check){
            out.println("<h2>USER CREATED</h2>");
            out.println("<a href=\"UserLoginRegister.jsp\">Got to Login Page</a>");
        }
        else{
            out.println("<h2>USER ALREADY EXISTS</h2>");
            out.println("<a href=\"UserLoginRegister.jsp\">Go to Registration Page</a>");
        
        }
    }
    
}

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
import javax.servlet.http.HttpSession;
import phonestore.model.User;

/**
 *
 * @author nilaymitash
 */
public class UserLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        
        String loginId = req.getParameter("loginId");
        String userPassword = req.getParameter("userPassword");
        
        User user = new User();
        boolean check = user.checkUserLogin(loginId, userPassword);
        
        
        
        if(check){
            session.setAttribute("loginId", loginId);
            resp.sendRedirect("index.jsp");
        }
        else{
            out.print("Login Failed");
        }
        
    }
    
}

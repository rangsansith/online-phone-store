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
import phonestore.model.Admin;

/**
 *
 * @author nilaymitash
 */
public class AdminLoginServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adminEmail = req.getParameter("adminEmail");
        String adminPassword = req.getParameter("adminPassword");
        
        HttpSession session = req.getSession();
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        Admin admin = new Admin(adminEmail, adminPassword);
        boolean check = admin.checkAdminLogin();
        
        if(check){
            session.setAttribute("adminEmail", adminEmail);
            resp.sendRedirect("AdminHome.jsp");
            
        }
        else{
            resp.sendRedirect("index.jsp");
        }
    }
    
}

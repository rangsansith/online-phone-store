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
import phonestore.model.Admin;

/**
 *
 * @author nilaymitash
 */
public class AdminChangePassServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        
        String adminEmail = req.getParameter("adminEmail");
        String adminPassword = req.getParameter("adminPassword");
        String newAdminPassword = req.getParameter("newAdminPassword");
        
        Admin admin = new Admin(adminEmail, adminPassword);
        
        boolean check = admin.changePass(newAdminPassword);
        if(check){
            out.println("Password Changed");
            out.println("<a href=\"AdminHome.jsp\">Go Home</a>");
        }
        else{
            out.println("Password Not Changed");
            out.println("<a href=\"AdminHome.jsp\">Go Home</a>");
        }
    }
    
}

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
import phonestore.model.Products;

/**
 *
 * @author nilaymitash
 */
public class DeleteProductServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String phoneId = req.getParameter("phoneId");
        String phoneName = req.getParameter("phoneName");
        
        boolean check = new Products().deletePhone(phoneId, phoneName);
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        if(check){
            out.println("<h3 align=\"center\">Phone record found and deleted</h3>");
            resp.sendRedirect("ManageProducts.jsp");
        }
        else{
            out.println("<h3 align=\"center\">Phone record not found</h3>");
        }
    }
    
}

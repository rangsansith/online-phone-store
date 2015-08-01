/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phonestore.model.Products;
/**
 *
 * @author nilaymitash
 */
public class PhoneDetailsUploadDBServlet extends HttpServlet {
    Connection con;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get values of text fields other than multipart
        String phoneId = req.getParameter("phoneId");
        String phoneCompany = req.getParameter("phoneCompany");
        String phoneName = req.getParameter("phoneName");
        String phoneCategory = req.getParameter("phoneCategory");
        
            String phoneQ = req.getParameter("phoneQty");
            int phoneQty = Integer.parseInt(phoneQ);
            //int phoneQty = 10;
            
            
        String phoneSummary = req.getParameter("phoneSummary");
        String phoneTags = req.getParameter("phoneTags");
        String screenSize = req.getParameter("screenSize");
        String processor = req.getParameter("processor");
        String rom = req.getParameter("rom");
        String ram = req.getParameter("ram");
        String priCamera = req.getParameter("priCamera");
        String secCamera = req.getParameter("secCamera");
        String os = req.getParameter("os");
        
            String pr =req.getParameter("price");
            double price = Double.parseDouble(pr);
        
        /*InputStream inputStream = null; //input stream of the upload
        
        //obtains the upload file part in this multipart request
        Part filePart = req.getPart("phoneImage");
        
        if(filePart !=null){
            //prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            
            //obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }*/
        
        Products products = new Products(phoneId, phoneCompany, phoneName, phoneCategory, phoneQty, phoneSummary, phoneTags, screenSize, processor, rom, ram, priCamera, secCamera, os, price);
        
        boolean check = products.uploadProducts();
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        HttpSession session = req.getSession();
        
        if(check){
            
            session.setAttribute("phoneId", phoneId);
            resp.sendRedirect("AddProducts2.jsp");
        }
        else{
            out.println("<center>");
            out.println("<h3>Product Not Uploaded. Try Again</h3>");
            out.println("<a href=\"ManageProducts.jsp\">Manage Products</a>");
            out.println("</center>");
        }
    }
    
    
}

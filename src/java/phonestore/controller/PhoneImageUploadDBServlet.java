/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import phonestore.model.Products;

/**
 *
 * @author nilaymitash
 */

@MultipartConfig(maxFileSize = 16177215) //upload file's size up to 16MB

public class PhoneImageUploadDBServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String phoneId = req.getParameter("phoneId");
        
        InputStream inputStream = null; //input stream of the upload
        
        //obtains the upload file part in this multipart request
        Part filePart = req.getPart("phoneImage");
        
        if(filePart !=null){
            //prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            
            //obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
        Products products = new Products(phoneId, inputStream);
        
        boolean check = products.uploadProductImage();
        
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        if(check){
            out.println("<center>");
            out.println("<h3>SUCCESS: Product Image Uploaded.</h3>");
            out.println("<a href=\"ManageProducts.jsp\">Manage Products</a>");
            out.println("<a href=\"AdminHome.jsp\">Home</a>");
            out.println("</center>");
        }
        else{
            out.println("<center>");
            out.println("<h3>ERROR: Product Image Not Uploaded. Try Again</h3>");
            out.println("<a href=\"ManageProducts.jsp\">Manage Products</a>");
            out.println("<a href=\"AdminHome.jsp\">Home</a>");
            out.println("</center>");
        }
        
        
        out.println(phoneId);
        out.println(inputStream);
    }
    
    
}

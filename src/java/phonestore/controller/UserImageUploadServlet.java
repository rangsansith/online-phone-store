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
import phonestore.model.User;

/**
 *
 * @author nilaymitash
 */

@MultipartConfig(maxFileSize = 16177215) //upload file's size up to 16MB

public class UserImageUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginId = req.getParameter("loginId");
        InputStream inputStream = null;
        
        //obtains the upload file part in this multipart request
        Part filePart = req.getPart("userImage");
        
        if(filePart !=null){
            //prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            
            //obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        
        User user = new User();
        boolean check = user.setUserImage(loginId, inputStream);
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        if(check){
            resp.sendRedirect("UserAccountSettings.jsp");
            out.println("<h3>Image Uploaded Successfully</h3>");
            out.println("<a href=\"UserAccountSettings.jsp\">Manage Account</a>");
        }
        else{
            out.println("<h3>ERROR: Image Not Uploaded</h3>");
            out.println("<a href=\"UserAccountSettings.jsp\">Manage Account</a>");
        }
    }
    
}

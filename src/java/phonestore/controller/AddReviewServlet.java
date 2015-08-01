/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phonestore.model.Review;

/**
 *
 * @author nilaymitash
 */
public class AddReviewServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginId = req.getParameter("loginId");
        String phoneId = req.getParameter("phoneId");
        String review = req.getParameter("review");
        
//        if(review==null || review==""){
//            resp.sendRedirect("PhonePage.jsp?phoneId="+phoneId);
//        }
        
        Review rev = new Review(phoneId, loginId, review);
        boolean check = rev.saveReview();
        
        if(check){
            resp.sendRedirect("PhonePage.jsp?phoneId="+phoneId);
        }
        else{
            resp.sendRedirect("PhonePage.jsp?phoneId="+phoneId);
        }
    }
    
}

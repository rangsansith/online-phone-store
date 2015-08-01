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
import phonestore.model.Cart;

/**
 *
 * @author nilaymitash
 */
public class AddtoCartServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String loginId=req.getParameter("loginId");
        String phoneId=req.getParameter("phoneId");
        
        int phoneQty;
        try{
            phoneQty= Integer.parseInt(req.getParameter("phoneQty"));
        }
        catch(Exception ex){
            phoneQty = 1;
        }
        
        Cart cart = new Cart(phoneId, loginId, phoneQty);
        
        boolean check = cart.addtoCart();
        
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        if(check){
            out.println("Item added to cart");
            out.println("<a href=\"index.jsp\">continue shopping</a>");
        }
        else{
            out.println("Sorry! Item could not be added to cart");
            out.println("<a href=\"index.jsp\">continue shopping</a>");
        }
    }
    
}

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
public class CheckoutServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        
        String loginId = req.getParameter("loginId");
        
        Cart cart = new Cart();
        boolean check = cart.checkout(loginId);
        if(check)
            resp.sendRedirect("Receipt.jsp");
        else
            out.println("Checkout failed <a href=\"UserCart.jsp\">Go to Cart</a>");
    }
    
}

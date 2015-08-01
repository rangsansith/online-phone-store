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
import phonestore.model.Cart;

/**
 *
 * @author nilaymitash
 */
public class DeleteCartItemServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cartId = Integer.parseInt(req.getParameter("cartId"));
        
        Cart cart = new Cart();
        boolean check = cart.deleteCartItem(cartId);
        
        if(check){
            resp.sendRedirect("UserCart.jsp");
        }
        else{
            resp.sendRedirect("UserCart.jsp");
        }
    }
    
}

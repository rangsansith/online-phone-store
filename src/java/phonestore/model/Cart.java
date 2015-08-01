/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import phonestore.other.DB_Conn;

/**
 *
 * @author nilaymitash
 */
public class Cart {
    String phoneId;
    String loginId;
    int phoneCartQty;
    
    int phoneQty=0; //actual quantity of phones
    int newPhoneQty=0;
    
    boolean check = false;
    Connection con;

    public Cart() {
    }

    public Cart(String phoneId, String loginId, int phoneCartQty) {
        this.phoneId = phoneId;
        this.loginId = loginId;
        this.phoneCartQty = phoneCartQty;
    }
    
    public boolean addtoCart(){
        con = new DB_Conn().getConnection();
        
        try{
            PreparedStatement st = con.prepareStatement("INSERT INTO cart_items (login_id, phone_id, phone_qty) values(?,?,?)");
            st.setString(1, loginId);
            st.setString(2, phoneId);
            st.setInt(3, phoneCartQty);

            int row = st.executeUpdate();
            if(row>0){
                //decrease the quantity of products in the database
                
                PreparedStatement st1 = con.prepareStatement("SELECT phone_qty FROM phone WHERE phone_id=?");
                st1.setString(1, phoneId);
                ResultSet rs = st1.executeQuery();
                while(rs.next()){
                    phoneQty = rs.getInt("phone_qty");
                    
                    newPhoneQty = phoneQty - phoneCartQty;
                    
                    //update the new phone quantity:
                    PreparedStatement st2 = con.prepareStatement("UPDATE phone SET phone_qty=? WHERE phone_id=?");
                    st2.setInt(1, newPhoneQty);
                    st2.setString(2, phoneId);
                    
                    int row1 = st2.executeUpdate();
                    if(row1>0){
                        check = true;
                    }
                }
                
                
            }else{
                check=false;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
    
    public boolean checkout(String loginId){
        Connection con = new DB_Conn().getConnection();
        int cartId=0;
        try{
            PreparedStatement st = con.prepareStatement("SELECT * FROM cart_items WHERE login_id=? AND purchased=?");
            st.setString(1, loginId);
            st.setString(2, "NO");
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                cartId = rs.getInt("cart_items_id");
                
                PreparedStatement st1 = con.prepareStatement("UPDATE cart_items SET purchased=? WHERE cart_items_id=? ");
                st1.setString(1, "YES");
                st1.setInt(2, cartId);
                
                int row = st1.executeUpdate();
                if(row>0){
                    check=true;
                }
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return check;
    }
    
    public boolean deleteCartItem(int cartId){
        con = new DB_Conn().getConnection();
        try{
            PreparedStatement st = con.prepareStatement("DELETE FROM cart_items WHERE cart_items_id=?");
            st.setInt(1, cartId);
            
            int row = st.executeUpdate();
            if(row>0){
                check = true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
}

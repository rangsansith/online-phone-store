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
public class Admin {
    private String adminEmail;
    private String adminPassword;
    Connection con;
    boolean check = false;

    /**
     * @return the adminEmail
     */
    public String getAdminEmail() {
        return adminEmail;
    }

    /**
     * @param adminEmail the adminEmail to set
     */
    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    /**
     * @return the adminPassword
     */
    public String getAdminPassword() {
        return adminPassword;
    }

    /**
     * @param adminPassword the adminPassword to set
     */
    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public Admin() {
    }

    public Admin(String adminEmail, String adminPassword) {
        this.adminEmail = adminEmail;
        this.adminPassword = adminPassword;
    }
    
    public boolean checkAdminLogin(){
        try{
            con = new DB_Conn().getConnection();
        
            PreparedStatement st = con.prepareStatement("select * from admin where admin_email=? and admin_password=?");
            st.setString(1, adminEmail);
            st.setString(2, adminPassword);

            ResultSet rs = st.executeQuery();

            if(rs.next()){
                check = true;
            }
            else{
                check = false;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
    
    public boolean changePass(String newAdminPassword){
        try{
            con = new DB_Conn().getConnection();
        
            PreparedStatement st = con.prepareStatement("UPDATE admin SET admin_password=? WHERE admin_email=? AND admin_password=?");
            st.setString(1, newAdminPassword);
            st.setString(2, adminEmail);
            st.setString(3, adminPassword);

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

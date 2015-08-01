/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import phonestore.other.DB_Conn;

/**
 *
 * @author nilaymitash
 */
public class User {
    String userId;
    String userEmail;
    String userPassword;
    String userName;
    String userMob;
    String userAddress;
    String userGender;
    InputStream inputStream;
    
    boolean check = false;
    Connection con;
    
    public User() {
    }

    public User(String userId, String userEmail, String userPassword, String userName) {
        this.userId = userId;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userName = userName;
    }
    
    public User(String userId, String userEmail, InputStream inputStream){
        this.userId = userId;
        this.userEmail = userEmail;
        this.inputStream = inputStream;
    }
    
    public boolean registerUser(){
        con = new DB_Conn().getConnection();
        
        try{
            //first check for duplicate values
            PreparedStatement st = con.prepareStatement("SELECT * FROM userlogin WHERE user_id=? AND user_email=?");
            st.setString(1, userId);
            st.setString(2, userEmail);
            
            PreparedStatement st1 = con.prepareStatement("SELECT * FROM userdetails WHERE user_id=?");
            st1.setString(1, userId);
            
            ResultSet rs = st.executeQuery();
            ResultSet rs1 = st1.executeQuery();
            
            
            if(rs.next() || rs1.next()){
                check = false;
            }
            else{
                PreparedStatement st2 = con.prepareStatement("INSERT INTO userdetails(user_id, user_name) VALUES(?,?)");
                st2.setString(1, userId);
                st2.setString(2, userName);
                
                PreparedStatement st3 = con.prepareStatement("INSERT INTO userlogin(user_id, user_email, user_password) VALUES(?,?,?)");
                st3.setString(1, userId);
                st3.setString(2, userEmail);
                st3.setString(3, userPassword);
                
                int row1 = st2.executeUpdate();
                int row2 = st3.executeUpdate();
                
                if(row1>0 && row2>0){
                    check = true;
                }
            
            }
            
            
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
    
    
    public boolean setUserImage(String loginId, InputStream inputStream){
        con = new DB_Conn().getConnection();
        
        
        try{
            PreparedStatement st = con.prepareStatement("UPDATE userdetails SET user_img=? WHERE user_id=?");
            st.setBlob(1, inputStream);
            st.setString(2, loginId);
            
            int row = st.executeUpdate();
            
            if(row>0){
                check = true;
            }
            else{
                //if loginId is not user_id then loginId must be user_email; get user_id from user_email then set image for user_id
                
                PreparedStatement st1 = con.prepareStatement("SELECT user_id FROM userlogin WHERE user_email=?");
                st1.setString(1, loginId);
                
                ResultSet rs = st1.executeQuery();
                if(rs.next()){
                    loginId = rs.getString("user_id");
                    setUserImage(loginId, inputStream);
                }
                else{
                    check = false;
                }
            }
            
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
    
    
    
    public boolean checkUserLogin(String loginId, String userPassword){
        con = new DB_Conn().getConnection();
        
        try{
            PreparedStatement st = con.prepareStatement("SELECT * FROM userlogin WHERE user_id=? AND user_password=?");
            st.setString(1, loginId);
            st.setString(2, userPassword);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                check = true;
            }
            else{
                PreparedStatement st1 = con.prepareStatement("SELECT * FROM userlogin WHERE user_email=? AND user_password=?");
                st1.setString(1, loginId);
                st1.setString(2, userPassword);
                ResultSet rs1 = st1.executeQuery();
                if(rs1.next()){
                    check = true;
                }
                else{
                    check = false;
                }
            }
            
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
    
    public boolean updateUserContact(String userMob, String loginId){
        con = new DB_Conn().getConnection();
        
        try{
            PreparedStatement st = con.prepareStatement("UPDATE userdetails SET user_mob_num=? WHERE user_id=?");
            st.setString(1, userMob);
            st.setString(2, loginId);
            
            int row = st.executeUpdate();
            
            if(row>0){
                check = true;
            }
            else{
                //if loginId is not user_id then loginId must be user_email; get user_id from user_email then set contact num for user_id
                
                PreparedStatement st1 = con.prepareStatement("SELECT user_id FROM userlogin WHERE user_email=?");
                st1.setString(1, loginId);
                
                ResultSet rs = st1.executeQuery();
                if(rs.next()){
                    loginId = rs.getString("user_id");
                    updateUserContact(userMob, loginId);
                }
                else{
                    check = false;
                }
            }
            
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
    
    public boolean updateUserAddress(String loginId, String userAddress){
        
        System.out.println(userAddress);
        
        
        con = new DB_Conn().getConnection();
        
        try{
            PreparedStatement st = con.prepareStatement("UPDATE userdetails SET user_address=? WHERE user_id=?");
            st.setString(1, userAddress);
            st.setString(2, loginId);
            
            int row = st.executeUpdate();
            
            if(row>0){
                check = true;
            }
            else{
                //if loginId is not user_id then loginId must be user_email; get user_id from user_email then set contact num for user_id
                
                PreparedStatement st1 = con.prepareStatement("SELECT user_id FROM userlogin WHERE user_email=?");
                st1.setString(1, loginId);
                
                ResultSet rs = st1.executeQuery();
                if(rs.next()){
                    loginId = rs.getString("user_id");
                    updateUserContact(loginId, userAddress);
                }
                else{
                    check = false;
                }
            }
            
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
    
    public boolean updateUserPassword(String loginId, String userPassword){
        con = new DB_Conn().getConnection();
        
        try{
            PreparedStatement st = con.prepareStatement("UPDATE userlogin SET user_password=? WHERE user_email=?");
            st.setString(1, userPassword);
            st.setString(2, loginId);
            
            int row = st.executeUpdate();
            
            if(row>0){
                check = true;
            }
            else{
                //if loginId is not user_email then loginId must be user_id; 
                
                PreparedStatement st1 = con.prepareStatement("UPDATE userlogin SET user_password=? WHERE user_id=?");
                st1.setString(1, userPassword);
                st1.setString(2, loginId);
                
                int row1 = st1.executeUpdate();
            
                if(row1>0){
                    check = true;
                }
                
            }
            
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        
        return check;
    }
}

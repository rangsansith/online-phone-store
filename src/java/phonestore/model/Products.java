/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import phonestore.other.DB_Conn;

/**
 *
 * @author nilaymitash
 */
public class Products {
    String phoneId;
    String phoneCompany;
    String phoneName;
    String phoneCategory;
    int phoneQty;
    String phoneSummary;
    String phoneTags;
    String screenSize;
    String processor;
    String rom;
    String ram;
    String priCamera;
    String secCamera;
    String os;
    double price;
    InputStream inputStream;
    
    Connection con;
    //String message;
    boolean check = false;
    
    public Products(){}
    
    public Products(String phoneId, String phoneCompany, String phoneName, String phoneCategory, int phoneQty, String phoneSummary, String phoneTags, String screenSize, String processor, String rom, String ram, String priCamera, String secCamera, String os, double price) {
        this.phoneId = phoneId;
        this.phoneCompany = phoneCompany;
        this.phoneName = phoneName;
        this.phoneCategory = phoneCategory;
        this.phoneQty = phoneQty;
        this.phoneSummary = phoneSummary;
        this.phoneTags = phoneTags;
        this.screenSize = screenSize;
        this.processor = processor;
        this.rom = rom;
        this.ram = ram;
        this.priCamera = priCamera;
        this.secCamera = secCamera;
        this.os = os;
        this.price = price;
        //this.inputStream = inputStream;
    }
    
    public boolean uploadProducts(){
        con = new DB_Conn().getConnection();
        
        try{
            String sql = "INSERT INTO phone (phone_id, phone_company, phone_name, phone_category, phone_qty, phone_summary, phone_tags, screen_size, phone_processor, phone_ROM, phone_RAM, pri_cam, sec_cam, phone_os, phone_price) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1,phoneId);
            st.setString(2, phoneCompany);
            st.setString(3, phoneName);
            st.setString(4, phoneCategory);
            st.setInt(5, phoneQty);
            st.setString(6, phoneSummary);
            st.setString(7, phoneTags);
            st.setString(8, screenSize);
            st.setString(9, processor);
            st.setString(10, rom);
            st.setString(11, ram);
            st.setString(12, priCamera);
            st.setString(13, secCamera);
            st.setString(14, os);
            st.setDouble(15, price);
            
            /*if(inputStream !=null){
                //fetches input stream of the upload file for the blob column
                st.setBlob(16, inputStream);
            }
            */
            
            int row = st.executeUpdate();
            
            if(row>0){
                check=true;
            }
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        
        return check;
    }
    
    
    public Products(String phoneId, InputStream inputStream){
        this.phoneId = phoneId;
        this.inputStream = inputStream;
    }
    
    public boolean uploadProductImage(){
        con = new DB_Conn().getConnection();
        
        try{
            String sql = "UPDATE phone SET phone_img=? WHERE phone_id=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setBlob(1, inputStream);
            st.setString(2, phoneId);
            
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
    
    public boolean deletePhone(String phoneId, String phoneName){
        this.phoneId = phoneId;
        this.phoneName = phoneName;
        
        con = new DB_Conn().getConnection();
        try{
            PreparedStatement st = con.prepareStatement("DELETE FROM phone WHERE phone_id=? AND phone_name=?");
            st.setString(1, phoneId);
            st.setString(2, phoneName);
            
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

















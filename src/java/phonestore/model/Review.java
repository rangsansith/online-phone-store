/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import phonestore.other.DB_Conn;

/**
 *
 * @author nilaymitash
 */
public class Review {
    private String phoneId;
    private String loginId;
    private String review;
    
    Connection con;
    boolean check = false;
    

    public Review() {
    }

    public Review(String phoneId, String loginId, String review) {
        this.phoneId = phoneId;
        this.loginId = loginId;
        this.review = review;
    }

    /**
     * @return the phoneId
     */
    public String getPhoneId() {
        return phoneId;
    }

    /**
     * @param phoneId the phoneId to set
     */
    public void setPhoneId(String phoneId) {
        this.phoneId = phoneId;
    }

    /**
     * @return the loginId
     */
    public String getLoginId() {
        return loginId;
    }

    /**
     * @param loginId the loginId to set
     */
    public void setLoginId(String loginId) {
        this.loginId = loginId;
    }

    /**
     * @return the review
     */
    public String getReview() {
        return review;
    }

    /**
     * @param review the review to set
     */
    public void setReview(String review) {
        this.review = review;
    }
    
    public boolean saveReview(){
        con = new DB_Conn().getConnection();
        try{
            PreparedStatement st = con.prepareStatement("INSERT INTO review (phone_id, login_id, review) values(?,?,?)");
            st.setString(1, phoneId);
            st.setString(2, loginId);
            st.setString(3, review);
            
            int row = st.executeUpdate();
            if(row>0){check = true;}
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        
        return check;
    }
}

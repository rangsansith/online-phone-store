/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.other;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author nilaymitash
 */
public class GetUserImage {
    //Get the blob
    public static byte[] getImage(Connection con, String userId) throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        //con = DriverManager.getConnection("jdbc:mysql://localhost:3306/phonestore", "root", "");
        
        Blob img;
        byte[] imgData = null;
        
        PreparedStatement st = con.prepareStatement("Select user_img from userdetails where user_id=?");
        st.setString(1, userId);
        
        ResultSet rs = st.executeQuery();
        while(rs.next()){
            img = rs.getBlob("user_img");
            imgData = img.getBytes(1, (int)img.length());
        }
        
        return imgData;
    }
}

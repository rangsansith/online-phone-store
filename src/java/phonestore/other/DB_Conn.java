/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phonestore.other;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author nilaymitash
 */
public class DB_Conn {
    
    Connection con;
    
    public Connection getConnection(){
        String db = "jdbc:mysql://localhost:3306/phonestore";
        String user = "root";
        String password = "";
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(db, user, password);
            
        }
        catch(ClassNotFoundException| SQLException ex){
            ex.printStackTrace();
        }
        
        return con;
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import  java.sql.*;


/**
 *
 * @author Admin
 */
public class MyDatabaseManager {
    private static Connection c;
    private static Statement s;
    
    private static String host, port, dbName, dbUser, dbPassword;
    
    
    public static void connectDB()
    {
        try {
            host = "localhost";
            port = "3306";
            dbUser = "root";
            dbName = "csdl_j2ee";
            dbPassword = "";
            String dbPath = "jdbc:mysql://" + host + ":" + port + "/"
                + dbName;
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = (Connection) DriverManager.getConnection(dbPath, dbUser, dbPassword);
            s = c.createStatement();
            
            System.out.println("Connectedd");
        } catch (Exception ex) {
            System.out.print(ex.getMessage());
        }
    }
    public static Connection getConnection()
    {
        return c;
    }
    //run sql
    public static ResultSet doReadQuery(String sql) {
        ResultSet rs = null;
        
        try {
            rs = s.executeQuery(sql);
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabaseManager.class.getName())
                    .log(Level.SEVERE, null, ex);
        }
        return rs;
    }

    

    //test connection
//    public static void main(String[] args) throws ClassNotFoundException {
//        MyDatabaseManager.connectDB();
//        
//    }
}

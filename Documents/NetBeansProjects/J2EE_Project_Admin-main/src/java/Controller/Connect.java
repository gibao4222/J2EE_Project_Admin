package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */
import static java.lang.System.out;
import  java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
public class Connect {
    public static Connection con;
    public Statement stmt;
    //Mở kết nối DB
    public void openConnection(){
        try {
            String conStr = "jdbc:mysql://localhost:3306/csdl_j2ee";
            String username="root";String password="";
            con=null;
            stmt=null;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(conStr,username,password);
            stmt = (Statement) con.createStatement();
        } catch (Exception e) {
            System.out.println("Error:"+e);
        }
    }
    
    //Đọc DB
    public ResultSet doReadQuery(String sql){
        ResultSet rs = null;
        try {
            rs=stmt.executeQuery(sql);
        } catch (Exception e) {
            Logger.getLogger(Connect.class.getName()).log(Level.SEVERE,null,e);
        }
        return rs;
    }
//    public static void main(String[] args) {
//        Connect c = new Connect();
//        c.openConnection();
//        if(con!=null)
//            System.out.println("Con");
//    }
}

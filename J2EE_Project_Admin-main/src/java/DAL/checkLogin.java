/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Locale;
import model.CustomerModel;

/**
 *
 * @author Thanhchan
 */
public class checkLogin  extends MyDatabaseManager{
     Locale locale = new Locale("en", "EN");
    public checkLogin() {

        checkLogin.connectDB();
    }
   public CustomerModel check(String email,String password)  {
          CustomerModel ps = new CustomerModel();
         try {
                 
            
        String query = "SELECT * FROM account where email LIKE '%"+email+"%' AND password LIKE '%"+password+"%'";
        ResultSet rs = checkLogin.doReadQuery(query);
       

        if (rs.next()) {
            CustomerDAL c = new CustomerDAL();
            ps = c.findCustomer(rs.getString("idPerson"));
        }
        
         } catch (Exception e) {
             System.out.println(e);
             }
        return ps;
    }
    public int checkaccount(String email)  {
           int kq=0;
           try{
        String query = "SELECT * FROM account WHERE email  LIKE '%"+email+"%'";
       
        ResultSet rs = AccountDAL.doReadQuery(query);
          if (rs.next()) {
              kq=1;
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return kq;
    }
     public static void main(String[] args) {
        checkLogin c = new checkLogin();
        CustomerModel cus =c.check("thanhchan791@gmail.com", "1234567");
        System.out.print(cus.getIdCustomer());
        
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.util.Locale;
import model.AccountModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Thanhchan
 */
public class AccountDAL extends MyDatabaseManager{
    public AccountDAL() {

        AccountDAL.connectDB();
    }
    public int insertaccount(AccountModel ps){
          int result = 0;
          try{
        String query = "Insert account (idAccount,idPerson,email, password,status) VALUES (?,?,?,?,?)";
        PreparedStatement p = AccountDAL.getConnection().prepareStatement(query);
        p.setString(1, ps.getIdAccount());
        p.setString(2, ps.getIdPerson());
        p.setString(3, ps.getEmail());
        p.setString(4, ps.getPassword());
        p.setInt(5, ps.getStatus());

       
                                        
        result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
     public int checktk(String email)  {
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
         
        AccountDAL ac = new AccountDAL();
       
       int kq = ac.checktk("b@gmail.com");
        System.err.println(kq);
    }
}

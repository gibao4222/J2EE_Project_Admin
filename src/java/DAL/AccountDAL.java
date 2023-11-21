/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.AccountModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author Admin
 */
public class AccountDAL extends MyDatabaseManager{
    public AccountDAL(){
    AccountDAL.connectDB();
    }
        public ArrayList readAccount(){
        ArrayList<AccountModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM account";
            ResultSet rs =AccountDAL.doReadQuery(query);
            if(rs!=null){
                 while (rs.next()) {                     
                    AccountModel account = new AccountModel();
                    account.setIdAccount(rs.getString("idAccount"));
                    account.setIdPerson("idPerson");
                    account.setEmail(rs.getString("email"));
                    account.setPassword("password");
                    account.setStatus("status");
                   list.add(account);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
        public AccountModel searchAccount(String idStaff){
            AccountModel account = new AccountModel();
            try{
            
            String query ="SELECT * FROM account WHERE idPerson='"+idStaff+"'";
            ResultSet rs = AccountDAL.doReadQuery(query);
            if(rs!=null){
                 while (rs.next()) {                     
                    account.setIdAccount(rs.getString("idAccount"));
                    account.setIdPerson(rs.getString("idPerson"));
                    account.setEmail(rs.getString("email"));
                    account.setPassword(rs.getString("password"));
                    account.setStatus(rs.getString("status"));
 
                 }
             }
            }catch(Exception e) {
            e.printStackTrace();
        }return account;
        }
//     Thêm Tài khoản //
     public int addAccount(AccountModel account) {
         int rs = 0;
         try {
              String query = "INSERT INTO account ( idAccount ,idPerson , email , password , status) "
                 + " VALUES (?,?,?,?,?);";
                PreparedStatement p = AccountDAL.getConnection().prepareStatement(query);
                p.setString(1, account.getIdAccount());
                p.setString(2, account.getIdPerson());
                p.setString(3, account.getEmail());
                p.setString(4, account.getPassword());
                p.setString(5,account.getStatus());            
                rs = p.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }               
     return rs;
     }
//     update account //
    
    public int updateAccount(AccountModel account){
        int rs = 0;
        try {
            String query = "UPDATE account  "
                    + "SET idAccount  = ?,idPerson =? , email =? , password =? , status = ? "
                    + "WHERE account.idAccount = ?";
              PreparedStatement p = AccountDAL.getConnection().prepareStatement(query);
               p.setString(1, account.getIdAccount());
                p.setString(2, account.getIdPerson());
                p.setString(3, account.getEmail());
                p.setString(4, account.getPassword());
                p.setString(5,account.getStatus());
                p.setString(6, account.getIdAccount());
               
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
//    delete account //
        public int deleteAccount(String idAccount){
        int rs = 0;
        try {
            String query = "DELETE FROM account WHERE idAccount = ?";
            PreparedStatement p = AccountDAL.getConnection().prepareStatement(query);
            p.setString(1, idAccount);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
        public int deleteAccountByIdStaff(String idStaff){
        int rs = 0;
        try {
            String query = "DELETE FROM account WHERE idPerson = ?";
            PreparedStatement p = AccountDAL.getConnection().prepareStatement(query);
            p.setString(1, idStaff);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
         public static void main(String[] args) {
        AccountDAL st = new AccountDAL();
        ArrayList<AccountModel> ls = st.readAccount();
        for(AccountModel p : ls){
            System.out.println(p.getIdAccount());
        }

    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.CustomerModel;
import java.sql.ResultSet ;
import java.util.ArrayList;
import java.sql.PreparedStatement;

/**
 *
 * @author LENOVO
 */
public class CustomerDAL extends MyDatabaseManager{
    public CustomerDAL(){
        CustomerDAL.connectDB();
    }
     public ArrayList readCustomer(){
        ArrayList<CustomerModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM customer";
            ResultSet rs =CustomerDAL.doReadQuery(query);
            if(rs!=null){
                 while (rs.next()) {                     
                    CustomerModel cus = new CustomerModel();
                    cus.setIdCustomer(rs.getString("idCustomer"));
                    cus.setEmail(rs.getString("email"));
                    cus.setFullName(rs.getString("fullName"));
                    cus.setAddress(rs.getString("address"));
                   cus.setNumberPhone(rs.getString("numberPhone"));                   
                   list.add(cus);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     //     Thêm  //
     public int addCustomer(CustomerModel cus) {
         int rs = 0;
         try {
              String query = "INSERT INTO customer ( idCustomer ,email , fullName, address, numberPhone) "
                 + " VALUES (?,?,?,?,?);";
                PreparedStatement p = CustomerDAL.getConnection().prepareStatement(query);
                 p.setString(1, cus.getIdCustomer());
                p.setString(2, cus.getEmail());
                p.setString(3, cus.getFullName());
                p.setString(4, cus.getAddress());
                p.setString(5,cus.getNumberPhone()); 
                rs = p.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }               
     return rs;
     }
//     update  //
 
    
    public int updateCustomer(CustomerModel cus){
        int rs = 0;
        try {
            String query = "UPDATE customer  "
                    + "SET  email =?, fullName = ?, address = ?,"
                    + " numberPhone = ? "
                    + "WHERE customer.idCustomer = ?;";
              PreparedStatement p = CustomerDAL.getConnection().prepareStatement(query);
               
               p.setString(1, cus.getEmail());
               p.setString(2, cus.getFullName());
               p.setString(3, cus.getAddress());
               p.setString(4,cus.getNumberPhone()); 
               p.setString(5, cus.getIdCustomer());
               rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
//    delete staff //
        public int deleteCustomer(String idCustomer){
        int rs = 0;
        try {
            String query = "DELETE FROM customer WHERE idCustomer = ?";
            PreparedStatement p = CustomerDAL.getConnection().prepareStatement(query);
            p.setString(1, idCustomer);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
}

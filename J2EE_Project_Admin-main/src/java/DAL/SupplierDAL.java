/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import model.SupplierModel;
import java.sql.ResultSet ;
import java.util.ArrayList;
import java.sql.PreparedStatement;
/**
 *
 * @author Admin
 */
public class SupplierDAL extends MyDatabaseManager{
    public  SupplierDAL(){
    SupplierDAL.connectDB();
    }
     public ArrayList readSupplier(){
        ArrayList<SupplierModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM supplier";
            ResultSet rs =SupplierDAL.doReadQuery(query);
            if(rs!=null){
                 while (rs.next()) {                     
                    SupplierModel supplierModel = new SupplierModel();
//                    idSupplier	nameSuppiler	address	numberPhone
                    supplierModel.setIdSupplier(rs.getString("idSupplier"));
                    supplierModel.setNameSuppiler(rs.getString("nameSuppiler"));
                    supplierModel.setAddress(rs.getString("address"));
                    supplierModel.setNumberPhone(rs.getString("numberPhone"));
                   list.add(supplierModel);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     //     Thêm  //
     public int addSupplier(SupplierModel sup) {
         int rs = 0;
         try {
              String query = "INSERT INTO supplier ( idSupplier ,nameSuppiler, address,  numberPhone) "
                 + " VALUES (?,?,?,?);";
                PreparedStatement p = SupplierDAL.getConnection().prepareStatement(query);
                 p.setString(1, sup.getIdSupplier());
                p.setString(2, sup.getNameSuppiler());
                p.setString(3, sup.getAddress());
                p.setString(4, sup.getNumberPhone());              
                rs = p.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }               
     return rs;
     }
//     update  //
 
    
    public int updateSupplier(SupplierModel sup){
        int rs = 0;
        try {
            String query = "UPDATE supplier  "
                    + "SET  nameSuppiler =?, address = ?,"
                    + " numberPhone = ? "
                    + "WHERE supplier.idSupplier = ?;";
              PreparedStatement p = SupplierDAL.getConnection().prepareStatement(query);
              
                p.setString(1, sup.getNameSuppiler());
                p.setString(2, sup.getAddress());
                p.setString(3, sup.getNumberPhone());   
                 p.setString(4, sup.getIdSupplier());
               rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
//    delete staff //
        public int deleteSupplier(String idSupplier){
        int rs = 0;
        try {
            String query = "DELETE FROM supplier WHERE idSupplier = ?";
            PreparedStatement p = SupplierDAL.getConnection().prepareStatement(query);
            p.setString(1, idSupplier);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
}

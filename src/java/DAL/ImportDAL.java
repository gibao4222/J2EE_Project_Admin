/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.ImportModel;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Admin
 */
public class ImportDAL extends MyDatabaseManager{
    public ImportDAL (){
        ImportDAL.connectDB();
    }
     public ArrayList readImport(){
        ArrayList<ImportModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM import";
            ResultSet rs =ImportDAL.doReadQuery(query);
            if(rs!=null){
                 while (rs.next()) {                     
                    ImportModel ip = new ImportModel();
                    ip.setIdImport(rs.getString("idImport"));
                    ip.setIdSupplier(rs.getString("idSupplier"));
                    ip.setDateCreated(rs.getString("dateCreated"));
                    ip.setTotalBill(rs.getString("totalBill"));
                    ip.setIdPerson(rs.getString("idPerson"));
                   list.add(ip);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

     public int addImport(ImportModel ip) {
         int rs = 0;
         try {
              String query = "INSERT INTO import ( idImport ,idSupplier , dateCreated, totalBill,idPerson) "
                 + " VALUES (?,? ,?,?,?);";
                PreparedStatement p = ImportDAL.getConnection().prepareStatement(query);
                p.setString(1, ip.getIdImport());
                p.setString(2, ip.getIdSupplier());
                p.setString(3, ip.getDateCreated());
                p.setString(4, ip.getTotalBill());
                p.setString(5, ip.getIdPerson());
           rs = p.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }               
     return rs;
     }

 
    
    public int updateImport(ImportModel ip){
        int rs = 0;
        try {
            String query = "UPDATE import  "
                    + "SET idSupplier =?, dateCreated = ?, totalBill = ?,idPerson=?"
                   
                    + "WHERE import.idImport = ?;";
              PreparedStatement p = ImportDAL.getConnection().prepareStatement(query);
                p.setString(1, ip.getIdSupplier());
                p.setString(2, ip.getDateCreated());
                p.setString(3, ip.getTotalBill());
                p.setString(4, ip.getIdPerson());
                p.setString(5, ip.getIdImport());
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
//    delete staff //
        public int deleteImport(String idImport){
        int rs = 0;
        try {
            String query = "DELETE FROM import WHERE idImport = ?";
            PreparedStatement p = ImportDAL.getConnection().prepareStatement(query);
            p.setString(1, idImport);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
}

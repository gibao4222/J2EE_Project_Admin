/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;


import Model.ImportDetailModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Admin
 */
public class ImportDetailDAL extends MyDatabaseManager{
    public ImportDetailDAL (){
        ImportDetailDAL.connectDB();
    }
//     public ArrayList readImportDetail(){
//        ArrayList<ImportDetailModel> list = new ArrayList<>();
//        try {
//            String query = "SELECT * FROM importdetail";
//            ResultSet rs =ImportDetailDAL.doReadQuery(query);
//            if(rs!=null){
//                 while (rs.next()) {                     
//                    ImportDetailModel id = new ImportDetailModel();
//                    id.setIdImportDetail(rs.getString("idImportDetail"));
//                    id.setIdImport(rs.getString("idImport"));
//                    id.setIdProduct(rs.getString("idProduct"));
//                    id.setDateCreated(rs.getString("dateCreated"));
//                   id.setQuantity(rs.getInt("quantity"));
//                   id.setPrice(rs.getString("price"));
//                   id.setTotal(rs.getString("total"));
//                   list.add(id);
//                 }
//             }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
    public ArrayList<ImportDetailModel> readImportDetail() {
    ArrayList<ImportDetailModel> list = new ArrayList<>();
    try {
        String query = "SELECT * FROM importdetail";
        ResultSet rs = ImportDetailDAL.doReadQuery(query);
        if (rs != null) {
            while (rs.next()) {
                ImportDetailModel id = new ImportDetailModel();
                id.setIdImportDetail(rs.getString("idImportDetail"));
                id.setIdImport(rs.getString("idImport"));
                id.setIdProduct(rs.getString("idProduct"));
                id.setDateCreated(rs.getString("dateCreated"));

                // Kiểm tra giá trị 'null' trước khi sử dụng getInt
                int quantity = rs.getInt("quantity");
                if (!rs.wasNull()) {
                    id.setQuantity(quantity);
                }

                id.setPrice(rs.getString("price"));
                id.setTotal(rs.getString("total"));
                list.add(id);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return list;
}
//     Thêm nhân viên //
     public int addImportDetail(ImportDetailModel id) {
         int rs = 0;
         try {
              String query = "INSERT INTO importdetail ( idImportDetail ,idImport , idProduct, dateCreated, quantity, price, total) "
                 + " VALUES (?,? , ?,?, ?, ?, ?);";
                PreparedStatement p = ImportDetailDAL.getConnection().prepareStatement(query);
                p.setString(1, id.getIdImportDetail());
                p.setString(2, id.getIdImport());
                p.setString(3, id.getIdProduct());
                p.setString(4, id.getDateCreated());
                p.setInt(5,id.getQuantity());
                p.setString(6, id.getPrice());
                p.setString(7, id.getTotal());
     
                rs = p.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }               
     return rs;
     }

 
    
    public int updateImportDetail(ImportDetailModel id){
        int rs = 0;
        try {
            String query = "UPDATE importdetail "
                    + "SET idImport =?, idProduct = ?, dateCreated = ?,"
                    + " quantity = ?, price = ?, total = ? "
                    + "WHERE importdetail.idImportDetail = ?;";
              PreparedStatement p = ImportDetailDAL.getConnection().prepareStatement(query);
                p.setString(1, id.getIdImport());
                p.setString(2, id.getIdProduct());
                p.setString(3, id.getDateCreated());
                p.setInt(4,id.getQuantity());
                p.setString(5, id.getPrice());
                p.setString(6, id.getTotal());
                p.setString(7, id.getIdImportDetail());
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

        public int deleteImportDetail(String idImportDetail){
        int rs = 0;
        try {
            String query = "DELETE FROM importdetail WHERE idImportDetail = ?";
            PreparedStatement p = ImportDetailDAL.getConnection().prepareStatement(query);
            p.setString(1, idImportDetail);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
}

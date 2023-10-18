/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.ResultSet;
import java.util.ArrayList;
import Model.ProductModel;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class ProductDAL extends MyDatabaseManager{
   public ProductDAL(){
        ProductDAL.connectDB();
    }
    
    public ArrayList readProduct(){
        ArrayList<ProductModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM product";
            ResultSet rs =ProductDAL.doReadQuery(query);
            
             if(rs!=null){
                 while (rs.next()) {                     
                     ProductModel pr = new ProductModel();
                     pr.setIdProduct(rs.getString("idProduct"));
                     pr.setNameProduct(rs.getString("nameProduct"));
                     pr.setIntroduce(rs.getString("introduce"));
                     pr.setImage(rs.getString("image"));
                     pr.setSize(rs.getString("size"));
                     pr.setStuff(rs.getString("stuff"));
                     pr.setQuantity(rs.getInt("quantity"));
                     pr.setPrice(rs.getFloat("price"));
                     pr.setPortray(rs.getString("portray"));

                     
                     list.add(pr);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    } 
    
    public int addPromotionGroup(ProductModel pr){
        int rs = 0;
        try {
            String query = "INSERT INTO product (idProduct,nameProduct,introduce,image,size,stuff,quantity,price,portray) VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement p = ProductDAL.getConnection().prepareStatement(query);
            p.setString(1, (new CreateID("PR")).create());
            p.setString(2, pr.getNameProduct());
            p.setString(3, pr.getIntroduce());
            p.setString(4, pr.getImage());
            p.setString(5, pr.getSize());
            p.setString(6, pr.getStuff());
            p.setInt(7, pr.getQuantity());
            p.setFloat(8, pr.getPrice());
            p.setString(9, pr.getPortray());
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    

}

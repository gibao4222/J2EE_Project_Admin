/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.ResultSet;
import java.util.ArrayList;
import Model.ProductModel;
import java.sql.*;
import java.util.List;
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
                     pr.setIdCategory(rs.getString("idCategory"));
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
    
    public int addProduct(ProductModel pr){
        int rs = 0;
        try {
            String query = "INSERT INTO product (idProduct,idCategory,nameProduct,introduce,image,size,stuff,quantity,price,portray) VALUES(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement p = ProductDAL.getConnection().prepareStatement(query);
            p.setString(1, pr.getIdProduct());
            p.setString(2, pr.getIdCategory());
            p.setString(3, pr.getNameProduct());
            p.setString(4, pr.getIntroduce());
            p.setString(5, pr.getImage());
            p.setString(6, pr.getSize());
            p.setString(7, pr.getStuff());
            p.setInt(8, pr.getQuantity());
            p.setFloat(9, pr.getPrice());
            p.setString(10, pr.getPortray());
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public ProductModel findproductbyId_Product(String id_product)  {
          ProductModel s = new ProductModel();
         try {
                 
            
        String query = "SELECT * FROM product WHERE idProduct = '"+ id_product + "'";
        ResultSet rs = ProductDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {

                s.setIdProduct(rs.getString("idProduct"));
                s.setIntroduce(rs.getString("introduce"));
                s.setImage(rs.getString("image"));
                s.setNameProduct(rs.getString("nameProduct"));
                 s.setPortray(rs.getString("portray"));
                s.setPrice(rs.getFloat("price"));
                 s.setIdCategory(rs.getString("idCategory"));
                 s.setQuantity(rs.getInt("quantity"));
                 s.setSize(rs.getString("size"));
                 s.setStuff(rs.getString("stuff"));

                                                               
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return s;
    }
    
    public ArrayList findproductbyId_category(int id_category)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM product WHERE idCategory = "+ id_category + "";
        ResultSet rs = ProductDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                ProductModel s = new ProductModel();
                s.setIdProduct(rs.getString("idProduct"));
                s.setIntroduce(rs.getString("introduce"));
                s.setImage(rs.getString("image"));
                s.setNameProduct(rs.getString("nameProduct"));
                 s.setPortray(rs.getString("portray"));
                s.setPrice(rs.getInt("price"));
                 s.setIdCategory(rs.getString("idCategory"));
                 s.setQuantity(rs.getInt("quantity"));
                 s.setSize(rs.getString("size"));
                 s.setStuff(rs.getString("stuff"));

                                                                
                list.add(s);
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
    }

    public int deleteproduct(String id) {
           int result = 0 ;
           try{
        String query = "DELETE FROM product WHERE IdProduct  = ?";
        PreparedStatement p = ProductDAL.getConnection().prepareStatement(query);
        p.setString(1, id);
         result = p.executeUpdate();
         } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
    public ArrayList findproductbyName(String name)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM product WHERE nameProduct LIKE '%"+name+"%'";
        ResultSet rs = ProductDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                ProductModel s = new ProductModel();
               s.setIdProduct(rs.getString("IdProduct"));
                s.setIntroduce(rs.getString("introduce"));
                s.setImage(rs.getString("image"));
                s.setNameProduct(rs.getString("nameProduct"));
                 s.setPortray(rs.getString("portray"));
                s.setIdCategory(rs.getString("idCategory"));
                s.setPrice(rs.getFloat("price"));
                 s.setQuantity(rs.getInt("quantity"));
                 s.setSize(rs.getString("size"));
                 s.setStuff(rs.getString("stuff"));

                                                                
                list.add(s);
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
    }
    
//       
       public int trusoluong(int quantity, String IdProduct) {
           int result = 0 ;
           try{
                String query1 = "SELECT quantity FROM product WHERE IdProduct = ?";
        PreparedStatement p1 = ProductDAL.getConnection().prepareStatement(query1);
        p1.setString(1, IdProduct);
       ResultSet rs = p1.executeQuery();
       if (rs.next()) {
                int updatedQuantity = rs.getInt("quantity");
                System.out.print(updatedQuantity);
                if (updatedQuantity > 0) {
                    // Nếu số lượng sản phẩm âm, hủy bỏ giao dịch và xuất thông báo
                   String query = "UPDATE product SET quantity = quantity - ? WHERE IdProduct = ?";
        PreparedStatement p = ProductDAL.getConnection().prepareStatement(query);
        p.setInt(1, quantity);
        p.setString(2, IdProduct);
         result = p.executeUpdate();
         result=1;
                }else{
            result= 0 ; 
                }
                
            }
        
         
              


        
         
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
       
    }
       public int updatePro(ProductModel ps, String id) {
           int result = 0 ;
           try{
        String query = "Update product SET nameProduct = ? , introduce = ?, image =?,size = ?,stuff=? ,quantity=?,price=?,portray=?,idCategory=?  "
                + " WHERE IdProduct  = ?";
        PreparedStatement p = ProductDAL.getConnection().prepareStatement(query);
        p.setString(1, ps.getNameProduct());
        p.setString(2, ps.getIntroduce());
        p.setString(3, ps.getImage());
        p.setString(4, ps.getSize());
        p.setString(5, ps.getStuff());
        p.setInt(6, ps.getQuantity());
        p.setFloat(7, ps.getPrice());
        p.setString(8, ps.getPortray());
        p.setString(9, ps.getIdCategory());
                p.setString(10, String.valueOf(id));


         result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }

       public int updatePro_byQuantity(int quantity, String idPro){
           int rs = 0;
           try {
               String query = "UPDATE product SET quantity = ? WHERE idProduct = ?";
               PreparedStatement p = ProductDAL.getConnection().prepareStatement(query);
               p.setInt(1, quantity);
               p.setString(2, idPro);
               rs = p.executeUpdate();
           } catch (Exception e) {
               System.out.println(e);
           }
           return rs;
       }
       public static void main(String[] args) {
        ProductDAL proDAL = new ProductDAL();
        proDAL.updatePro_byQuantity(20, "PR019");
    }
}

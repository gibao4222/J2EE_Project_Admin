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
            p.setString(1, (new CreateID("PR")).create());
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
    
    public ProductModel findProduct(int id)  {
            ProductModel ps = new ProductModel();
           try{
        String query = "SELECT * FROM product WHERE IdProduct  = " + id + " ";
        PreparedStatement p = ProductDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                ps.setIdProduct(rs.getString("IdProduct"));
                ps.setIntroduce(rs.getString("introduce"));
                ps.setNameProduct(rs.getString("introduce"));
                ps.setImage(rs.getString("image"));
                ps.setSize(rs.getString("size"));
                ps.setStuff(rs.getString("stuff"));
                ps.setQuantity(Integer.parseInt(rs.getString("quantity")));
                ps.setPrice(rs.getFloat("price"));
                ps.setPortray(rs.getString("portray"));
                ps.setIdCategory(rs.getString("idCategory"));
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return ps;
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
       public static void main(String[] args) {
        ProductDAL p =  new ProductDAL();
        List<ProductModel> ls = p.readProduct();
           System.out.println(ls.get(0).getIdCategory());
    }
}

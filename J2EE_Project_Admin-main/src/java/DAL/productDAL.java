/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import model.ProductModel;
import com.oracle.wls.shaded.org.apache.bcel.generic.AALOAD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
import java.text.NumberFormat;
import java.util.Locale;

/**
 *
 * @author Thanhchan
 */
public class productDAL extends MyDatabaseManager{
    Locale locale = new Locale("en", "EN");
    public productDAL() {

        productDAL.connectDB();
    }
     public ArrayList readproduct()  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM product ";
        ResultSet rs = productDAL.doReadQuery(query);
       

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
                s.setColor(rs.getString("color"));
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
//     public ArrayList findproductbyId_category(int id_category)  {
//          ArrayList list = new ArrayList();
//         try {
//                 
//            
//        String query = "SELECT * FROM product WHERE id_category = "+ id_category + "";
//        ResultSet rs = productDAL.doReadQuery(query);
//       
//
//        if (rs != null) {
//            while (rs.next()) {
//                ProductModel s = new ProductModel();
//                s.setIdProduct(rs.getString("IdProduct"));
//                s.setIntroduce(rs.getString("introduce"));
//                s.setImage(rs.getString("image"));
//                s.setNameProduct(rs.getString("nameProduct"));
//                 s.setPortray(rs.getString("portray"));
//                s.setId_category(rs.getInt("id_category"));
//                s.setColor(rs.getString("color"));
//                s.setPrice(rs.getInt("price"));
//                 s.setId_category(rs.getInt("id_category"));
//                 s.setQuantity(rs.getString("quantity"));
//                 s.setSize(rs.getString("size"));
//                 s.setStuff(rs.getString("stuff"));
//
//                                                                
//                list.add(s);
//            }
//        }
//         } catch (Exception e) {
//             System.out.println(e);
//             }
//        return list;
//    }
     public ArrayList findproductbyName(String name)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM product WHERE nameProduct LIKE '%"+name+"%'";
        ResultSet rs = productDAL.doReadQuery(query);
       

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
                s.setColor(rs.getString("color"));
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
      public ArrayList findproductbyCategory(String Idcategory)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM product WHERE idCategory LIKE '%"+Idcategory+"%'";
        ResultSet rs = productDAL.doReadQuery(query);
       

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
                s.setColor(rs.getString("color"));
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
     public ArrayList findproductbyColor(String color)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM product WHERE color LIKE '%"+color+"%'";
        ResultSet rs = productDAL.doReadQuery(query);
       

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
                s.setColor(rs.getString("color"));
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
      public int insertproduct(ProductModel ps){
          int result = 0;
          try{
        String query = "Insert product (IdProduct ,nameProduct, introduce, image,size,stuff,quantity,price,portray,idCategory,color) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        p.setString(1, ps.getIdProduct());
        p.setString(2, ps.getNameProduct());
        p.setString(3, ps.getIntroduce());
        p.setString(4, ps.getImage());
        p.setString(5, ps.getSize());

        p.setString(6, ps.getStuff());

         p.setInt(7, ps.getQuantity());
         p.setFloat(8, ps.getPrice());
         p.setString(9, ps.getPortray());
         p.setString(10, ps.getIdCategory());
         p.setString(11, ps.getColor());
                                        
        result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public int deleteproduct(int id) {
           int result = 0 ;
           try{
        String query = "DELETE FROM product WHERE IdProduct  = ?";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        p.setInt(1, id);
         result = p.executeUpdate();
         } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public ProductModel findProduct(String id)  {
            ProductModel ps = new ProductModel();
           try{
        String query = "SELECT * FROM product WHERE IdProduct  LIKE '%"+id+"%'";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                ps.setIdProduct(rs.getString("IdProduct"));
                ps.setIntroduce(rs.getString("introduce"));
                ps.setNameProduct(rs.getString("nameProduct"));
                ps.setImage(rs.getString("image"));
                ps.setSize(rs.getString("size"));
                ps.setStuff(rs.getString("stuff"));
                ps.setColor(rs.getString("color"));
                ps.setQuantity(rs.getInt("quantity"));
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
        public ArrayList filterFormAtoB(int a,int b)  {
            ArrayList list = new ArrayList();
            
           try{
        String query = "SELECT * FROM Product WHERE Price BETWEEN "+a+" AND "+b+"";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
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
                s.setColor(rs.getString("color"));
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
          public ArrayList filterUnderA(int a)  {
            ArrayList list = new ArrayList();
            
           try{
        String query = "SELECT * FROM Product WHERE Price < "+a+"";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
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
                s.setColor(rs.getString("color"));
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
          public ArrayList filterAboveA(int a)  {
            ArrayList list = new ArrayList();
            
           try{
        String query = "SELECT * FROM Product WHERE Price > "+a+"";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
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
                s.setColor(rs.getString("color"));
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
          public ArrayList filterMin()  {
            ArrayList list = new ArrayList();
            
           try{
        String query = "SELECT * FROM Product ORDER BY Price ASC";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
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
                s.setColor(rs.getString("color"));
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
           public ArrayList filterMax()  {
            ArrayList list = new ArrayList();
            
           try{
        String query = "SELECT * FROM Product ORDER BY Price DESC;";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
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
                s.setColor(rs.getString("color"));
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
        PreparedStatement p1 = productDAL.getConnection().prepareStatement(query1);
        p1.setString(1, IdProduct);
       ResultSet rs = p1.executeQuery();
       if (rs.next()) {
                int updatedQuantity = rs.getInt("quantity");
                System.out.print(updatedQuantity);
                if (updatedQuantity > 0) {
                    // Nếu số lượng sản phẩm âm, hủy bỏ giao dịch và xuất thông báo
                   String query = "UPDATE product SET quantity = quantity - ? WHERE IdProduct = ?";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
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
      public static void main(String[] args) {
        productDAL p = new productDAL();

         List<ProductModel> list  =  p.findproductbyCategory("CA012");
         
          
          System.err.println(list.get(1).getNameProduct());
////         product pro = p.findProduct(24);
//            product pro = new product();
//         pro.setNameProduct("adadad");
//         pro.setIntroduce("adadad");
//
//           pro.setImage("adadad");
//           pro.setNameProduct("adadad");
//         pro.setNameProduct("adadad");
//
//           pro.setSize("adadad");
//                      pro.setStuff("ttttttttt");
//
//                                 pro.setQuantity("adadad");
//         pro.setPrice(Float.parseFloat("23213"));
//         pro.setPortray("ấdasdad");
//         p.updatePro(pro, 41);
//          System.out.println(pro.getStuff());
          
          

    }
}

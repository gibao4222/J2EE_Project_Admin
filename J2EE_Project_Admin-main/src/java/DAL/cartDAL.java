/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import jakarta.persistence.IdClass;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Thanhchan
 */
public class cartDAL extends MyDatabaseManager{
     public cartDAL() {

        cartDAL.connectDB();
    }
     public ArrayList readcart(int customerId)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT product.price, cart.idCart,cart.idCustomer,  product.nameProduct, cart.quantity,cart.pricetotal FROM cart INNER JOIN product ON cart.idProduct = product.IdProduct INNER JOIN customer ON customer.idCustomer =cart.idCustomer WHERE cart.idCustomer="+customerId+"";
        ResultSet rs = cartDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                cart s = new cart();
                s.setIdCart(rs.getInt("idCart"));
                s.setIdCustomer(rs.getInt("idCustomer"));
                s.setPricePro(rs.getFloat("price"));
                s.setNameProduct(rs.getString("nameProduct"));
                s.setQuantity(rs.getInt("quantity"));
                 s.setPricetotal(rs.getFloat("pricetotal"));
                list.add(s);
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
    }
      public int insertcart(cart ps){
          int result = 0;
          try{
        String query = "Insert cart (idCustomer,idProduct,quantity,pricetotal) VALUES (?,?,?,?)";
        PreparedStatement p = cartDAL.getConnection().prepareStatement(query);
        p.setInt(1, ps.getIdCustomer());
        p.setInt(2, ps.getIdProduct());
        p.setInt(3, ps.getQuantity());
        p.setFloat(4,ps.getPricetotal());

        result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public int deletecart(int id) {
           int result = 0 ;
           try{
        String query = "DELETE FROM cart WHERE idCart    = ?";
        PreparedStatement p = cartDAL.getConnection().prepareStatement(query);
        p.setInt(1, id);
         result = p.executeUpdate();
         } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public category findcategory(int id)  {
            category ps = new category();
           try{
        String query = "SELECT * FROM category WHERE idCategory = " + id + " ";
        PreparedStatement p = cartDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                ps.setIdCategory(rs.getInt("idCategory"));
                ps.setNameCategory(rs.getString("nameCategory"));
               
            }
            System.out.println(ps.getNameCategory());
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return ps;
        
    }
        public cart findcartBYidCusAndidPro(int idProduct,int idCustomer)  {
            cart ps = new cart();
           try{
        String query = "SELECT * FROM cart WHERE idProduct = "+ idProduct+ " AND idCustomer = "+ idCustomer+"  ";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                ps.setIdCart(rs.getInt("idCart"));
                ps.setIdCustomer(rs.getInt("idCustomer"));
                ps.setIdProduct(rs.getInt("idProduct"));
                ps.setQuantity(rs.getInt("quantity"));
                ps.setPricetotal(rs.getFloat("pricetotal"));
              
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return ps;
    }
      
       public int updatecart(int qty, int id, float pricetotal) {
           int result = 0 ;
           try{
        String query = "Update cart SET quantity = ?,pricetotal= ?"
                + " WHERE idCart   = ?";
        PreparedStatement p = cartDAL.getConnection().prepareStatement(query);
        p.setString(1, String.valueOf(qty));
        p.setFloat(2, pricetotal);
        
                p.setString(3, String.valueOf(id));


         result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public static void main(String[] args) {
        cart c = new cart();
        cartDAL cart = new cartDAL();
            c=cart.findcartBYidCusAndidPro(45, 3);
            System.out.println(c.pricetotal);
        c.setIdCustomer(1);
        c.setIdProduct(3);
           c.setPricetotal(1333);
        c.setPricetotal(123333);
        cart.insertcart(c);
       
//           cart.deletecart(4);
//           cart.deletecart(3);
//        cart.updatecart(155, 2);
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.OrderDetail;
import model.ProductModel;

/**
 *
 * @author trinh
 */
public class OrderDetailDAL extends MyDatabaseManager{
     public OrderDetailDAL (){
        OrderDetailDAL.connectDB();
    }
     public ArrayList readOrderDetail(){
        ArrayList<OrderDetail> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM orderdetail";
            ResultSet rs =OrderDetailDAL.doReadQuery(query);
            if(rs!=null){
                 while (rs.next()) {                     
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setIdOrderDetail(rs.getString("idOrderDetail"));
                    orderDetail.setIdOrder(rs.getString("idOrder"));
                    orderDetail.setIdProduct(rs.getString("idProduct"));
                    orderDetail.setDateCreated(rs.getString("dateCreated"));
                   orderDetail.setQuantity(rs.getString("quantity"));
                   orderDetail.setPrice(rs.getString("price"));
                   orderDetail.setTotal(rs.getString("total"));
                   orderDetail.setIdSale(rs.getString("idSale"));
                   
                   list.add(orderDetail);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
 public ArrayList findOrderDetails(String idOrder)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM orderdetail WHERE idOrder LIKE '%"+idOrder+"%'";
        ResultSet rs = OrderDetailDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                OrderDetail s = new OrderDetail();
               s.setIdProduct(rs.getString("idProduct"));
               s.setPrice(String.valueOf(rs.getDouble("price")));
               s.setQuantity(String.valueOf(rs.getInt("Quantity")));
               s.setTotal(String.valueOf(rs.getDouble("total")));
               s.setIdSale("1");
               s.setDateCreated(String.valueOf(rs.getDate("dateCreated")));
               s.setIdOrderDetail(rs.getString("idOrderDetail"));
//               String img = s.getimg(Integer.parseInt(rs.getString("idProduct")));
              productDAL p = new productDAL();
            ProductModel pro = new ProductModel();
            pro = p.findProduct(rs.getString("idProduct"));
            
            String name = pro.getNameProduct();
           String img= pro.getImage();
               s.setimg(img);
               s.setNamePro(name);
                list.add(s);
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
    }
     public int addOrderDetail(OrderDetail odd) {
         int rs = 0;
         try {
              String query = "INSERT INTO orderdetail ( idOrderDetail ,idOrder , idProduct, dateCreated, quantity, price,total,idSale) "
                 + " VALUES (?,? , ?,?, ?, ?, ?,?);";
                PreparedStatement p = OrderDetailDAL.getConnection().prepareStatement(query);
                p.setString(1, odd.getIdOrderDetail());
                p.setString(2, odd.getIdOrder());
                p.setString(3, odd.getIdProduct());
                p.setString(4, odd.getDateCreated());
                p.setString(5,odd.getQuantity());
                p.setString(6, odd.getPrice());
                  p.setString(7, odd.getTotal());
                p.setString(8, odd.getIdSale());
 
                rs = p.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }               
     return rs;
     }
//     update staff //
 
    
    public int updateOrderDetail(OrderDetail odd){
        int rs = 0;
        try {
            String query = "UPDATE orderdetail  "
                    + "SET idOrder =?, idProduct = ?, dateCreated = ?,"
                    + " quantity = ?, price = ?, total = ?, idSale = ? "
                    + "WHERE orderdetail.idOrderDetail = ?;";
              PreparedStatement p = OrderDetailDAL.getConnection().prepareStatement(query);
                p.setString(1, odd.getIdOrder());
                p.setString(2, odd.getIdProduct());
                p.setString(3, odd.getDateCreated());
                p.setString(4,odd.getQuantity());
                p.setString(5, odd.getPrice());
                  p.setString(6, odd.getTotal());
                p.setString(7, odd.getIdSale());

                p.setString(8, odd.getIdOrderDetail());

            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
//    delete staff //
        public int deleteOrderDetail(String idOrderDetail){
        int rs = 0;
        try {
            String query = "DELETE FROM orderdetail WHERE idOrderDetail = ?";
            PreparedStatement p = OrderDetailDAL.getConnection().prepareStatement(query);
            p.setString(1, idOrderDetail);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
        public static void main(String[] args) {
        OrderDetail o = new OrderDetail();
        OrderDetailDAL oo = new OrderDetailDAL();
//        o.setDateCreated("2002-12-12");
//        o.setIdOrder("10000");
//        o.setIdOrderDetail("10000");
//        o.setIdProduct("123");
//        o.setIdSale("1");
//        o.setPrice("1000000");
//        o.setQuantity("21");
//        o.setTotal("123213123");
       List<OrderDetail> order=  oo.findOrderDetails("9247");
            System.out.println(order.get(0).getIdProduct());
            
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.OrderDetailModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author Admin
 */
public class OrderDetailDAL extends MyDatabaseManager{
     public OrderDetailDAL (){
        OrderDetailDAL.connectDB();
    }
     public ArrayList readOrderDetail(){
        ArrayList<OrderDetailModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM orderdetail";
            ResultSet rs =OrderDetailDAL.doReadQuery(query);
            if(rs!=null){
                 while (rs.next()) {                     
                    OrderDetailModel orderDetail = new OrderDetailModel();
                    orderDetail.setIdOrderDetail(rs.getString("idOrderDetail"));
                    orderDetail.setIdOrder(rs.getString("idOrder"));
                    orderDetail.setIdProduct(rs.getString("idProduct"));
                    orderDetail.setDateCreated(rs.getString("dateCreated"));
                   orderDetail.setQuantity(rs.getInt("quantity"));
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

     public int addOrderDetail(OrderDetailModel odd) {
         int rs = 0;
         try {
              String query = "INSERT INTO orderdetail ( idOrderDetail ,idOrder , idProduct, dateCreated, quantity, price,total,idSale) "
                 + " VALUES (?,? , ?,?, ?, ?, ?,?);";
                PreparedStatement p = OrderDetailDAL.getConnection().prepareStatement(query);
                p.setString(1, odd.getIdOrderDetail());
                p.setString(2, odd.getIdOrder());
                p.setString(3, odd.getIdProduct());
                p.setString(4, odd.getDateCreated());
                p.setInt(5,odd.getQuantity());
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
 
    
    public int updateOrderDetail(OrderDetailModel odd){
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
                p.setInt(4,odd.getQuantity());
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
        public ArrayList<Object[]> getTop10Product(){
            ArrayList<Object[]> arr = new ArrayList();
            try {
                String query ="SELECT\n" +
"    P.idProduct,P.nameProduct,\n" +
"    SUM(OD.quantity) AS totalQuantity,\n" +
"    FORMAT(SUM(CAST(REPLACE(OD.total, ',', '') AS UNSIGNED)), 0) AS grandTotal\n" +
"FROM\n" +
"    Product P\n" +
"JOIN\n" +
"    orderDetail OD ON P.idProduct = OD.idProduct\n" +
"GROUP BY\n" +
"    P.idProduct\n" +
"ORDER BY\n" +
"    totalQuantity DESC,\n" +
"    grandTotal DESC\n" +
"LIMIT 10;";
                ResultSet rs = OrderDetailDAL.doReadQuery(query);
                if(rs!=null){
                    while(rs.next()){
                        Object[] ob = new Object[4];
                        ob[0] = rs.getString("idProduct");
                        ob[1] = rs.getString("nameProduct");
                        ob[2] = rs.getString("totalQuantity");
                        ob[3] = rs.getString("grandTotal");
                        arr.add(ob);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return arr;
        }
        public static void main(String[] args) {
            OrderDetailDAL o = new OrderDetailDAL();
            ArrayList<Object[]> ob = o.getTop10Product();
            System.out.println(ob.get(0)[0]);
    }
}

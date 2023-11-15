/*


 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import static DAL.MyDatabaseManager.connectDB;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ArrayList;
import java.sql.*;
import java.util.List;
import model.Order;


/**
 *
 * @author trinh
 */
public class OrderDAL extends MyDatabaseManager {
    public OrderDAL() {

     OrderDAL.connectDB();
    }
     public ArrayList<Order> readOrder()  {
          ArrayList<Order> list= new ArrayList<>();
//          String query = "SELECT * FROM orders ";
         try {
                 
            
        
        ResultSet rs = (ResultSet) OrderDAL.doReadQuery("SELECT * FROM orders ");
       

        if (rs != null) {
            while (rs.next()) {
                Order s = new Order();
                s.setIdOrder(rs.getString("idOrder"));
                s.setIdCustomer(rs.getString("idCustomer"));
                s.setDateCreated(rs.getString("dateCreated"));
                s.setTotalBill(rs.getString("totalBill"));
               s.setStatus(rs.getString("status"));
                list.add(s);
            }
        }
         } catch (Exception e) {
                e.printStackTrace();
             }
        return list;
}
     public ArrayList findOrder(String idCustomer)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM orders WHERE idCustomer LIKE '%"+idCustomer+"%'";
        ResultSet rs = OrderDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                Order s = new Order();
                s.setIdOrder(rs.getString("idOrder"));
                s.setTotalBill(rs.getString("totalBill"));
                s.setStatus(String.valueOf(rs.getInt("status")));
                s.setDateCreated(rs.getString("dateCreated"));

                                                                
                list.add(s);
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
    }
      public int addOrder(Order o){
        int rs = 0;
        try {
//            String query = "INSERT INTO orders (idOrder,idCustomer,dateCreated,totalBill,status) VALUES(?,?,?,?,?)";
//            PreparedStatement p = OrderDAL.getConnection().prepareStatement(query);
//            p.setString(1, (new CreateID("OD")).create());
//            p.setString(2, o.getIdCustomer());
//            p.setString(3, o.getDateCreated());
//            p.setString(4, o.getTotalBill());
//            p.setString(4, o.getStatus());
//             rs = p.executeUpdate();
        String query = "INSERT INTO orders (idOrder, idCustomer, dateCreated, totalBill, status) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement p = OrderDAL.getConnection().prepareStatement(query);
        p.setString(1, o.getIdOrder());
        p.setString(2, o.getIdCustomer());
        p.setString(3, o.getDateCreated());
        p.setString(4, o.getTotalBill());
        p.setString(5, o.getStatus());
        rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public int deleteOrder(String idOrder){
        int rs = 0;
        try {
            String query = "DELETE FROM orders WHERE idOrder = ?";
            PreparedStatement p = OrderDAL.getConnection().prepareStatement(query);
            p.setString(1, idOrder);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public int updateOrder(Order o){
        int rs = 0;
        try {
String query = "UPDATE orders "
             + "SET idCustomer = ?, dateCreated = ?, totalBill = ?, status = ? "
             + "WHERE orders.idOrder = ?;";
            PreparedStatement p = OrderDAL.getConnection().prepareStatement(query);
            p.setString(1, o.getIdCustomer());
            p.setString(2, o.getDateCreated());
            p.setString(3, o.getTotalBill());
            p.setString(4, o.getStatus());
            p.setString(5, o.getIdOrder());
            
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    public static void main(String[] args) {
        Order o = new Order();
        OrderDAL oo = new OrderDAL();
//        o.setIdCustomer("3");
//        o.setStatus("ádasd");
//        o.setTotalBill("130000");
//        o.setIdOrder("1");
//        o.setDateCreated("2512/2002");
//        oo.addOrder(o);
         List<Order> or = oo.findOrder("3");
               System.out.print(or.get(1).getTotalBill());
    }
}


    

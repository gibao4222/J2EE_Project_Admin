/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.CustomerModel;
import Model.OrderModel;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class OrderDAL extends MyDatabaseManager{
     public OrderDAL() {

     OrderDAL.connectDB();
    }
     public ArrayList<OrderModel> readOrder()  {
          ArrayList<OrderModel> list= new ArrayList<>();
//          String query = "SELECT * FROM orders ";
         try {
                 
            
        
        ResultSet rs = (ResultSet) OrderDAL.doReadQuery("SELECT * FROM orders ");
       

        if (rs != null) {
            while (rs.next()) {
                OrderModel s = new OrderModel();
                s.setIdOrder(rs.getString("idOrder"));
                s.setIdCustomer(rs.getString("idCustomer"));
                s.setDateCreated(rs.getString("dateCreated"));
                s.setTotalBill(rs.getString("totalBill"));
               s.setStatus(rs.getInt("status"));
                list.add(s);
            }
        }
         } catch (Exception e) {
                e.printStackTrace();
             }
        return list;
}
      public int addOrder(OrderModel o){
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
        p.setInt(5, o.getStatus());
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
    
    public int updateOrder(OrderModel o){
        int rs = 0;
        try {
String query = "UPDATE orders "
             + "SET idCustomer = ?, dateCreated = ?, totalBill = ?, status = ? "
             + "WHERE orders.idOrder = ?;";
            PreparedStatement p = OrderDAL.getConnection().prepareStatement(query);
            p.setString(1, o.getIdCustomer());
            p.setString(2, o.getDateCreated());
            p.setString(3, o.getTotalBill());
            p.setInt(4, o.getStatus());
            p.setString(5, o.getIdOrder());
            
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public int updateStatusOrder(int status, String idOrder){
        int rs = 0 ; 
        try {
            String query ="UPDATE orders SET status = ? WHERE idOrder = ?";
            PreparedStatement p = OrderDAL.getConnection().prepareStatement(query);
            p.setInt(1, status);
            p.setString(2, idOrder);
            
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    public static ArrayList<Object[]> getTop5Customer(){
        ArrayList<Object[]> arr = new ArrayList();
        try {
            String query = "SELECT c.idCustomer, c.fullName, COUNT(o.idOrder) AS occurrence\n" +
"FROM customer c\n" +
"LEFT JOIN orders o ON c.idCustomer = o.idCustomer\n" +
"GROUP BY c.idCustomer, c.fullName\n" +
"ORDER BY occurrence DESC\n" +
"LIMIT 5;";
            ResultSet rs = OrderDAL.doReadQuery(query);
            if (rs!=null) {
                while (rs.next()) {
//                    System.out.println(rs.getString("idCustomer"));
                    Object[] ob = new Object[3];
                    ob[0] = rs.getString("idCustomer");
                    ob[1] = rs.getString("fullName");
                    ob[2] = rs.getInt("occurrence");
                    arr.add(ob);
                    
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }
    public ArrayList<OrderModel> filterDate(String date){
        ArrayList<OrderModel> list = new ArrayList<>();
        try {
            String query ="SELECT * FROM orders WHERE dateCreated = '"+date+"'";
            ResultSet rs = OrderDAL.doReadQuery(query);
            if (rs != null) {
            while (rs.next()) {
                OrderModel s = new OrderModel();
                s.setIdOrder(rs.getString("idOrder"));
                s.setIdCustomer(rs.getString("idCustomer"));
                s.setDateCreated(rs.getString("dateCreated"));
                s.setTotalBill(rs.getString("totalBill"));
               s.setStatus(rs.getInt("status"));
                list.add(s);
            }
        }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args) {
        OrderDAL od = new OrderDAL();
        ArrayList<Object[]> olist = getTop5Customer();
        System.out.println(olist.size());
        for(Object[] o : olist ){
            System.out.println(o[0]+"-"+o[1]);
        }
    }
}

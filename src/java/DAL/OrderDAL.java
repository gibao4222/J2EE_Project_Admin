/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import static DAL.MyDatabaseManager.connectDB;
import java.sql.ResultSet;
import java.util.ArrayList;


/**
 *
 * @author trinh
 */
public class OrderDAL extends MyDatabaseManager {
    public OrderDAL() {
     super();
     OrderDAL.connectDB();
    }
     public ArrayList<Order> readOrder()  {
          ArrayList list = new ArrayList<>();
//          String query = "SELECT * FROM orders ";
         try {
                 
            
        
        ResultSet rs = (ResultSet) OrderDAL.doReadQuery("SELECT * FROM orders ");
       

        if (rs != null) {
            while (rs.next()) {
                Order s = new Order();
                s.setIdOrders(rs.getString("idOrder"));
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
}


    

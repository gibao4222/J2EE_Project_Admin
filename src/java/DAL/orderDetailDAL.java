/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import DAL.MyDatabaseManager;
import DAL.MyDatabaseManager;
import DAL.MyDatabaseManager;
import jakarta.jms.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author trinh
 */
public class orderDetailDAL extends MyDatabaseManager {
 
    public orderDetailDAL(){
    
        orderDetailDAL.connectDB();
}
         public ArrayList readorderDetail() {
          ArrayList list = new ArrayList();
         try{
             String query ="SELECT * FROM orderdetail ";
             ResultSet rs = orderDetailDAL.doReadQuery(query);
             
             
            if(rs != null){
                while (rs.next()){
                    orderDetail od = new orderDetail();
                    od.setIdOrderDetail(rs.getString("IdOrderDetail"));
                    od.setIdOrder(rs.getString("IdOrder"));
                    od.setIdProduct(rs.getString("IdProduct"));
                    od.setDateCreated(rs.getString("dateCreated"));
                    od.setQuantity(rs.getString("quantity"));
                    od.setPrice(rs.getString("price"));
                    od.setTotal(rs.getString("total"));
                    od.setIdSale(rs.getString("IdSale"));
                    
                    list.add(od);
                }
            } 
         } catch(Exception e){
              e.printStackTrace();
         }
        return list;
    
}
     
}

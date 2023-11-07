/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.ResultSet;

/**
 *
 * @author Thanhchan
 */
public class promotionDAL extends MyDatabaseManager {
     public promotionDAL() {

        promotionDAL.connectDB();
    }
     public promotion checkpromotion(String namePromo){
         promotion p = new promotion();
         
         try{
              String query = "SELECT saleOff,priceMax FROM promotion WHERE namePromo  = '"+namePromo+"'";
                  ResultSet rs = promotionDAL.doReadQuery(query);
                   if (rs.next()) {
                p.setSaleOff(rs.getFloat("saleOff"));
                p.setPriceMax(rs.getFloat("priceMax"));
                
            }

            // Đóng kết nối và giải phóng tài nguyên
            rs.close();
             } catch ( Exception e) {
                 System.out.println(e);
             }
         return  p;
     }
     public static void main(String[] args) {
        promotionDAL p = new promotionDAL();
        promotion pro = new promotion();
        pro= p.checkpromotion("4anhem");
         System.out.println(pro.saleOff);
    }
}

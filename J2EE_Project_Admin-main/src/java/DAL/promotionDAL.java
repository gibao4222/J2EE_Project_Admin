/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.PromotionModel;

/**
 *
 * @author Thanhchan
 */
public class promotionDAL extends MyDatabaseManager {
     public promotionDAL() {

        promotionDAL.connectDB();
    }
      public ArrayList readPromotion(){
        ArrayList<PromotionModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM promotion";
            ResultSet rs =promotionDAL.doReadQuery(query);
            
             if(rs!=null){
                 while (rs.next()) {                     
                     PromotionModel promo = new PromotionModel();
                     promo.setIdSale(rs.getString("idSale"));
                     promo.setNamePromo(rs.getString("namePromo"));
                     promo.setDateStart(rs.getString("dateStart"));
                     promo.setDateEnd(rs.getString("dateEnd"));
                     promo.setSaleOff(rs.getFloat("saleOff"));
                     promo.setReduceMax(rs.getFloat("priceMax"));
                     
                     list.add(promo);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     public int addPromotionGroup(PromotionModel pr){
        int rs = 0;
        try {
            String query = "INSERT INTO promotion (idSale ,namePromo,dateStart,dateEnd,saleOff,priceMax,terms) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement p = promotionDAL.getConnection().prepareStatement(query);
            p.setString(1, pr.getIdSale());
            p.setString(2, pr.getNamePromo());
            p.setString(3, pr.getDateStart());
            p.setString(4, pr.getDateEnd());
            p.setFloat(5, pr.getSaleOff());
            p.setFloat(6, pr.getReduceMax());
             p.setString(7, ".");
           
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
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
     public int deletePromotion(String id){
        int rs = 0;
        try {
            String query = "DELETE FROM promotion WHERE idSale = ?";
            PreparedStatement p = promotionDAL.getConnection().prepareStatement(query);
            p.setString(1, id);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public int updatePromotion(PromotionModel pr){
        int rs = 0;
        try {
            String query = "UPDATE promotion SET namePromo = ? , dateStart = ?, dateEnd = ?, saleOff = ?, priceMax = ? WHERE idSale  = ?";
            PreparedStatement p = promotionDAL.getConnection().prepareStatement(query);
            p.setString(1, pr.getNamePromo());
            p.setString(2, pr.getDateStart());
            p.setString(3, pr.getDateEnd());
            p.setFloat(4, pr.getSaleOff());
            p.setFloat(5, pr.getReduceMax());
            p.setString(6, pr.getIdSale());
            
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
     public static void main(String[] args) {
       promotionDAL p = new promotionDAL();
       List<PromotionModel> l = p.readPromotion();
         System.out.println(l.get(0).getNamePromo());
         
     }
}

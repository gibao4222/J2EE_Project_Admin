/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.PromotionModel;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class PromotionDAL extends MyDatabaseManager{
    public PromotionDAL(){
        PromotionDAL.connectDB();
    }
    
    public ArrayList readPromotion(){
        ArrayList<PromotionModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM promotion";
            ResultSet rs =PromotionDAL.doReadQuery(query);
            
             if(rs!=null){
                 while (rs.next()) {                     
                     PromotionModel promo = new PromotionModel();
                     promo.setIdPromo(rs.getString("idPromo"));
                     promo.setNamePromo(rs.getString("namePromo"));
                     promo.setCode(rs.getString("code"));
                     promo.setDateStart(rs.getString("dateStart"));
                     promo.setDateEnd(rs.getString("dateEnd"));
                     promo.setSaleOff(rs.getFloat("saleOff"));
                     promo.setReduceMax(rs.getFloat("reduceMax"));
                     
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
            String query = "INSERT INTO promotion (idPromo,namePromo,code,dateStart,dateEnd,saleOff,reduceMax) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement p = PromotionDAL.getConnection().prepareStatement(query);
            p.setString(1, pr.getIdPromo());
            p.setString(2, pr.getNamePromo());
            p.setString(3, pr.getCode());
            p.setString(4, pr.getDateStart());
            p.setString(5, pr.getDateEnd());
            p.setFloat(6, pr.getSaleOff());
            p.setFloat(7, pr.getReduceMax());
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public int deletePromotion(String idPromo){
        int rs = 0;
        try {
            String query = "DELETE FROM promotion WHERE idPromo = ?";
            PreparedStatement p = PromotionDAL.getConnection().prepareStatement(query);
            p.setString(1, idPromo);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public int updatePromotion(PromotionModel pr){
        int rs = 0;
        try {
            String query = "UPDATE promotion SET namePromo = ? , code = ? , dateStart = ?, dateEnd = ?, saleOff = ?, reduceMax = ? WHERE idPromo = ?";
            PreparedStatement p = PromotionDAL.getConnection().prepareStatement(query);
            p.setString(1, pr.getNamePromo());
            p.setString(2, pr.getCode());
            p.setString(3, pr.getDateStart());
            p.setString(4, pr.getDateEnd());
            p.setFloat(5, pr.getSaleOff());
            p.setFloat(6, pr.getReduceMax());
            p.setString(7, pr.getIdPromo());
            
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
}

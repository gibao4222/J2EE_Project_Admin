/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.PromotionDetailModel;
import java.util.ArrayList;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class PromotionDetailDAL extends MyDatabaseManager{
    public PromotionDetailDAL (){
        PromotionDetailDAL.connectDB();
    }
    
    public ArrayList readPromotionDetailByIdPromo(String idPromo){
         ArrayList<PromotionDetailModel> list = new ArrayList<>();
        try {
           
            String query = "SELECT * FROM promotiondetail WHERE idPromotion ='"+idPromo+"'";
            ResultSet rs = PromotionDetailDAL.doReadQuery(query);
            while(rs.next()){
                PromotionDetailModel pd = new PromotionDetailModel();
                pd.setIdProduct(rs.getString("idProduct"));
                pd.setIdPromotion(rs.getString("idPromotion"));
                pd.setIdPromotionDetail(rs.getString("idPromotionDetail"));
                
                list.add(pd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    public String getIdProductByIdPromo(String idPromo){
         ArrayList<String> list = new ArrayList<>();
        try {
           
            String query = "SELECT idProduct FROM promotiondetail WHERE idPromotion ='"+idPromo+"'";
            ResultSet rs = PromotionDetailDAL.doReadQuery(query);
            while(rs.next()){
                String idProduct = rs.getString("idProduct");
                
                list.add(idProduct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String strIdProduct ="";
            for (String c :list){
                strIdProduct += c+",";
            }
        
        return strIdProduct;
    }
    public int addPromotionDetail(PromotionDetailModel pd){
        int rs = 0;
        try {
            String query = "INSERT INTO promotiondetail (idPromotionDetail,idPromotion,idProduct) VALUES(?,?,?)";
            PreparedStatement p = PromotionDetailDAL.getConnection().prepareStatement(query);
            p.setString(1,pd.getIdPromotionDetail());
            p.setString(2, pd.getIdPromotion());
            p.setString(3, pd.getIdProduct());
            
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public int deletePromotionDetail(String idPromotionDetail){
        int rs = 0 ;
        try {
            String query = "DELETE FROM promotiondetail WHERE idPromotion = ?";
            PreparedStatement p = PromotionDetailDAL.getConnection().prepareStatement(query);
            p.setString(1, idPromotionDetail);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
            return rs;
    }
        
    
    
    public static void main(String[] args) {
        PromotionDetailDAL p = new PromotionDetailDAL();
//        ArrayList<String> list=p.getIdProductByIdPromo("Pr001");
//        for(String pd : list){
//            System.out.println(pd);
//        }
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.subimageModel;

/**
 *
 * @author Thanhchan
 */
public class subimageDAL extends MyDatabaseManager{
     public subimageDAL() {

        subimageDAL.connectDB();
    }
     public ArrayList readsubimage()  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM subimage ";
        ResultSet rs = subimageDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                subimageModel s = new subimageModel();
                s.setIdSubImage(rs.getString("idSubImage"));
                s.setIdProduct(rs.getString(    "idProduct"));

                s.setSubImage(rs.getString("subImage"));
                s.setNote(rs.getString("note"));

                    
                list.add(s);
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
    }
     public ArrayList findsubByidpro(String id)  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM subimage Where idProduct  LIKE '%"+id+"%'";
        ResultSet rs = subimageDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                subimageModel s = new subimageModel();
                s.setIdSubImage(rs.getString("idSubImage"));
                s.setIdProduct(rs.getString(    "idProduct"));

                s.setSubImage(rs.getString("subImage"));
                s.setNote(rs.getString("note"));

                    
                list.add(s);
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
    }
      public int insertsubimage(subimageModel ps){
          int result = 0;
          try{
        String query = "Insert subimage (idSubImage,idProduct,subImage,note) VALUES (?,?,?,?)";
        PreparedStatement p = subimageDAL.getConnection().prepareStatement(query);
        p.setString(2, ps.getIdProduct());
                p.setString(3, ps.getSubImage());
                                p.setString(4, ps.getNote());

                p.setString(1,ps.getIdSubImage());
        result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public int deletesubimage(String id) {
           int result = 0 ;
           try{
        String query = "DELETE FROM subimage WHERE idSubImage =?";
        PreparedStatement p = subimageDAL.getConnection().prepareStatement(query);
        p.setString(1, id);
         result = p.executeUpdate();
         } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public ArrayList findsubimage(int id)  {
           ArrayList list = new ArrayList();
           try{
        String query = "SELECT * FROM subimage WHERE idProduct  = " + id + " ";
        PreparedStatement p = subimageDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
        if (rs != null) {
             subimageModel ps = new subimageModel();
            while (rs.next()) {
                             ps.setIdSubImage(rs.getString("idSubImage"));

                ps.setIdProduct(rs.getString("idProduct"));
                ps.setSubImage(rs.getString("subImage"));
                                ps.setNote(rs.getString("note"));

               
            }
            System.out.println(ps.getSubImage());
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
        
    }
       public int updatesubimage(subimageModel ps, String id) {
           int result = 0 ;
           try{
        String query = "Update subimage SET idProduct = ?, subImage=? , note=?"
                + " WHERE idSubImage    = ?";
        PreparedStatement p = subimageDAL.getConnection().prepareStatement(query);
        p.setString(1, ps.getIdProduct());
                p.setString(2, ps.getSubImage());

                        p.setString(3, ps.getNote());

        
                p.setString(4, String.valueOf(id));


         result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public static void main(String[] args) {
           subimageDAL  s= new subimageDAL();
                
        List<subimageModel> list = s.findsubByidpro("sp001");
           System.out.println(list.get(0).getIdSubImage());
           subimage sub = new subimage();
s.deletesubimage("SB002");
    }
}

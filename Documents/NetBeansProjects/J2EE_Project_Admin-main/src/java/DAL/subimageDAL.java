/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
                subimage s = new subimage();
                s.setIdSubImage(rs.getInt("idSubImage"));
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
      public int insertsubimage(subimage ps){
          int result = 0;
          try{
        String query = "Insert subimage (idProduct,subImage,note) VALUES (?,?,?)";
        PreparedStatement p = subimageDAL.getConnection().prepareStatement(query);
        p.setString(2, ps.getSubImage());
                p.setString(3, ps.getNote());

                p.setString(1,ps.getIdProduct());
        result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public int deletesubimage(int id) {
           int result = 0 ;
           try{
        String query = "DELETE FROM subimage WHERE idSubImage    = ?";
        PreparedStatement p = subimageDAL.getConnection().prepareStatement(query);
        p.setInt(1, id);
         result = p.executeUpdate();
         } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public subimage findsubimage(int id)  {
            subimage ps = new subimage();
           try{
        String query = "SELECT * FROM subimage WHERE idSubImage  = " + id + " ";
        PreparedStatement p = subimageDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                             ps.setIdSubImage(rs.getInt("idSubImage"));

                ps.setIdProduct(rs.getString("idProduct"));
                ps.setSubImage(rs.getString("subImage"));
                                ps.setNote(rs.getString("note"));

               
            }
            System.out.println(ps.getSubImage());
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return ps;
        
    }
       public int updatesubimage(subimage ps, int id) {
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
                
        List<subimage> list = s.readsubimage();
           System.out.println(list.get(0).getIdSubImage());
           subimage sub = new subimage();
//           sub.setIdProduct("1");
           sub.setSubImage("c");
           sub.setNote("c");
                      sub.setIdProduct("3");

           s.updatesubimage(sub, 1);
           s.findsubimage(1);
                   
    }
}

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
public class categoryDAL extends MyDatabaseManager {
    public categoryDAL() {

        categoryDAL.connectDB();
    }
     public ArrayList readcategory()  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM category ";
        ResultSet rs = categoryDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                category s = new category();
                s.setIdCategory(rs.getInt("idCategory"));
                s.setNameCategory(rs.getString("nameCategory"));
                    
                list.add(s);
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return list;
    }
      public int insertcategory(category ps){
          int result = 0;
          try{
        String query = "Insert category (nameCategory) VALUES (?)";
        PreparedStatement p = categoryDAL.getConnection().prepareStatement(query);
        p.setString(1, ps.getNameCategory());
       
        result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public int deletecategory(int id) {
           int result = 0 ;
           try{
        String query = "DELETE FROM category WHERE idCategory   = ?";
        PreparedStatement p = categoryDAL.getConnection().prepareStatement(query);
        p.setInt(1, id);
         result = p.executeUpdate();
         } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public category findcategory(int id)  {
            category ps = new category();
           try{
        String query = "SELECT * FROM category WHERE idCategory = " + id + " ";
        PreparedStatement p = categoryDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
        if (rs != null) {
            while (rs.next()) {
                ps.setIdCategory(rs.getInt("idCategory"));
                ps.setNameCategory(rs.getString("nameCategory"));
               
            }
            System.out.println(ps.getNameCategory());
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return ps;
        
    }
       public int updatecategory(category ps, int id) {
           int result = 0 ;
           try{
        String query = "Update category SET nameCategory = ?"
                + " WHERE idCategory   = ?";
        PreparedStatement p = categoryDAL.getConnection().prepareStatement(query);
        p.setString(1, ps.getNameCategory());
        
                p.setString(2, String.valueOf(id));


         result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
      public static void main(String[] args) {
        categoryDAL p = new categoryDAL();
       
         List<category> list  =  p.readcategory();
         System.out.println(list.get(0).getIdCategory());
         category ca = new category();
//         ca.setNameCategory("aaaaaa");
//         p.insertcategory(ca);

    ca.setIdCategory(1);
    category ps = new category();
    p.findcategory(1);
    ps.setNameCategory("cc");
    p.updatecategory(ps, 4);
          

          

    }
}

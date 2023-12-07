/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.SubImgModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class SubImageDAL extends  MyDatabaseManager{
    public SubImageDAL(){
        SubImageDAL.connectDB();
    }
    public ArrayList readsubimage()  {
          ArrayList list = new ArrayList();
         try {
                 
            
        String query = "SELECT * FROM subimage ";
        ResultSet rs = SubImageDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                SubImgModel s = new SubImgModel();
                s.setIdSubImage(rs.getString("idSubImage"));
                s.setIdProduct(rs.getString("idProduct"));

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
        ResultSet rs = SubImageDAL.doReadQuery(query);
       

        if (rs != null) {
            while (rs.next()) {
                SubImgModel s = new SubImgModel();
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
      public int insertsubimage(SubImgModel ps){
          int result = 0;
          try{
        String query = "Insert subimage (idSubImage,idProduct,subImage,note) VALUES (?,?,?,?)";
        PreparedStatement p = SubImageDAL.getConnection().prepareStatement(query);
        p.setString(1, ps.getIdSubImage());
        p.setString(2,ps.getIdProduct());
        p.setString(3, ps.getSubImage());
        p.setString(4, ps.getNote());

        result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
    public int deletesubimage(String id) {
        int result = 0 ;
        try{
            String query = "DELETE FROM subimage WHERE idSubImage    = ?";
            PreparedStatement p = SubImageDAL.getConnection().prepareStatement(query);
            p.setString(1, id);
            result = p.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
    public int deletesubimagebyidPro(String id) {
        int result = 0 ;
        try{
            String query = "DELETE FROM subimage WHERE idProduct    = ?";
            PreparedStatement p = SubImageDAL.getConnection().prepareStatement(query);
            p.setString(1, id);
            result = p.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
        return result;
    }
       public ArrayList findsubimage(String id)  {
           ArrayList list = new ArrayList();
           try{
        String query = "SELECT * FROM subimage WHERE idProduct  = " + id + " ";
        PreparedStatement p = SubImageDAL.getConnection().prepareStatement(query);
        ResultSet rs = p.executeQuery();
        if (rs != null) {
             SubImgModel ps = new SubImgModel();
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
       public int updatesubimage(SubImgModel ps, String id) {
           int result = 0 ;
           try{
        String query = "Update subimage SET idProduct = ?, subImage=? , note=?"
                + " WHERE idSubImage    = ?";
        PreparedStatement p = SubImageDAL.getConnection().prepareStatement(query);
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
        SubImageDAL sub = new SubImageDAL();
        SubImgModel model = new SubImgModel("SU001", "meme6.jpg", "", "PR019");
        if(sub.insertsubimage(model)!=0){
            System.out.println("insert success");
        }
        else System.out.println("insert fail");
    }
}

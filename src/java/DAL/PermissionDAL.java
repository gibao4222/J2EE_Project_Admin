/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Model.PermissionModel;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class PermissionDAL extends MyDatabaseManager{

    public PermissionDAL(){
        PermissionDAL.connectDB();
    }
    
    public ArrayList readPermission(){
        ArrayList<PermissionModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM permission";
            ResultSet rs =PermissionDAL.doReadQuery(query);
            
             if(rs!=null){
                 while (rs.next()) {                     
                     PermissionModel pe = new PermissionModel();
                     pe.setIdPermission(rs.getString("idPermission"));
                     pe.setNamePermission(rs.getString("namePermission"));
                     pe.setPortray(rs.getString("portray"));
                     
                     list.add(pe);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public static void main(String[] args) throws ClassNotFoundException {
        PermissionDAL pe = new PermissionDAL();
        ArrayList<PermissionModel> ls = pe.readPermission();
        System.out.println(ls.size());
        for(PermissionModel p :ls){
            System.out.println(p.getIdPermission());
        }
    }
}

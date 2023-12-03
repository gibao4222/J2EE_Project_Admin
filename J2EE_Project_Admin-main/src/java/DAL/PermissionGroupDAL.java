/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import model.PermissionGroupModel;
import java.util.ArrayList;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class PermissionGroupDAL extends MyDatabaseManager{
    public PermissionGroupDAL(){
        PermissionGroupDAL.connectDB();
    }
    public ArrayList readPermissionGroup(){
        ArrayList<PermissionGroupModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM permissiongroup";
            ResultSet rs = PermissionGroupDAL.doReadQuery(query);
            
            if(rs!=null){
                while(rs.next()){
                    PermissionGroupModel pg = new PermissionGroupModel();
                    pg.setIdGroup(rs.getString("idGroup"));
                    pg.setNameGroup(rs.getString("nameGroup"));
                    pg.setPortray(rs.getString("portray"));
                    pg.setListPermission(rs.getString("listPermission"));
                    
                    list.add(pg);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public int addPermissionGroup(PermissionGroupModel pg){
        int rs = 0;
        try {
            String query = "INSERT INTO permissiongroup (idGroup,nameGroup,portray,listPermission) VALUES(?,?,?,?)";
            PreparedStatement p = PermissionGroupDAL.getConnection().prepareStatement(query);
            p.setString(1, (new CreateID("GP")).create());
            p.setString(2, pg.getNameGroup());
            p.setString(3, pg.getPortray());
            p.setString(4, pg.getListPermission());
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public int deletePermissionGroup(String idGroup){
        int rs = 0;
        try {
            String query = "DELETE FROM permissiongroup WHERE idGroup = ?";
            PreparedStatement p = PermissionGroupDAL.getConnection().prepareStatement(query);
            p.setString(1, idGroup);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public int updatePermissionGroup(PermissionGroupModel pg){
        int rs = 0;
        try {
            String query = "UPDATE permissiongroup SET nameGroup = ? , portray = ? , listPermission = ? WHERE idGroup = ?";
            PreparedStatement p = PermissionGroupDAL.getConnection().prepareStatement(query);
            p.setString(1, pg.getNameGroup());
            p.setString(2, pg.getPortray());
            p.setString(3, pg.getListPermission());
            p.setString(4, pg.getIdGroup());
            
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
    
    public static void main(String[] args) {
        PermissionGroupDAL pg = new PermissionGroupDAL();
//        ArrayList<PermissionGroupModel> ls = pg.readPermissionGroup();
//        for(PermissionGroupModel p : ls){
//            System.out.println(p.getIdGroup());
//        }
        PermissionGroupModel p = new PermissionGroupModel("PG006","hello","Hi","XinChao");
        System.out.println(pg.updatePermissionGroup(p));
    }
}

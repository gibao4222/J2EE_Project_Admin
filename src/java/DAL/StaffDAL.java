package DAL;


import DAL.MyDatabaseManager;
import Model.StaffModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author LENOVO
 */
public class StaffDAL extends MyDatabaseManager{
    public StaffDAL (){
        StaffDAL.connectDB();
    }
     public ArrayList readStaff(){
        ArrayList<StaffModel> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM staff";
            ResultSet rs =StaffDAL.doReadQuery(query);
            if(rs!=null){
                 while (rs.next()) {                     
                    StaffModel staff = new StaffModel();
                    staff.setIdStaff(rs.getString("idStaff"));
                    staff.setEmail(rs.getString("email"));
                    staff.setFullName(rs.getString("fullName"));
                    staff.setAddress(rs.getString("address"));
                   staff.setNumberPhone(rs.getString("numberPhone"));
                   staff.setBankAccount(rs.getString("bankAccount"));
                   staff.setAccountNumber(rs.getString("accountNumber"));
                   staff.setIdGroup(rs.getString("idGroup"));
                   list.add(staff);
                 }
             }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
//     Thêm nhân viên //
     public int addStaff(StaffModel staff) {
         int rs = 0;
         try {
              String query = "INSERT INTO staff ( idStaff ,email , fullName, address, numberPhone, bankAccount, accountNumber, idGroup) "
                 + " VALUES (?,? , ?,?, ?, ?, ?,?);";
                PreparedStatement p = StaffDAL.getConnection().prepareStatement(query);
                p.setString(1, staff.getIdStaff());
                p.setString(2, staff.getEmail());
                p.setString(3, staff.getFullName());
                p.setString(4, staff.getAddress());
                p.setString(5,staff.getNumberPhone());
                p.setString(6, staff.getBankAccount());
                p.setString(7, staff.getAccountNumber());
                p.setString(8, staff.getIdGroup());
                rs = p.executeUpdate();
         } catch (Exception e) {
             e.printStackTrace();
         }               
     return rs;
     }
//     update staff //
 
    
    public int updateStaff(StaffModel staff){
        int rs = 0;
        try {
            String query = "UPDATE staff  "
                    + "SET email =?, fullName = ?, address = ?,"
                    + " numberPhone = ?, bankAccount = ?, accountNumber = ?, idGroup = ? "
                    + "WHERE staff.idStaff = ?;";
              PreparedStatement p = StaffDAL.getConnection().prepareStatement(query);
                p.setString(1, staff.getEmail());
                p.setString(2, staff.getFullName());
                p.setString(3, staff.getAddress());
                p.setString(4,staff.getNumberPhone());
                p.setString(5, staff.getBankAccount());
                p.setString(6, staff.getAccountNumber());
                p.setString(7, staff.getIdGroup());
                p.setString(8, staff.getIdStaff());

            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
//    delete staff //
        public int deleteStaff(String idStaff){
        int rs = 0;
        try {
            String query = "DELETE FROM staff WHERE idStaff = ?";
            PreparedStatement p = StaffDAL.getConnection().prepareStatement(query);
            p.setString(1, idStaff);
            rs = p.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }
        
}

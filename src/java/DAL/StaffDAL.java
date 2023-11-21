/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import Model.StaffModel;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Admin
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
                   staff.setPosition(rs.getString("position"));
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
              String query = "INSERT INTO staff ( idStaff ,email , fullName, address, numberPhone, bankAccount, accountNumber, position) "
                 + " VALUES (?,? , ?,?, ?, ?, ?,?);";
                PreparedStatement p = StaffDAL.getConnection().prepareStatement(query);
                p.setString(1, staff.getIdStaff());
                p.setString(2, staff.getEmail());
                p.setString(3, staff.getFullName());
                p.setString(4, staff.getAddress());
                p.setString(5,staff.getNumberPhone());
                p.setString(6, staff.getBankAccount());
                p.setString(7, staff.getAccountNumber());
                p.setString(8, staff.getPosition());
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
                    + " numberPhone = ?, bankAccount = ?, accountNumber = ?, position = ? "
                    + "WHERE staff.idStaff = ?;";
              PreparedStatement p = StaffDAL.getConnection().prepareStatement(query);
                p.setString(1, staff.getEmail());
                p.setString(2, staff.getFullName());
                p.setString(3, staff.getAddress());
                p.setString(4,staff.getNumberPhone());
                p.setString(5, staff.getBankAccount());
                p.setString(6, staff.getAccountNumber());
                p.setString(7, staff.getPosition());
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
        public StaffModel searchStaff(String idStaff){
            StaffModel st = new StaffModel();
            try {
                String query = "SELECT * FROM staff WHERE idStaff ='"+idStaff+"'";
                ResultSet rs =StaffDAL.doReadQuery(query);
                if(rs!=null){
                    while(rs.next()){
                        st.setIdStaff(rs.getString("idStaff"));
                        st.setEmail(rs.getString("email"));
                        st.setFullName(rs.getString("fullName"));
                        st.setAddress(rs.getString("address"));
                        st.setNumberPhone(rs.getString("numberPhone"));
                        st.setBankAccount(rs.getString("bankAccount"));
                        st.setAccountNumber(rs.getString("accountNumber"));
                        st.setPosition(rs.getString("position"));
                    }
                }
                else{
                    System.out.println("ko co gi ca");
                }
            } catch (Exception e) {
            }
            return st;
        }
        
        public int checktk(String email)  {
           int kq=0;
           try{
        String query = "SELECT * FROM account WHERE email  LIKE '%"+email+"%'";
       
        ResultSet rs = AccountDAL.doReadQuery(query);
          if (rs.next()) {
              kq=1;
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return kq;
    }
        public static void main(String[] args) {
        StaffDAL stDAL = new StaffDAL();
        StaffModel st = stDAL.searchStaff("ST001");
            System.out.println(st.getFullName());
    }
}

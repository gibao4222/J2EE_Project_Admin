/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Thanhchan
 */
public class historyPromoDAL extends MyDatabaseManager {
    public historyPromoDAL() {

        historyPromoDAL.connectDB();
    }
    
       public int checkPromo(int idCustomer,String namePro)  {
           int kq = 0;
            historyPromo ps = new historyPromo();
           try{
        String query = "SELECT * FROM history_promo WHERE idCustomer  = " + idCustomer + " and  namePro = '"+namePro+"' ";
        ResultSet rs = productDAL.doReadQuery(query);
        if (rs != null) {
            while (rs.next()) {
               
                ps.setIdidCustomer(rs.getInt("idCustomer"));
                ps.setNamePro(rs.getString("namePro"));
               kq = 1;
            }
        }
         } catch (Exception e) {
             System.out.println(e);
             }
        return kq;
    }
        public int insertHistoryPromo(historyPromo ps){
          int result = 0;
          try{
        String query = "Insert history_promo (idCustomer, namePro) VALUES (?,?)";
        PreparedStatement p = productDAL.getConnection().prepareStatement(query);
        p.setInt(1, ps.getIdidCustomer());
        p.setString(2, ps.getNamePro());
        
                                        
        result = p.executeUpdate();
        } catch (Exception e) {
             System.out.println(e);
             }
        return result;
    }
       public static void main(String[] args) {
        historyPromoDAL his = new historyPromoDAL();
        historyPromo h = new historyPromo();
        h.setIdidCustomer(3);
        h.setNamePro("abc");
     his.insertHistoryPromo(h);
       }
}

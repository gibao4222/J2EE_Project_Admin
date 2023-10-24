/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
public class CreateID extends MyDatabaseManager{
    private String headerID,footerID;

    public CreateID(String headerID) {
        CreateID.connectDB();
        this.headerID = headerID;
        
    }

    public CreateID() {
    }

    public String getHeaderID() {
        return headerID;
    }

    public void setHeaderID(String headerID) {
        this.headerID = headerID;
    }

    public String getFooterID() {
        return footerID;
    }

    public void setFooterID(String footerID) {
        this.footerID = footerID;
    }
    
    
    public String create(){
        int count=0;
        try {
            String query="";
        switch(headerID){
            case "PE":
                query = "SELECT * FROM permission";
                break;
            case "GP":
                query = "SELECT * FROM permissiongroup";
                break;
            case "ST":
                query = "SELECT * FROM staff";
                break;
            case "OD":
                query = "SELECT * FROM orders";
                break;
            case "DT":
                query = "SELECT * FROM orderdetail";
                break;
            case "IP":
                query = "SELECT * FROM import";
                break;
                  case "ID":
                query = "SELECT * FROM importdetail";
                break;
            default:
        
        }
        ResultSet rs = CreateID.doReadQuery(query);
        if(rs!=null){
            while(rs.next())
                count++;
        }
        count++;
        if(count<10)
            return headerID+"00"+count;
        else if(10<=count && count<100)
            return headerID+"0"+count;
        
        } catch (Exception e) {
        }
        return headerID+count;
    }
    
    public static void main(String[] args) {
        CreateID cre = new CreateID("PE");
        System.out.println(cre.create());
    }
}

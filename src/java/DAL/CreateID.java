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
        int max=0;
        try {
            String query="";
        switch(headerID){
            case "PE":
                query = "SELECT * FROM permission";
                break;
            case "GP":
                query = "SELECT * FROM permissiongroup";
                break;
            case "Pr":
                query = "SELECT * FROM promotion";
                break;
            case "PR":
                query = "SELECT * FROM product";
                break;
            case "ST":
                query = "SELECT * FROM staff";
                break;
            case "CT":
                 query = "SELECT * FROM customer";
                break;
            case "TK":
                query="SELECT * FROM account";
                break;

            case "PD":
                query = "SELECT * FROM promotiondetail";

                break;
            case "CA":
                query = "SELECT * FROM category";
                break;
            case "SU":
                query = "SELECT * FROM supplier";
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
        
            if(rs== null)System.out.println("null");
        if(rs!=null){
            while(rs.next()){
                String id = rs.getString(1);
                System.out.println(id);
                String numbers = "";
                for(int i = 0 ; i < id.length();i++){
                    char c = id.charAt(i);
                    if(Character.isDigit(c))
                        numbers+=c;
                }
                if(Integer.parseInt(numbers) > max)
                    max = Integer.parseInt(numbers); 
            }
                
        }
        max++;
        if(max<10)
            return headerID+"00"+max;
        else if(10<=max && max<100)
            return headerID+"0"+max;
        
        } catch (Exception e) {
        }
        return headerID+max;
    }
    
    public static void main(String[] args) {
        CreateID cre = new CreateID("TK");
        System.out.println(cre.create());
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author trinh
 */
public class Order {
 String idOrders;
     String idCustomer;
     int status;
     String dateCreated;
     String totalBill;

    public Order(String idOrders, String idCustomer, int status, String dateCreated, String totalBill) {
        this.idOrders = idOrders;
        this.idCustomer = idCustomer;
        this.status = status;
        this.dateCreated = dateCreated;
        this.totalBill = totalBill;
    }

    Order() {
       
    }

 

    public String getIdOrders() {
        return idOrders;
    }

    public void setIdOrders(String idOrders) {
        this.idOrders = idOrders;
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getTotalBill() {
        return totalBill;
    }

    public void setTotalBill(String totalBill) {
        this.totalBill = totalBill;
    }

   
}

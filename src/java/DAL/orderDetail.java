/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author trinh
 */
public class orderDetail {
   String idOrderDetail;
   String idOrder;
   String idProduct;
   String dateCreated;
   String quantity;
    String total;
   String price;
 String idSale;

    public orderDetail(String idOrderDetail, String idOrder, String idProduct, String dateCreated, String quantity, String total, String price, String idSale) {
        this.idOrderDetail = idOrderDetail;
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.dateCreated = dateCreated;
        this.quantity = quantity;
        this.total = total;
        this.price = price;
        this.idSale = idSale;
    }

    orderDetail() {
        
    }

    public String getIdOrderDetail() {
        return idOrderDetail;
    }

    public void setIdOrderDetail(String idOrderDetail) {
        this.idOrderDetail = idOrderDetail;
    }

    public String getIdOrder() {
        return idOrder;
    }

    public void setIdOrder(String idOrder) {
        this.idOrder = idOrder;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getIdSale() {
        return idSale;
    }

    public void setIdSale(String idSale) {
        this.idSale = idSale;
    }

   
    
   
    
}

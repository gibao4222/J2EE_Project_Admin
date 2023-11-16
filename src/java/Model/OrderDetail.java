/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author trinh
 */
public class OrderDetail {
    String idOrderDetail, idOrder, idProduct,quantity,total, idSale;
    Date dateCreated;
    float price;

    public OrderDetail(String idOrderDetail, String idOrder, String idProduct, String quantity, String total, String idSale, Date dateCreated, float price) {
        this.idOrderDetail = idOrderDetail;
        this.idOrder = idOrder;
        this.idProduct = idProduct;
        this.quantity = quantity;
        this.total = total;
        this.idSale = idSale;
        this.dateCreated = dateCreated;
        this.price = price;
    }

 



    public OrderDetail() {
       
    }

    public OrderDetail(String idOrderDetail, String idOrder, String idProduct, String quantity, String total, String idSale, String dateCreated, String price) {
        
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
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

    public String getIdSale() {
        return idSale;
    }

    public void setIdSale(String idSale) {
        this.idSale = idSale;
    }
        public long getTime() {
        // Kiểm tra xem dateCreated có phải là null hay không
        if (dateCreated != null) {
            return dateCreated.getTime();
        } else {
            // Xử lý khi dateCreated là null, ví dụ, trả về một giá trị mặc định
            return 0;
        }
    }
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class ImportDetailModel {
    String idImportDetail,idImport,idProduct,dateCreated,price,total;
    int quantity;

    public ImportDetailModel(String idImportDetail, String idImport, String idProduct, String dateCreated, int quantity, String price, String total) {
        this.idImportDetail = idImportDetail;
        this.idImport = idImport;
        this.idProduct = idProduct;
        this.dateCreated = dateCreated;
        this.quantity = quantity;
        this.price = price;
        this.total = total;
    }

    
    
    
    
    public ImportDetailModel() {
    }

    public String getIdImportDetail() {
        return idImportDetail;
    }

    public void setIdImportDetail(String idImportDetail) {
        this.idImportDetail = idImportDetail;
    }

    public String getIdImport() {
        return idImport;
    }

    public void setIdImport(String idImport) {
        this.idImport = idImport;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }
}

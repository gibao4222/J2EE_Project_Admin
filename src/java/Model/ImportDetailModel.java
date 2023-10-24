/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author trinh
 */
public class ImportDetailModel {
    String idImportDetail,idImport,idProduct,dateCreated,quantity,price,total;

    public ImportDetailModel(String idImportDetail, String idImport, String idProduct, String dateCreated, String quantity, String price, String total) {
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

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class ImportModel {
     String idImport,idSupplier,	dateCreated,	totalBill;

    public ImportModel(String idImport, String idSupplier, String dateCreated, String totalBill) {
        this.idImport = idImport;
        this.idSupplier = idSupplier;
        this.dateCreated = dateCreated;
        this.totalBill = totalBill;
    }

    public ImportModel() {
       
    }

    public String getIdImport() {
        return idImport;
    }

    public void setIdImport(String idImport) {
        this.idImport = idImport;
    }

    public String getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(String idSupplier) {
        this.idSupplier = idSupplier;
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

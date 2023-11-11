/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class SupplierModel {
    String idSupplier, nameSuppiler, address, numberPhone;
    public SupplierModel(){
    }

    public SupplierModel(String idSupplier, String nameSuppiler, String address, String numberPhone) {
        this.idSupplier = idSupplier;
        this.nameSuppiler = nameSuppiler;
        this.address = address;
        this.numberPhone = numberPhone;
    }

    public String getIdSupplier() {
        return idSupplier;
    }

    public void setIdSupplier(String idSupplier) {
        this.idSupplier = idSupplier;
    }

    public String getNameSuppiler() {
        return nameSuppiler;
    }

    public void setNameSuppiler(String nameSuppiler) {
        this.nameSuppiler = nameSuppiler;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }
    
}

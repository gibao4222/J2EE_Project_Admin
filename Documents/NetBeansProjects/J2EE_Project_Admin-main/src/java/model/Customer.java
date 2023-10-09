/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thanhchan
 */
public class Customer {
        private String idCustomer;
	private String email;
        private String address;
	private String fullName;
	private String numberPhone;
    public Customer(){
        
    }

    public Customer(String idCustomer, String email, String address, String fullName, String numberPhone) {
        this.idCustomer = idCustomer;
        this.email = email;
        this.address = address;
        this.fullName = fullName;
        this.numberPhone = numberPhone;
    }

    public String getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(String idCustomer) {
        this.idCustomer = idCustomer;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }
 

        
        
                

}

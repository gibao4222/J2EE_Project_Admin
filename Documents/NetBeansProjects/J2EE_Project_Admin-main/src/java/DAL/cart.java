/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author Thanhchan
 */
public class cart {
    int idCart,idCustomer,idProduct,quantity;
    String  nameProduct;
    float pricetotal,pricePro;

    public float getPricePro() {
        return pricePro;
    }

    public void setPricePro(float pricePro) {
        this.pricePro = pricePro;
    }

    

//    

    public cart() {
    }

    public cart(int idCart, int idCustomer, int idProduct, int quantity, float pricetotal) {
        this.idCart = idCart;
        this.idCustomer = idCustomer;
        this.idProduct = idProduct;
        this.quantity = quantity;
        
        this.pricetotal = pricetotal;
    }

    public int getIdCart() {
        return idCart;
    }

    public void setIdCart(int idCart) {
        this.idCart = idCart;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public int getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(int idProduct) {
        this.idProduct = idProduct;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public float getPricetotal() {
        return pricetotal;
    }

    public void setPricetotal(float pricetotal) {
        this.pricetotal = pricetotal;
    }

    
    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class ProductModel {
    private String idProduct,idCategory,nameProduct,introduce,image,size,stuff,portray,price;
    int quantity;

    public ProductModel() {
    }

    public ProductModel(String idProduct,String idCategory, String nameProduct, String introduce, String image, String size, String stuff, String portray, int quantity, String price) {
        this.idProduct = idProduct;
        this.idCategory = idCategory;
        this.nameProduct = nameProduct;
        this.introduce = introduce;
        this.image = image;
        this.size = size;
        this.stuff = stuff;
        this.portray = portray;
        this.quantity = quantity;
        this.price = price;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getIdCategory() {
        return idCategory;
    }

    public void setIdCategory(String idCategory) {
        this.idCategory = idCategory;
    }


    
    
    public String getNameProduct() {
        return nameProduct;
    }

    public void setNameProduct(String nameProduct) {
        this.nameProduct = nameProduct;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getStuff() {
        return stuff;
    }

    public void setStuff(String stuff) {
        this.stuff = stuff;
    }

    public String getPortray() {
        return portray;
    }

    public void setPortray(String portray) {
        this.portray = portray;
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
    
}

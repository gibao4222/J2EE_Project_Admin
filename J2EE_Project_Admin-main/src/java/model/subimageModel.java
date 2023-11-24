/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Thanhchan
 */
public class subimageModel {
    String idSubImage ,idProduct,subImage,note;

    public subimageModel() {
    }

    public subimageModel(String idSubImage, String idProduct, String subImage, String note) {
        this.idSubImage = idSubImage;
        this.idProduct = idProduct;
        this.subImage = subImage;
        this.note = note;
    }

    public String getIdSubImage() {
        return idSubImage;
    }

    public void setIdSubImage(String idSubImage) {
        this.idSubImage = idSubImage;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

    public String getSubImage() {
        return subImage;
    }

    public void setSubImage(String subImage) {
        this.subImage = subImage;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
    
}

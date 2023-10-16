/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author Thanhchan
 */
public class subimage {
    int idSubImage ;
    String  subImage,note,idProduct;

    public subimage() {
    }

    public subimage(int idSubImage, String subImage, String note, String idProduct) {
        this.idSubImage = idSubImage;
        this.subImage = subImage;
        this.note = note;
        this.idProduct = idProduct;
    }

    public int getIdSubImage() {
        return idSubImage;
    }

    public void setIdSubImage(int idSubImage) {
        this.idSubImage = idSubImage;
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

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }

   
}

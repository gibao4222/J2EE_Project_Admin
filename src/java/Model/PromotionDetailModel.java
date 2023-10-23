/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */
public class PromotionDetailModel {
    String idPromotionDetail,idPromotion,idProduct;

    public PromotionDetailModel() {
    }

    
    
    public PromotionDetailModel(String idPromotionDetail, String idPromotion, String idProduct) {
        this.idPromotionDetail = idPromotionDetail;
        this.idPromotion = idPromotion;
        this.idProduct = idProduct;
    }

    public String getIdPromotionDetail() {
        return idPromotionDetail;
    }

    public void setIdPromotionDetail(String idPromotionDetail) {
        this.idPromotionDetail = idPromotionDetail;
    }

    public String getIdPromotion() {
        return idPromotion;
    }

    public void setIdPromotion(String idPromotion) {
        this.idPromotion = idPromotion;
    }

    public String getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(String idProduct) {
        this.idProduct = idProduct;
    }
    
}

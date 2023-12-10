/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class PromotionModel {
    String idSale ,namePromo;
    String dateStart,dateEnd;
    float saleOff, reduceMax;

    public PromotionModel() {
    }

    public PromotionModel(String idSale, String namePromo, String dateStart, String dateEnd, float saleOff, float reduceMax) {
        this.idSale = idSale;
        this.namePromo = namePromo;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.saleOff = saleOff;
        this.reduceMax = reduceMax;
    }

    public String getIdSale() {
        return idSale;
    }

    public void setIdSale(String idSale) {
        this.idSale = idSale;
    }

    public String getNamePromo() {
        return namePromo;
    }

    public void setNamePromo(String namePromo) {
        this.namePromo = namePromo;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }

    public float getSaleOff() {
        return saleOff;
    }

    public void setSaleOff(float saleOff) {
        this.saleOff = saleOff;
    }

    public float getReduceMax() {
        return reduceMax;
    }

    public void setReduceMax(float reduceMax) {
        this.reduceMax = reduceMax;
    }

    
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class PromotionModel {
    String idPromo,namePromo,code;
    Date dateStart,dateEnd;
    float saleOff, reduceMax;

    public PromotionModel() {
    }

    public PromotionModel(String idPromo, String namePromo, String code, Date dateStart, Date dateEnd, float saleOff, float reduceMax) {
        this.idPromo = idPromo;
        this.namePromo = namePromo;
        this.code = code;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.saleOff = saleOff;
        this.reduceMax = reduceMax;
    }

    public String getIdPromo() {
        return idPromo;
    }

    public void setIdPromo(String idPromo) {
        this.idPromo = idPromo;
    }

    public String getNamePromo() {
        return namePromo;
    }

    public void setNamePromo(String namePromo) {
        this.namePromo = namePromo;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
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

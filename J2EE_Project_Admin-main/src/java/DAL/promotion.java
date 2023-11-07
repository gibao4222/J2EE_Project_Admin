/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import java.time.LocalDate;
/**
 *
 * @author Thanhchan
 */
public class promotion {
    String idSale , namePromo,terms;
    LocalDate dateStart, dateEnd;
    Float saleOff,priceMax;

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

    public String getTerms() {
        return terms;
    }

    public void setTerms(String terms) {
        this.terms = terms;
    }

    public LocalDate getDateStart() {
        return dateStart;
    }

    public void setDateStart(LocalDate dateStart) {
        this.dateStart = dateStart;
    }

    public LocalDate getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(LocalDate dateEnd) {
        this.dateEnd = dateEnd;
    }

    public Float getSaleOff() {
        return saleOff;
    }

    public void setSaleOff(Float saleOff) {
        this.saleOff = saleOff;
    }

    public Float getPriceMax() {
        return priceMax;
    }

    public void setPriceMax(Float priceMax) {
        this.priceMax = priceMax;
    }

    public promotion(String idSale, String namePromo, String terms, LocalDate dateStart, LocalDate dateEnd, Float saleOff, Float priceMax) {
        this.idSale = idSale;
        this.namePromo = namePromo;
        this.terms = terms;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.saleOff = saleOff;
        this.priceMax = priceMax;
    }

    public promotion() {
    }
}

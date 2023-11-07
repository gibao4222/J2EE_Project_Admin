/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

/**
 *
 * @author Thanhchan
 */
public class historyPromo {
    int ididCustomer	;
    String namePro;

    public historyPromo() {
    }

    public historyPromo(int ididCustomer, String namePro) {
        this.ididCustomer = ididCustomer;
        this.namePro = namePro;
    }

    public int getIdidCustomer() {
        return ididCustomer;
    }

    public void setIdidCustomer(int ididCustomer) {
        this.ididCustomer = ididCustomer;
    }

    public String getNamePro() {
        return namePro;
    }

    public void setNamePro(String namePro) {
        this.namePro = namePro;
    }

    
    
}

package components;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admin
 */


public class ButtonComponent{
    private String label;
    private String cl;
    public ButtonComponent(String label,String cl){
        this.label=label;
        this.cl=cl;
    }
    public String generateHTML(){
        return"<button class='"+cl+"'>"+label+"</button>";
    }
}

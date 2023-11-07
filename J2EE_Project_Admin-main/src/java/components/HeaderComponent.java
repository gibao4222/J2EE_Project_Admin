/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package components;

/**
 *
 * @author Admin
 */
public class HeaderComponent {
    private String label;
    private String cl;
    private String icon1,icon2;
    public HeaderComponent(String label,String icon1,String icon2,String cl){
        this.label= label;
        this.icon1=icon1;
        this.icon2=icon2;
        this.cl=cl;
    }
    public String generateHTML(){
        return "<div class='"+cl+"'>"
                + "<h1 class='labelHeader'>"+label+"</h1>"
                +"<div id='iconHeader'>"
                +"  "+icon1
                +"  "+icon2
                   +"<h1><a href="+"Logout"+">Logout</a></h1>"
                + "</div>"
             
                + "</div>";
    }
}



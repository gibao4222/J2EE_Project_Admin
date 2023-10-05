/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package components;

/**
 *
 * @author Admin
 */
public class TableComponent {
    private String nameTable;
//    private String row;
    public TableComponent(String nameTable) {
        this.nameTable=nameTable;
    }

    public String generateHTML(){
        return "<main class=\"table\">"
                + "<section class=\"table__header\""
                + " <h1>"+nameTable+"</h1>"
                + " <div class=\"input-group\">\n" +
"                       <input type=\"search\" placeholder=\"Search Data...\">\n" +
"                       <img src=\"images/search.png\" alt=\"\">\n" +
"                   </div>"
                + " <div class=\"export__file\">\n" +
"                       <label for=\"export-file\" class=\"export__file-btn\" title=\"Export File\"></label>\n" +
"                       <input type=\"checkbox\" id=\"export-file\">\n" +
"                       <div class=\"export__file-options\">\n" +
"                           <label>Export As &nbsp; &#10140;</label>\n" +
"                           <label for=\"export-file\" id=\"toPDF\">PDF <img src=\"images/pdf.png\" alt=\"\"></label>\n" +
"                           <label for=\"export-file\" id=\"toJSON\">JSON <img src=\"images/json.png\" alt=\"\"></label>\n" +
"                           <label for=\"export-file\" id=\"toCSV\">CSV <img src=\"images/csv.png\" alt=\"\"></label>\n" +
"                           <label for=\"export-file\" id=\"toEXCEL\">EXCEL <img src=\"images/excel.png\" alt=\"\"></label>\n" +
"                       </div>\n" +
"                    </div>"
                + "</section>"
                + "<section class=\"table__body\">"
                + " <table>"
                + "     <thead>"
                + "         <tr>\n" +
"                               <th> Id <span class=\"icon-arrow\">&UpArrow;</span></th>\n" +
"                               <th> Customer <span class=\"icon-arrow\">&UpArrow;</span></th>\n" +
"                               <th> Location <span class=\"icon-arrow\">&UpArrow;</span></th>\n" +
"                               <th> Order Date <span class=\"icon-arrow\">&UpArrow;</span></th>\n" +
"                               <th> Status <span class=\"icon-arrow\">&UpArrow;</span></th>\n" +
"                               <th> Amount <span class=\"icon-arrow\">&UpArrow;</span></th>\n" +
"                           </tr>"
                + "     </thead>"
                + "     <tbody>"
                + "         <tr>\n" +
"                               <td> 1 </td>\n" +
"                               <td> <img src=\"images/Zinzu Chan Lee.jpg\" alt=\"\">Zinzu Chan Lee</td>\n" +
"                               <td> Seoul </td>\n" +
"                               <td> 17 Dec, 2022 </td>\n" +
"                               <td>\n" +
"                                   <p class=\"status delivered\">Delivered</p>\n" +
"                               </td>\n" +
"                               <td> <strong> $128.90 </strong></td>\n" +
"                           </tr>"
                + "         <tr>\n" +
"                               <td> 9</td>\n" +
"                               <td><img src=\"images/Alex Gonley.jpg\" alt=\"\"> Alson GC </td>\n" +
"                               <td> Dhaka </td>\n" +
"                               <td> 22 Dec, 2023 </td>\n" +
"                               <td>\n" +
"                                   <p class=\"status cancelled\">Cancelled</p>\n" +
"                               </td>\n" +
"                               <td> <strong>$249.99</strong> </td>\n" +
"                           </tr>"
                +"      </tbody>"
                + " </table>"
                + "</section>"
                + "</main>";
    }
}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.ResultSet;

/**
 *
 * @author Admin
 */
@WebServlet(name="LoginServlet", urlPatterns={"/Login"})
public class LoginServlet extends HttpServlet{
   Connect connect = new Connect();
   public LoginServlet(){
       connect.openConnection();
   }
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            String tentbao = request.getParameter("txtThuebao");
//            ResultSet rs=null;
//            if(tentbao != null && tentbao.length()!=0)
//                rs = read(tentbao);
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");  
            out.println("</head>");
            out.println("<body>");
//            out.println("<h1>Kết quả tra điện thoại theo yêu cầu của bạn :</h1>");
//            out.println("<table border=1 cellPadding=1 cellSpacing=1>");
//            try{
//            out.println("<tr><th>Số thứ tự</th><th>Tên thuê bao</th><th>Số điện thoại</th><th>Địa chỉ</th></tr>\n");
//                if(rs!=null){
//                    for(int i=1;rs.next();){
//                        out.println("<tr>"+"<td>"+i+"</td>"+"<td>"+rs.getString(2)+"</td>"
//                        +"<td>"+rs.getString(3)+"</td>"
//                        +"<td>"+rs.getString(4)+"</td> </tr>\n");
//                    }
//                    out.println("</table>");
//                    rs.close();
//                    connect.stmt.close();
//                    connect.con.close();
//                }
//            out.println("</body>");
//            out.println("</html>");
//            }catch(Exception e){
//                out.println("Error:"+e);
//            }
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
//    public ResultSet read(String tentbao){
//        String newSQL = "SELECT * FROM customer"+ " WHERE TenThueBao like '%" + tentbao + "%'";
//        ResultSet rs = connect.doReadQuery(newSQL);
//        return rs;
//    }
}

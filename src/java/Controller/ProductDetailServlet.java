/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.ProductDAL;
import DAL.SubImageDAL;
import DAL.categoryDAL;
import Model.ProductModel;
import Model.SubImgModel;
import Model.category;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Admin
 */
@WebServlet({"/productDetail","/update-quantity",})
public class ProductDetailServlet extends HttpServlet {
   
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductDetailServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        ProductDAL proDAL = new ProductDAL();
        String idPro = request.getParameter("idProduct");
        ProductModel pro = proDAL.findproductbyId_Product(idPro);
        categoryDAL cateDAL = new  categoryDAL();
        category cate = cateDAL.findcategory(pro.getIdCategory());
        List<category> cateList = cateDAL.readcategory();
        request.setAttribute("cate", cateList);
        request.setAttribute("productDetail", pro);
        request.setAttribute("category", cate.getNameCategory());
        
        SubImageDAL subimgDAL = new SubImageDAL();
        List<SubImgModel> subList = subimgDAL.findsubByidpro(idPro);
        request.setAttribute("subList", subList);
        request.getRequestDispatcher("productDetail.jsp").forward(request, response);
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
        String uri = request.getRequestURI(); 
        ProductDAL proDAL = new ProductDAL();
        if(uri.contains("update-quantity")){

            String idPro = request.getParameter("idProduct");
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            int rs = proDAL.updatePro_byQuantity(quantity, idPro);
            if(rs!=0){
                response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                   response.getWriter().write("{\"rs\": \""+rs+"\"}");
            }
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

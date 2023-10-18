/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.ProductDAL;
import DAL.PromotionDAL;
import Model.ProductModel;
import Model.PromotionModel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
@WebServlet({"/promotion","/add-Promotion","/delete-Promotion","/update-Promotion"})
public class Promotion extends HttpServlet {
   
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
            out.println("<title>Servlet Promotion</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Promotion at " + request.getContextPath () + "</h1>");
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
        PromotionDAL promo = new PromotionDAL();
        ArrayList<PromotionModel> list = promo.readPromotion();
        
        ProductDAL pro  = new ProductDAL();
        ArrayList<ProductModel> listt = pro.readProduct();
        
        
        request.setAttribute("dataProduct", listt);
        request.setAttribute("dataPromotion", list);
        request.getRequestDispatcher("promotion.jsp").forward(request, response);
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
        PromotionDAL pgDAL = new PromotionDAL();
        String url = request.getRequestURI();
        if(url.contains("add-Promotion")){
            String namePromo = String.valueOf(request.getParameter("namePromo"));
            String code = String.valueOf(request.getParameter("code"));
            String introduce = String.valueOf(request.getParameter("introduce"));
            String dateStart = String.valueOf(request.getParameter("dateStart"));
            String dateEnd = String.valueOf(request.getParameter("dateEnd"));
            
            Float saleOff = Float.valueOf(request.getParameter("saleOff"));
            Float reduceMax = Float.valueOf(request.getParameter("reduceMax"));
            PromotionModel pg = new PromotionModel(namePromo, code, dateStart, dateEnd, saleOff, reduceMax);
            pgDAL.addPromotionGroup(pg);
        }
        else if(url.contains("delete-Promotion")){
                String idPromo = String.valueOf(request.getParameter("idPromo"));
                pgDAL.deletePromotion(idPromo);
        }
        else{
            String idPromo = String.valueOf(request.getParameter("idPromo"));
            String namePromo = String.valueOf(request.getParameter("namePromo"));
            String code = String.valueOf(request.getParameter("code"));
            String introduce = String.valueOf(request.getParameter("introduce"));
            String dateStart = String.valueOf(request.getParameter("dateStart"));
            String dateEnd = String.valueOf(request.getParameter("dateEnd"));
            
            Float saleOff = Float.valueOf(request.getParameter("saleOff"));
            Float reduceMax = Float.valueOf(request.getParameter("reduceMax"));
            PromotionModel pg = new PromotionModel(idPromo, namePromo, code, dateStart, dateEnd, saleOff, reduceMax);
            pgDAL.updatePromotion(pg);
        }
        response.setContentType("application/json");
//        response.getWriter().write(jsonResponse.toString());
        request.getRequestDispatcher("permission.jsp").forward(request, response);
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
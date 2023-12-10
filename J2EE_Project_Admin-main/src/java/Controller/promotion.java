/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CreateID;
import DAL.SupplierDAL;
import DAL.promotionDAL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.PromotionModel;
import model.SupplierModel;


/**
 *
 * @author Thanhchan
 */
@WebServlet({"/promotion","/add-Promotion" ,"/delete-Promotion" ,"/update-Promotion"})
public class promotion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet promotion</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet promotion at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String url = request.getRequestURI();
          if (url.contains("promotion")) {
         promotionDAL promo = new promotionDAL();
        ArrayList<PromotionModel> list = promo.readPromotion();
         request.setAttribute("dataPromotion", list);
        request.getRequestDispatcher("promotion.jsp").forward(request, response);
          }
          
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                 String url = request.getRequestURI();

       if(url.contains("delete-Promotion")){
           promotionDAL pdDAL = new promotionDAL();
         String idPromo = String.valueOf(request.getParameter("idPromo"));
                pdDAL.deletePromotion(idPromo);
                response.sendRedirect("promotion");
        }else  if(url.contains("add-Promotion")){
            String idPromo = (new CreateID("Pr").create());
            String namePromo = String.valueOf(request.getParameter("namePromo"));
           
            
            String dateStart = String.valueOf(request.getParameter("dateStart"));
            String dateEnd = String.valueOf(request.getParameter("dateEnd"));
            
            Float saleOff = Float.valueOf(request.getParameter("saleOff"));
            Float reduceMax = Float.valueOf(request.getParameter("priceMax"));
            PromotionModel pg = new PromotionModel(idPromo, namePromo, dateStart, dateEnd, saleOff, reduceMax);
            promotionDAL pdDAL = new promotionDAL();
            pdDAL.addPromotionGroup(pg);
            response.sendRedirect("promotion");
            //Lưu PromotionDetail
           
            
        }
       else  if(url.contains("update-Promotion")){
           String idPromo = String.valueOf(request.getParameter("idPromo"));
           String namePromo = String.valueOf(request.getParameter("namePromo"));
           
            
            String dateStart = String.valueOf(request.getParameter("dateStart"));
            String dateEnd = String.valueOf(request.getParameter("dateEnd"));
            
            Float saleOff = Float.valueOf(request.getParameter("saleOff"));
            Float reduceMax = Float.valueOf(request.getParameter("priceMax"));
            PromotionModel pg = new PromotionModel(idPromo, namePromo, dateStart, dateEnd, saleOff, reduceMax);
            promotionDAL pgDAL = new promotionDAL();
            pgDAL.updatePromotion(pg);
            response.sendRedirect("promotion");
        }
           
            
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

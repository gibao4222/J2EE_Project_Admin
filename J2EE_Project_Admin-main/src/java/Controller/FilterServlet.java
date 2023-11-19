/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.categoryDAL;
import DAL.productDAL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.ProductModel;
import model.category;


/**
 *
 * @author Thanhchan
 */
@WebServlet(name = "FilterServlet", urlPatterns = {"/FilterServlet"})
public class FilterServlet extends HttpServlet {

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
            out.println("<title>Servlet FilterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FilterServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
       String option = request.getParameter("filterOption"); 
     if ("low_to_high".equals(option)) {
      productDAL p = new productDAL();
       List<ProductModel> l = p.filterMin();
      
          
        request.setAttribute("data", l);
        categoryDAL c = new categoryDAL();
         List<category> cate = c.readcategory();
                   
         request.setAttribute("cate", cate);
        request.getRequestDispatcher("homepages1.jsp").forward(request, response);
     
     }else if("high_to_low".equals(option)) {
          productDAL p = new productDAL();
       List<ProductModel> l = p.filterMax();
      
          
        request.setAttribute("data", l);
        categoryDAL c = new categoryDAL();
         List<category> cate = c.readcategory();
                   
         request.setAttribute("cate", cate);
        request.getRequestDispatcher("homepages1.jsp").forward(request, response);
     }else if("less_than_a".equals(option)) {
         int a =Integer.parseInt( request.getParameter("rangeA"));
      productDAL p = new productDAL();
       List<ProductModel> l = p.filterUnderA(a);
      
          
        request.setAttribute("data", l);
        categoryDAL c = new categoryDAL();
         List<category> cate = c.readcategory();
                   
         request.setAttribute("cate", cate);
        request.getRequestDispatcher("homepages1.jsp").forward(request, response);
     
     }else if("greater_than_a".equals(option)) {
          int a =Integer.parseInt( request.getParameter("rangeA"));
      productDAL p = new productDAL();
       List<ProductModel> l = p.filterAboveA(a);
      
          
        request.setAttribute("data", l);
        categoryDAL c = new categoryDAL();
         List<category> cate = c.readcategory();
                   
         request.setAttribute("cate", cate);
        request.getRequestDispatcher("homepages1.jsp").forward(request, response);
     }else if("range_a_b".equals(option)) {
     int a =Integer.parseInt( request.getParameter("rangeA"));
     int b=Integer.parseInt( request.getParameter("rangeB"));
      productDAL p = new productDAL();
       List<ProductModel> l = p.filterFormAtoB(a,b);
      
          
        request.setAttribute("data", l);
        categoryDAL c = new categoryDAL();
         List<category> cate = c.readcategory();
                   
         request.setAttribute("cate", cate);
        request.getRequestDispatcher("homepages1.jsp").forward(request, response);
     
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

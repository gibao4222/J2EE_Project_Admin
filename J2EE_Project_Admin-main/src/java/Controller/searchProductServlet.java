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
@WebServlet(name = "searchProductServlet", urlPatterns = {"/searchProductServlet"})
public class searchProductServlet extends HttpServlet {

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
            out.println("<title>Servlet searchProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchProductServlet at " + request.getContextPath() + "</h1>");
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
 String select = request.getParameter("filterOption"); 
     if ("name".equals(select)) {
         String name= request.getParameter("searchValue");
         productDAL p = new productDAL();
       List<ProductModel> l = p.findproductbyName(name);
      
          
        request.setAttribute("data", l);
        categoryDAL c = new categoryDAL();
         List<category> cate = c.readcategory();
                   
         request.setAttribute("cate", cate);
        request.getRequestDispatcher("homepages1.jsp").forward(request, response);
     } else if ("color".equals(select)) {
          String name= request.getParameter("searchValue");
         productDAL p = new productDAL();
       List<ProductModel> l = p.findproductbyColor(name);
      
          
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

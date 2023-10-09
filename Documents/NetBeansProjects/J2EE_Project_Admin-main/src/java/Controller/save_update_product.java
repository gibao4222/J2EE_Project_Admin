/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.product;
import DAL.productDAL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Thanhchan
 */
@WebServlet(name = "save_update_product", urlPatterns = {"/save-product"})
public class save_update_product extends HttpServlet {

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
            out.println("<title>Servlet save_update_product</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet save_update_product at " + request.getContextPath() + "</h1>");
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
         int id =Integer.parseInt(request.getParameter("IdProduct"));
         String nameProduct = request.getParameter("nameProduct");
         String introduce = request.getParameter("introduce");
         String image = request.getParameter("image");
         String size = request.getParameter("size");
         String stuff = request.getParameter("stuff");
         String quantity = request.getParameter("quantity");
         float price	 = Float.parseFloat(request.getParameter("price"));
         String portray = request.getParameter("portray");

         
            product pro = new product();
            pro.setNameProduct(nameProduct);
            pro.setIntroduce(introduce);
            pro.setImage(image);
            pro.setSize(size);
            pro.setStuff(stuff);
            pro.setQuantity(quantity);
            pro.setPrice(price);
            pro.setPortray(portray);
           
            productDAL p = new productDAL();
            p.updatePro(pro,id);
           request.setAttribute("message", "update thành công");
                      response.sendRedirect("show-product");

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
        processRequest(request, response);
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.CreateID;
import DAL.CustomerDAL;
import model.CustomerModel;
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
@WebServlet({"/customer" ,"/add-Customer","/delete-Customer","/update-Customer"})
public class Customer extends HttpServlet {
   
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
            out.println("<title>Servlet Customer</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Customer at " + request.getContextPath () + "</h1>");
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
        CustomerDAL cusDAL = new CustomerDAL();
           ArrayList<CustomerModel> st = cusDAL.readCustomer();
           request.setAttribute("listCustomer", st);
           request.getRequestDispatcher("listCustomer.jsp").forward(request, response);
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
        CustomerDAL cusDAL = new CustomerDAL();
           String url = request.getRequestURI();
           if (request.getCharacterEncoding()== null) {
            request.setCharacterEncoding("UTF-8");
            }
           if (url.contains("add-Customer")) {
               String idCustomer = new CreateID("CT").create();
               String email = String.valueOf(request.getParameter("email"));
               String fullName = String.valueOf(request.getParameter("fullName"));
               String address = String.valueOf(request.getParameter("address"));
               String phoneNumber = String.valueOf(request.getParameter("numberPhone"));                            
                CustomerModel cusModel = new CustomerModel(idCustomer, email, address, phoneNumber, fullName);
                cusDAL.addCustomer(cusModel);
                
           }
           else if(url.contains("delete-Customer")){
                String idCustomer = String.valueOf(request.getParameter("idCustomer"));
                cusDAL.deleteCustomer(idCustomer);
                
              }
           else if (url.contains("update-Customer")) {
               String idCustomer = String.valueOf(request.getParameter("idCustomer"));
               String email = String.valueOf(request.getParameter("email"));
               String fullName = String.valueOf(request.getParameter("fullName"));
               String address = String.valueOf(request.getParameter("address"));
               String phoneNumber = String.valueOf(request.getParameter("numberPhone"));
               CustomerModel cusModel = new CustomerModel(idCustomer, email, address, phoneNumber, fullName);
               cusDAL.updateCustomer(cusModel);
        }
        response.setContentType("application/json");
        
        response.sendRedirect("customer");
    
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

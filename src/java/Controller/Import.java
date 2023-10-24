/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CreateID;
import Model.ImportModel;
import DAL.ImportDAL;
import com.google.gson.JsonObject;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author trinh
 */
@WebServlet({"/Import" ,"/add-Import","/delete-Import","/update-Import"})
public class Import extends HttpServlet {

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
            out.println("<title>Servlet Import</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Import at " + request.getContextPath() + "</h1>");
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
       ImportDAL importDAL = new ImportDAL();
           ArrayList<ImportModel> ip = importDAL.readImport();
           request.setAttribute("dataImport", ip);
           request.getRequestDispatcher("listImport.jsp").forward(request, response);
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
   ImportDAL importDAL = new ImportDAL();
           String url = request.getRequestURI();
           JsonObject jsonResponse = new JsonObject();
           if (url.contains("add-Import")) {
               String idImport = new CreateID("IP").create();
               String idSupplier = String.valueOf(request.getParameter("idSupplier"));
               String dateCreated = String.valueOf(request.getParameter("dateCreated"));
               String totalBill = String.valueOf(request.getParameter("totalBill"));
                              System.out.println("hllo");
               ImportModel importModel= new ImportModel(idImport, idSupplier, dateCreated, totalBill);
               importDAL.addImport(importModel);
//                jsonResponse.addProperty("message", "Thêm  thành công rồi thk lòn");
           }
           else if(url.contains("delete-Import")){
                String idImport = String.valueOf(request.getParameter("idImport"));
                importDAL.deleteImport(idImport);
//                jsonResponse.addProperty("message", "Xóa nhóm quyền thành công");
              }
           else if (url.contains("update-Import")) {
               String idImport = String.valueOf(request.getParameter("idImport"));
            String idSupplier = String.valueOf(request.getParameter("idSupplier"));
               String dateCreated = String.valueOf(request.getParameter("dateCreated"));
               String totalBill = String.valueOf(request.getParameter("totalBill"));
                ImportModel importModel = new ImportModel(idImport, idSupplier, dateCreated, totalBill);
               importDAL.updateImport(importModel);
        }
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
response.sendRedirect("Import");
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

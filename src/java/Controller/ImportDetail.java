/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CreateID;
import DAL.ImportDetailDAL;
import Model.ImportDetailModel;
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
@WebServlet({"/ImportDetail" ,"/add-ImportDetail","/delete-ImportDetail","/update-ImportDetail"})
public class ImportDetail extends HttpServlet {

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
            out.println("<title>Servlet ImportDetail</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportDetail at " + request.getContextPath() + "</h1>");
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
     ImportDetailDAL importDetailDAL = new ImportDetailDAL();
           ArrayList<ImportDetailModel> id = importDetailDAL.readImportDetail();
           request.setAttribute("listImportDetail", id);
           request.getRequestDispatcher("importDetail.jsp").forward(request, response);
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
         ImportDetailDAL importDetailDAL = new ImportDetailDAL();
           String url = request.getRequestURI();
           JsonObject jsonResponse = new JsonObject();
           if (url.contains("add-ImportDetail")) {
               String idImportDetail = new CreateID("ID").create();
               String idImport = String.valueOf(request.getParameter("idImport"));
               String idProduct = String.valueOf(request.getParameter("idProduct"));
               String dateCreated = String.valueOf(request.getParameter("dateCreated"));
               String quantity = String.valueOf(request.getParameter(" quantity"));
               String price = String.valueOf(request.getParameter("price"));
               String total = String.valueOf(request.getParameter("total"));
                ImportDetailModel importDetailModel = new ImportDetailModel(idImportDetail, idImport, idProduct, dateCreated, quantity, price, total);
               importDetailDAL.addImportDetail(importDetailModel);
//                jsonResponse.addProperty("message", "Thêm  thành công rồi thk lòn");
           }
           else if(url.contains("delete-ImportDetail")){
                String idImportDetail = String.valueOf(request.getParameter("idImportDetail"));
                importDetailDAL.deleteImportDetail(idImportDetail);
//                jsonResponse.addProperty("message", "Xóa nhóm quyền thành công");
              }
           else if (url.contains("update-ImportDetail")) {
               String idImportDetail = String.valueOf(request.getParameter("idImportDetail"));
           String idImport = String.valueOf(request.getParameter("idImport"));
               String idProduct = String.valueOf(request.getParameter("idProduct"));
               String dateCreated = String.valueOf(request.getParameter("dateCreated"));
               String quantity = String.valueOf(request.getParameter(" quantity"));
               String price = String.valueOf(request.getParameter("price"));
               String total = String.valueOf(request.getParameter("total"));
                ImportDetailModel importDetailModel = new ImportDetailModel(idImportDetail, idImport, idProduct, dateCreated, quantity, price, total);
               importDetailDAL.updateImportDetail(importDetailModel);
        }
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
response.sendRedirect("ImportDetail");
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

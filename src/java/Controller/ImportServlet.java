/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.CreateID;
import DAL.ImportDAL;
import DAL.ImportDetailDAL;
import DAL.ProductDAL;
import DAL.SupplierDAL;
import Model.ImportDetailModel;
import Model.ImportModel;
import Model.ProductModel;
import Model.SupplierModel;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
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
@WebServlet({"/import" ,"/add-Import","/delete-Import","/update-Import","/load_datacheckproduct"})
public class ImportServlet extends HttpServlet {
   
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
            out.println("<title>Servlet ImportServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportServlet at " + request.getContextPath () + "</h1>");
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
        ImportDAL importDAL = new ImportDAL();
           ArrayList<ImportModel> ip = importDAL.readImport();
           request.setAttribute("dataImport", ip);
           
           ProductDAL pr = new ProductDAL();
        ArrayList<ProductModel> listt = pr.readProduct();
        request.setAttribute("dataProduct", listt);
           
        SupplierDAL sl = new SupplierDAL();
        ArrayList<SupplierModel> list = sl.readSupplier();
        request.setAttribute("datasuppliers", list);
        
        
        
           request.getRequestDispatcher("listImport.jsp").forward(request, response);
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
        ImportDAL importDAL = new ImportDAL();
        ImportDetailDAL importDetailDAL = new ImportDetailDAL();
        ProductDAL pr = new ProductDAL();
        JsonObject jsonResponse = new JsonObject();
           String url = request.getRequestURI();
           if (url.contains("add-Import")) {
               String idImport = new CreateID("IP").create();
               String idSupplier = String.valueOf(request.getParameter("idSupplier"));
               String dateCreated = String.valueOf(request.getParameter("dateCreated"));
               String totalBill = String.valueOf(request.getParameter("totalBill"));
               String idPerson = String.valueOf(request.getParameter("idPerson"));
               ImportModel importModel= new ImportModel(idImport, idSupplier, dateCreated, totalBill,idPerson);
               //Lấy dữ liệu product
               String listProduct =String.valueOf(request.getParameter("chosenProducts"));
               System.out.println(listProduct+"hello");
               // Sử dụng Gson để chuyển đổi chuỗi JSON thành JsonObject
                JsonArray jsonArray = JsonParser.parseString(listProduct).getAsJsonArray();
            
                // Duyệt qua mảng JSON và lấy giá trị từ các đối tượng JSON
                if(importDAL.addImport(importModel)!=0){
                    for(int i = 0; i < jsonArray.size(); i++){
                        JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
                        String idProduct =jsonObject.get("idProduct").getAsString();
                        int quantity = jsonObject.get("quantity").getAsInt();
                        String price = jsonObject.get("price").getAsString();
                        String total = String.valueOf(quantity * Float.parseFloat(price));
                        String idImportDetails = new CreateID("ID").create();
                        ImportDetailModel importDetailModel = new ImportDetailModel(idImportDetails, idImport, idProduct, dateCreated, quantity, price, total);
                        importDetailDAL.addImportDetail(importDetailModel);
                    }
                }
               
                response.sendRedirect("import");
           }
           else if(url.contains("delete-Import")){
                String idImport = String.valueOf(request.getParameter("idImport"));            
            if(importDAL.deleteImport(idImport)!=0){
                importDetailDAL.deleteImportDetail(idImport);
            }
            response.sendRedirect("import");
              }
           else if (url.contains("update-Import")) {
              String idImport = String.valueOf(request.getParameter("idImport"));
            String idSupplier = String.valueOf(request.getParameter("idSupplier"));
            String dateCreated = String.valueOf(request.getParameter("dateCreated"));
            String totalBill = String.valueOf(request.getParameter("totalBill"));
            String idPerson = String.valueOf(request.getParameter("idPerson"));
            ImportModel importModel = new ImportModel(idImport, idSupplier, dateCreated, totalBill,idPerson);
            importDAL.updateImport(importModel);
//               lấy dữ liệu product 
            String listProduct = String.valueOf(request.getParameter("chosenProducts"));

            // Sử dụng Gson để chuyển đổi chuỗi JSON thành JsonObject
            JsonArray jsonArray = JsonParser.parseString(listProduct).getAsJsonArray();
            // Duyệt qua mảng JSON và lấy giá trị từ các đối tượng JSON
            importDetailDAL.deleteImportDetail(idImport);
            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
                String idProduct = jsonObject.get("idProduct").getAsString();
                int quantity = jsonObject.get("quantity").getAsInt();
                String price = jsonObject.get("price").getAsString();
                String total = String.valueOf(quantity * Float.parseFloat(price));
                // In ra giá trị

                String idImportDetails = new CreateID("ID").create();
                
                ImportDetailModel importDetailModel = new ImportDetailModel(idImportDetails, idImport, idProduct, dateCreated, quantity, price, total);
                importDetailDAL.addImportDetail(importDetailModel);
            }
            response.sendRedirect("import");
        }
           else if (url.contains("load_datacheckproduct")) {
            String idImport = String.valueOf(request.getParameter("idImport"));           
            System.out.println("Id import lay tu ajax : " + idImport);
            ArrayList<ImportDetailModel> importDetails = importDetailDAL.readImportDetailwithidImport(idImport);
            ArrayList<ProductModel> dataProduct = pr.readProduct();
            // Chuyển danh sách thành JSON để gửi về
            Gson gson = new Gson();
            jsonResponse.add("dataImportdetails", gson.toJsonTree(importDetails));
            jsonResponse.add("dataProduct", gson.toJsonTree(dataProduct));
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse.toString());                  
        }
        response.setContentType("application/json");


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

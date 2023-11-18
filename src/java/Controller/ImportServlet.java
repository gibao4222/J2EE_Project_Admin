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
import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.stream.Collectors;

/**
 *
 * @author Admin
 */
@WebServlet({"/Import", "/add-Import", "/delete-Import", "/update-Import"})
public class ImportServlet extends HttpServlet {

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
            out.println("<title>Servlet ImportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImportServlet at " + request.getContextPath() + "</h1>");
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
        ProductDAL pr = new ProductDAL();
        ArrayList<ProductModel> listt = pr.readProduct();
        request.setAttribute("dataProduct", listt);

        SupplierDAL sl = new SupplierDAL();
        ArrayList<SupplierModel> list = sl.readSupplier();
        request.setAttribute("datasuppliers", list);

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
        ImportDetailDAL importDetailDAL = new ImportDetailDAL();
        String url = request.getRequestURI();
        JsonObject jsonResponse = new JsonObject();
        if (url.contains("add-Import")) {
            String idImport = new CreateID("IP").create();
            String idSupplier = String.valueOf(request.getParameter("idSupplier"));
            String dateCreated = String.valueOf(request.getParameter("dateCreated"));
            String totalBill = String.valueOf(request.getParameter("totalBill"));
            System.out.println("hllo");
            ImportModel importModel = new ImportModel(idImport, idSupplier, dateCreated, totalBill);
            importDAL.addImport(importModel);
//               lấy dữ liệu product 
            String listProduct = String.valueOf(request.getParameter("chosenProducts"));
            System.out.println("listproduct" + listProduct);
            // Sử dụng Gson để chuyển đổi chuỗi JSON thành JsonObject
            JsonArray jsonArray = JsonParser.parseString(listProduct).getAsJsonArray();
            // Duyệt qua mảng JSON và lấy giá trị từ các đối tượng JSON
            for (int i = 0; i < jsonArray.size(); i++) {
                JsonObject jsonObject = jsonArray.get(i).getAsJsonObject();
                String idProduct = jsonObject.get("idProduct").getAsString();
                String quantity = jsonObject.get("quantity").getAsString();
                String price = jsonObject.get("price").getAsString();
                String total = String.valueOf(Integer.parseInt(quantity)*Integer.parseInt(price));
                // In ra giá trị
                System.out.println("idProduct: " + idProduct);
                System.out.println("quantity: " + quantity);
                System.out.println("price: " + price);
                String idImportDetails = new CreateID("ID").create();
                ImportDetailModel importDetailModel = new ImportDetailModel(idImportDetails, idImport, idProduct, dateCreated, Integer.parseInt(quantity), price, total);
                importDetailDAL.addImportDetail(importDetailModel);
            }
//                jsonResponse.addProperty("message", "Thêm  thành công rồi thk lòn");
        } else if (url.contains("delete-Import")) {
            String idImport = String.valueOf(request.getParameter("idImport"));
            importDAL.deleteImport(idImport);
            importDetailDAL.deleteImportDetail(idImport);
//                jsonResponse.addProperty("message", "Xóa nhóm quyền thành công");
        } else if (url.contains("update-Import")) {
            String idImport = String.valueOf(request.getParameter("idImport"));
            String idSupplier = String.valueOf(request.getParameter("idSupplier"));
            String dateCreated = String.valueOf(request.getParameter("dateCreated"));
            String totalBill = String.valueOf(request.getParameter("totalBill"));
            ImportModel importModel = new ImportModel(idImport, idSupplier, dateCreated, totalBill);
            importDAL.updateImport(importModel);
        }
        response.setContentType("application/json");
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

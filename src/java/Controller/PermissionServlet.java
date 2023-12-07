/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.MyDatabaseManager;
import DAL.PermissionDAL;
import DAL.PermissionGroupDAL;
import Model.PermissionGroupModel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Model.PermissionModel;
import com.google.gson.JsonObject;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
@WebServlet({"/permission","/add-PermissionGroup","/delete-PermissionGroup","/update-PermissionGroup"})
public class PermissionServlet extends HttpServlet {
   
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
            out.println("<title>Servlet Permission</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Permission at " + request.getContextPath () + "</h1>");
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
        PermissionDAL pe = new PermissionDAL();
        ArrayList<PermissionModel> list = pe.readPermission();

        PermissionGroupDAL pg = new PermissionGroupDAL();
        ArrayList<PermissionGroupModel> listt = pg.readPermissionGroup();
        
        
        request.setAttribute("dataPermission", list);
        request.setAttribute("dataPermissionGroup", listt);

        
        
        request.getRequestDispatcher("permission.jsp").forward(request, response);
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
        PermissionGroupDAL pgDAL = new PermissionGroupDAL();
        String url = request.getRequestURI();
        JsonObject jsonResponse = new JsonObject();
        if(url.contains("add-PermissionGroup")){
            String nameGroup = String.valueOf(request.getParameter("nameGroup"));
            String portray = String.valueOf(request.getParameter("portray"));
            String listPermissionID = String.valueOf(request.getParameter("listPermissionID"));
            PermissionGroupModel pg = new PermissionGroupModel(nameGroup, portray, listPermissionID);
            pgDAL.addPermissionGroup(pg);
            jsonResponse.addProperty("message", "Thêm nhóm quyền thành công");
        }
        else if(url.contains("delete-PermissionGroup")){
                String idGroup = String.valueOf(request.getParameter("idGroup"));
                pgDAL.deletePermissionGroup(idGroup);
                jsonResponse.addProperty("message", "Xóa nhóm quyền thành công");
        }
        else{
            String idGroup = String.valueOf(request.getParameter("idGroup"));
            System.out.println(idGroup);
            String nameGroup = String.valueOf(request.getParameter("nameGroup"));
            String portray = String.valueOf(request.getParameter("portray"));
            String listPermissionID = String.valueOf(request.getParameter("listPermissionID"));
            PermissionGroupModel pg = new PermissionGroupModel(idGroup, nameGroup, portray, listPermissionID);
            pgDAL.updatePermissionGroup(pg);
        }
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
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

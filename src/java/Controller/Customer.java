/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AccountDAL;
import DAL.CreateID;
import DAL.CustomerDAL;
import Model.AccountModel;
import Model.CustomerModel;
import com.google.gson.JsonObject;
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
 * @author LENOVO
 */
@WebServlet({"/Customer", "/add-Customer", "/delete-Customer", "/update-Customer", "/loadPasswordCus"})
public class Customer extends HttpServlet {

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
            out.println("<title>Servlet Customer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Customer at " + request.getContextPath() + "</h1>");
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

        CustomerDAL cusDAL = new CustomerDAL();
        ArrayList<CustomerModel> st = cusDAL.readCustomer();
        request.setAttribute("listCustomer", st);
        request.getRequestDispatcher("listCustomer.jsp").forward(request, response);
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
        CustomerDAL cusDAL = new CustomerDAL();
        AccountDAL accountDAL = new AccountDAL();

        String url = request.getRequestURI();
        JsonObject jsonResponse = new JsonObject();
        if (request.getCharacterEncoding() == null) {
            request.setCharacterEncoding("UTF-8");
        }
        if (url.contains("add-Customer")) {
            String idCustomer = new CreateID("CT").create();
            String email = String.valueOf(request.getParameter("email"));
            String fullName = String.valueOf(request.getParameter("fullName"));
            String address = String.valueOf(request.getParameter("address"));
            String phoneNumber = String.valueOf(request.getParameter("numberPhone"));
            CustomerModel cusModel = new CustomerModel(idCustomer, email, address, phoneNumber, fullName);
           
            String idACcount = new CreateID("TK").create();
            String password = String.valueOf(request.getParameter("password"));
            String status = "2";
            if( accountDAL.checktk(email)==0){
                if ( cusDAL.addCustomer(cusModel)!=0) {
                     AccountModel accountModel = new AccountModel(idACcount, idCustomer, email, password, status);
            accountDAL.addAccount(accountModel);
                }           
            }
            jsonResponse.addProperty("message", "Thêm  thành công rồi thk lòn");
                        response.sendRedirect("Customer");

        } else if (url.contains("delete-Customer")) {
            String idCustomer = String.valueOf(request.getParameter("idCustomer"));
            cusDAL.deleteCustomer(idCustomer);
            if (cusDAL.deleteCustomer(idCustomer) != 0) {
                accountDAL.deleteAccountByIdStaff(idCustomer);
            }
            jsonResponse.addProperty("message", "Xóa nhóm quyền thành công");
                        response.sendRedirect("Customer");

        } else if (url.contains("update-Customer")) {
            String idCustomer = String.valueOf(request.getParameter("idCustomer"));
            String email = String.valueOf(request.getParameter("email"));
            String fullName = String.valueOf(request.getParameter("fullName"));
            String address = String.valueOf(request.getParameter("address"));
            String phoneNumber = String.valueOf(request.getParameter("numberPhone"));
            CustomerModel cusModel = new CustomerModel(idCustomer, email, address, phoneNumber, fullName);
            if (cusDAL.updateCustomer(cusModel) != 0) {
                String idACcount = accountDAL.searchAccount(idCustomer).getIdAccount();
                String password = String.valueOf(request.getParameter("password"));
                String status = "2";
                AccountModel accountModel = new AccountModel(idACcount, idCustomer, email, password, status);
                accountDAL.updateAccount(accountModel);
            } 
            response.setContentType("application/json");
            response.getWriter().write(jsonResponse.toString());
            response.sendRedirect("Customer");
        }
        else if (url.contains("loadPasswordCus")) {
                String idCus = String.valueOf(request.getParameter("idCustomer"));
                System.out.println(idCus);
                String password = accountDAL.searchAccount(idCus).getPassword();
                System.out.println("Controller.Customer.doPost()" + password);
                System.out.println(password);
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"pass\": \"" + password + "\"}");
            }
    }
}

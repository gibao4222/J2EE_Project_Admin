/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.AccountDAL;
import DAL.CreateID;
import DAL.PermissionGroupDAL;
import DAL.StaffDAL;
import model.AccountModel;
import model.PermissionGroupModel;
import model.StaffModel;
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
@WebServlet({"/staff" ,"/add-Staff","/delete-Staff","/update-Staff","/loadPassword","/checkAccount"})
public class Staff extends HttpServlet {
   
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
            out.println("<title>Servlet Staff</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Staff at " + request.getContextPath () + "</h1>");
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
        StaffDAL staffDAL = new StaffDAL();
           ArrayList<StaffModel> st = staffDAL.readStaff();
           request.setAttribute("listStaff", st);
           
        PermissionGroupDAL per = new PermissionGroupDAL();
        ArrayList<PermissionGroupModel> ls = per.readPermissionGroup();
        request.setAttribute("listPermission", ls);
        request.getRequestDispatcher("listStaff.jsp").forward(request, response);
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
        StaffDAL staffDAL = new StaffDAL();
           AccountDAL accountDAL = new AccountDAL();
           String url = request.getRequestURI();
           if (request.getCharacterEncoding()== null) {
            request.setCharacterEncoding("UTF-8");
            }
           if (url.contains("add-Staff")) {
               String idStaff = new CreateID("ST").create();
               String email = String.valueOf(request.getParameter("email"));
               String fullName = String.valueOf(request.getParameter("fullName"));
               String address = String.valueOf(request.getParameter("address"));
               String phoneNumber = String.valueOf(request.getParameter("numberPhone"));
               String bankAccount = String.valueOf(request.getParameter("bankAccount"));
               String accountNumber = String.valueOf(request.getParameter("accountNumber"));
               String position = String.valueOf(request.getParameter("position"));
               StaffModel staffModel = new StaffModel(idStaff, email, fullName, address, phoneNumber, bankAccount, accountNumber,position);
               
               if( staffDAL.checktk(email)==0){
                   if(staffDAL.addStaff(staffModel)!=0){
//                   add-Account 
                String idACcount = new CreateID("TK").create();               
                String password = String.valueOf(request.getParameter("password"));
                String status;
                if(position.equals("admin")){
                    status = "0";
                }
                else{
                    status = "1";
                }
                AccountModel accountModel= new AccountModel(idACcount, idStaff, email, password, status);
                accountDAL.addAccount(accountModel);
               }
               }
               
//               
                
                
           }
           else if(url.contains("delete-Staff")){
                String idStaff = String.valueOf(request.getParameter("idStaff"));
                if(staffDAL.deleteStaff(idStaff)!=0){
                    accountDAL.deleteAccountByIdStaff(idStaff);
                }
                
                
              }
           else if (url.contains("update-Staff")) {
               String idStaff = String.valueOf(request.getParameter("idStaff"));
               String email = String.valueOf(request.getParameter("email"));
               String fullName = String.valueOf(request.getParameter("fullName"));
               String address = String.valueOf(request.getParameter("address"));
               String phoneNumber = String.valueOf(request.getParameter("numberPhone"));
               String bankAccount = String.valueOf(request.getParameter("bankAccount"));
               String accountNumber = String.valueOf(request.getParameter("accountNumber"));
               String position =String.valueOf(request.getParameter("position"));
                StaffModel staffModel = new StaffModel(idStaff, email, fullName, address, phoneNumber, bankAccount, accountNumber,position);
               
               if(staffDAL.updateStaff(staffModel)!=0){

                   String idACcount = accountDAL.searchAccount(idStaff).getIdAccount();
                    String password = String.valueOf(request.getParameter("password"));
                    String status;
                    if(position.equals("admin")){
                        status = "0";
                    }
                    else{
                        status = "1";
                    }
                    AccountModel accountModel= new AccountModel(idACcount, idStaff, email, password, status);
                    accountDAL.updateAccount(accountModel);
               }}
               else if(url.contains("loadPassword")){
                   String idStaff = String.valueOf(request.getParameter("idStaff"));

                   String password = accountDAL.searchAccount(idStaff).getPassword();

                   response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                   response.getWriter().write("{\"pass\": \""+password+"\"}");
               }
               else if(url.contains("checkAccount")){

                    String email = String.valueOf(request.getParameter("email"));
                    
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                   int rs = staffDAL.checktk(email);
                    response.getWriter().write("{\"result\": \""+rs+"\"}");
                }
    
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

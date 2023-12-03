/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.AccountDAL;
import DAL.CreateID;
import DAL.CustomerDAL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.mail.Session;
import model.AccountModel;
import model.CustomerModel;


/**
 *
 * @author Thanhchan
 */
@WebServlet(name = "registerServlet", urlPatterns = {"/register"})
public class registerServlet extends HttpServlet {

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
            out.println("<title>Servlet registerServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet registerServlet at " + request.getContextPath() + "</h1>");
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
        try {
    Class.forName("com.mysql.cj.jdbc.Driver");
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}
         HttpSession session = request.getSession();

       String name = request.getParameter("fullname");
       String email = request.getParameter("email");
       String password = request.getParameter("password");
       String address   = request.getParameter("address");
       String phone = request.getParameter("phone");
       
       AccountDAL ac = new AccountDAL();
       
       int kq = ac.checktk(email);
       
        if(kq==0){
            CreateID acount = new CreateID("TK");
            CreateID customer = new CreateID("CT");
            String idPersion = customer.create();
            AccountModel accountmodel = new AccountModel();
            accountmodel.setIdAccount(acount.create());
            accountmodel.setIdPerson(idPersion);
            accountmodel.setPassword(password);
            accountmodel.setEmail(email);
            accountmodel.setStatus("2");
            ac.insertaccount(accountmodel);
            CustomerModel c = new CustomerModel();
            c.setIdCustomer(idPersion);
            c.setEmail(email);
            c.setFullName(name);
            c.setAddress(address);
            c.setNumberPhone(phone);
            CustomerDAL cus = new CustomerDAL();
                    cus.addCustomer(c);
                    session.setAttribute("idCustomer", idPersion);
           session.setAttribute("name", name);
           response.sendRedirect("home");
        }else{
            request.setAttribute("mess", "email đã tồn tại");
            request.getRequestDispatcher("register.jsp").forward(request, response);
          System.out.print("email ton tai") ; 
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

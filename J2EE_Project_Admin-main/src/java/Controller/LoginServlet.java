/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CustomerDAL;
import DAL.checkLogin;
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
import model.CustomerModel;


/**
 *
 * @author Thanhchan
 */
@WebServlet(name = "loginn", urlPatterns = {"/login1"})
public class LoginServlet extends HttpServlet {
    String newSQL;
    String kq;

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
            out.println("<title>Servlet loginn</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loginn at " + request.getContextPath() + "</h1>");
           
//            newSQL = "SELECT email,password form account where email = "+email+"and password="+password+"";
//;
//            
//            String conStr = "jdbc:mysql://localhost:3306/csdl_j2ee";
//            Statement stmt = null;
//            ResultSet rs = null;    
//            try{
//                Connection con = null;
//                Class.forName("com.mysql.jdbc.Driver");
//                con = DriverManager.getConnection(conStr,"root","");
//                stmt = con.createStatement();
//                rs = stmt.executeQuery(newSQL);
//                String name="";
//                if(rs.next()) {
//                    name = rs.getString("email");
//                    kq="true";
//                   System.out.print(kq);
////                    CookieUtils.add("email", email, response); 
////                    CookieUtils.add("password", password, response); 
////                                            request.setAttribute("message", "Đăng nhập thành công"); 
////                                     String emaill = CookieUtils.get("email", request); 
////                String passwordd = CookieUtils.get("password", request); 
////                    request.setAttribute("emaill", emaill); 
////                    request.setAttribute("passwordd", passwordd);
////                out.print("hi"+" "+emaill);
////            response.sendRedirect("home");
////                request.getRequestDispatcher("login.jsp").forward(request, response); 
//
//
//            }else{
//                kq = "false";
//                request.setAttribute("message", "Tài khoản hoặc mật khẩu không đúng"); 
//                request.getRequestDispatcher("login.jsp").forward(request, response); 
//
//
//            }
//               

                
//            }catch(Exception e){
//                out.println("Error:"+e);
//            }
//            
//            out.println("</body>");
//            out.println("</html>");
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
         HttpSession session = request.getSession();
        String email = request.getParameter("email");
            String password = request.getParameter("password");
           
            out.println(email);
           out.println(password); 
            checkLogin c = new checkLogin();
        CustomerModel cus = c.check(email, password);
        if(cus.getFullName()==null){
            request.setAttribute("message", "Tài khoản hoặc mật khẩu không đúng"); 
             response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"status\": \"fail\"}");
               
        
        }else{
          session.setAttribute("idCustomer", cus.getIdCustomer());
           session.setAttribute("name", cus.getFullName());
            response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"status\": \"success\"}");
    }}

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

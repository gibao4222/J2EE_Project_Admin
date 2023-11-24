/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CreateID;
import DAL.OrderDAL;
import model.category;
import DAL.categoryDAL;
import DAL.productDAL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.Order;
/**
 *
 * @author Thanhchan
 */
@WebServlet({"/show-category", "/add-category", "/edit-category","/delete-category","/save-category","/order-customer"})
public class categoryController extends HttpServlet {

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
            out.println("<title>Servlet test</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet test at " + request.getContextPath() + "</h1>");
           

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
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
         String uri = request.getRequestURI();
     if(uri.contains("show-category")) { // [Tính diện tích].Click

  categoryDAL p = new categoryDAL();
        List <category> list = p.readcategory();
        request.setAttribute("data", list);
       
        request.getRequestDispatcher("listCategory1.jsp").forward(request, response);
//        
//        request.getRequestDispatcher("listCategory.jsp").forward(request, response);
        
}else  if(uri.contains("order-customer")){
     OrderDAL or = new OrderDAL();
         List<Order> orr = or.findOrder("3");
        request.setAttribute("Order", orr);
                request.getRequestDispatcher("historyOrder.jsp").forward(request, response);
}
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
         String uri = request.getRequestURI();
 if(uri.contains("add-category")){ // [Tính chu vi].Click
category cate = new category();
categoryDAL c = new categoryDAL();
String nameCategory = request.getParameter("nameCategory");
CreateID cre = new CreateID("CA");
cate.setIdCategory(cre.create());
cate.setNameCategory(nameCategory);
c.insertcategory(cate);
response.sendRedirect("show-category");
}else if(uri.contains("edit-category")){ // [Tính chu vi].Click
 
int id =   Integer.parseInt( request.getParameter("id"));
        
categoryDAL p = new categoryDAL();
category cate = new category();
cate = p.findcategory(id);
request.setAttribute("cateupdate", cate);      
request.getRequestDispatcher("updateCategory.jsp").forward(request, response);    
}else if(uri.contains("save-category")){ // [Tính chu vi].Click
 String id =request.getParameter("idCategory");
         String nameCategory = request.getParameter("nameCategory");
            category cate = new category();
            cate.setNameCategory(nameCategory);
            
           
            categoryDAL c = new categoryDAL();
            c.updatecategory(cate,id);
           request.setAttribute("message", "update thành công");
                     

response.sendRedirect("show-category");
}else  if(uri.contains("delete-category")){
  categoryDAL c = new categoryDAL();
             String id = request.getParameter("id");
             c.deletecategory(id);
               response.sendRedirect("show-category");
}    }

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

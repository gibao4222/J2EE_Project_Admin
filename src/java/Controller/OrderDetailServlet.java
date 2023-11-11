package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import DAL.CreateID;
import DAL.OrderDetailDAL;
import Model.OrderDetailModel;
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
@WebServlet({"/orderDetail" ,"/add-OrderDetail","/delete-OrderDetail","/update-OrderDetail"})
public class OrderDetailServlet extends HttpServlet {
   
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
            out.println("<title>Servlet OrderDetailServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetailServlet at " + request.getContextPath () + "</h1>");
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
         OrderDetailDAL orderDetailDAL = new OrderDetailDAL();
           ArrayList<OrderDetailModel> odd = orderDetailDAL.readOrderDetail();
           request.setAttribute("listOrderDetail", odd);
           request.getRequestDispatcher("orderDetail.jsp").forward(request, response);
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
        OrderDetailDAL orderDetailDAL = new OrderDetailDAL();
           String url = request.getRequestURI();
           if (url.contains("add-OrderDetail")) {
               String idOrderDetail = new CreateID("DT").create();
               String idOrder = String.valueOf(request.getParameter("idOrder"));
               String idProduct = String.valueOf(request.getParameter("idProduct"));
               String dateCreated = String.valueOf(request.getParameter("dateCreated"));
               int quantity = Integer.parseInt(request.getParameter("quantity"));
               String price = String.valueOf(request.getParameter("price"));
               String total = String.valueOf(request.getParameter("total"));
               String idSale = String.valueOf(request.getParameter("idSale"));
              OrderDetailModel orderDetail = new OrderDetailModel(idOrderDetail, idOrder, idProduct, dateCreated, quantity, price, total, idSale) ;
               orderDetailDAL.addOrderDetail(orderDetail);
           }
           else if(url.contains("delete-OrderDetail")){
                String idOrderDetail = String.valueOf(request.getParameter("idOrderDetail"));
                orderDetailDAL.deleteOrderDetail(idOrderDetail);
                
              }
           else if (url.contains("update-OrderDetail")) {
               String idOrderDetail = String.valueOf(request.getParameter("idOrderDetail"));
               String idOrder = String.valueOf(request.getParameter("idOrder"));
               String idProduct = String.valueOf(request.getParameter("idProduct"));
               String dateCreated = String.valueOf(request.getParameter("dateCreated"));
               int quantity = Integer.parseInt(request.getParameter("quantity"));
               String price = String.valueOf(request.getParameter("price"));
               String total = String.valueOf(request.getParameter("total"));
               String idSale = String.valueOf(request.getParameter("idSale"));
                OrderDetailModel orderDetail = new OrderDetailModel(idOrderDetail, idOrder, idProduct, dateCreated, quantity, price, total, idSale);
               orderDetailDAL.updateOrderDetail(orderDetail);
        }
        response.setContentType("application/json");
response.sendRedirect("orderDetail");
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

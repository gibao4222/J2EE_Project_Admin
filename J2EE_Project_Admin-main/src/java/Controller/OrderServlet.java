/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.CreateID;
import DAL.OrderDAL;
import model.OrderModel;
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
@WebServlet({"/order" ,"/add-Order","/delete-Order","/update-Order"})
public class OrderServlet extends HttpServlet {
   
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
            out.println("<title>Servlet OrderServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath () + "</h1>");
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
        OrderDAL orderDAL = new OrderDAL();
        ArrayList<OrderModel> orderList = orderDAL.readOrder();
        request.setAttribute("data", orderList);
        request.getRequestDispatcher("listOrder.jsp").forward(request, response);
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
        OrderDAL odDAL = new OrderDAL();
        String url = request.getRequestURI();
//        jakarta.json.JsonObject jsonResponse = new jakarta.json.JsonObject();
        if(url.contains("add-Order")){
//             String idOrder= String.valueOf(request.getParameter("idOrder"));
             String idOrder = new CreateID("OD").create();
            String idCustomer = String.valueOf(request.getParameter("idCustomer"));
            String dateCreated = String.valueOf(request.getParameter("dateCreated"));
            String totalBill = String.valueOf(request.getParameter("totalBill"));
            int status = Integer.parseInt(request.getParameter("status"));
            OrderModel o = new OrderModel(idOrder,idCustomer, dateCreated, totalBill,status);
            odDAL.addOrder(o);
//            String idOrder = request.getParameter("idOrder");
//            String idCustomer = request.getParameter("idCustomer");
//            String dateCreated = request.getParameter("dateCreated");
//            String totalBill = request.getParameter("totalBill");
//            String status = request.getParameter("status");
//            Order o = new Order(idOrder, idCustomer, dateCreated, totalBill, status);
//            int result = odDAL.addOrder(o);
//            jsonResponse.addProperty("message", "Thêm đơn hàng thành công");
        }
        else if(url.contains("delete-Order")){
                String idOrder = String.valueOf(request.getParameter("idOrder"));
//                System.out.println("hllo");
                odDAL.deleteOrder(idOrder);
//                jsonResponse.addProperty("message", "Xóa đơn hàng thành công");
        }
        else if(url.contains("update-Order")){
            String idOrder = String.valueOf(request.getParameter("idOrder"));
//            System.out.println(idOrder);

            String idCustomer = String.valueOf(request.getParameter("idCustomer"));
            String dateCreated = String.valueOf(request.getParameter("dateCreated"));
            String totalBill = String.valueOf(request.getParameter("totalBill"));
            int status = Integer.parseInt(request.getParameter("status"));
            OrderModel od = new OrderModel(idOrder, idCustomer, dateCreated, totalBill, status);
            odDAL.updateOrder(od);
        }
        response.setContentType("application/json");
//        response.getWriter().write(jsonResponse.toString());
response.sendRedirect("order");
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

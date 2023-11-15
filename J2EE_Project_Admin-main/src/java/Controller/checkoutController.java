/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CustomerDAL;
import DAL.OrderDAL;
import DAL.OrderDetailDAL;
import DAL.ShoppingCart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;
import java.util.Random;
import model.CustomerModel;
import model.Order;
import model.OrderDetail;

/**
 *
 * @author Thanhchan
 */
@WebServlet({"/checkout"})
public class checkoutController extends HttpServlet {

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
            out.println("<title>Servlet checkoutController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet checkoutController at " + request.getContextPath() + "</h1>");
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
       String uri = request.getRequestURI();
     if(uri.contains("checkout")) { // [Tính diện tích].Click
         ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");
         CustomerModel cus = new CustomerModel();
        CustomerDAL cu  = new CustomerDAL();
        cus = cu.findCustomer("3");
         String fullname = cus.getFullName();
         String address = cus.getAddress();
         String phone = cus.getNumberPhone();
         String email = cus.getEmail();
         
        
            request.setAttribute("fullname", fullname);
            request.setAttribute("address" , address);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
                request.getRequestDispatcher("confirm.jsp").forward(request, response);

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
        String action = request.getParameter("action");
       
       if ("confirm".equals(action)) {
            String  idCustomer = request.getParameter("idCustomer");
            System.out.print(idCustomer);
            String total = request.getParameter("total");
             LocalDate currentDate = LocalDate.now();

        // Chuyển đổi ngày thành chuỗi theo định dạng yyyy-MM-dd
        String formattedDate = currentDate.toString();
           // Khởi tạo đối tượng Random
        Random random = new Random();

//         Lấy ID ngẫu nhiên trong phạm vi từ 1 đến 100,000
        int idOrder = random.nextInt(10000) + 1;
        Order o = new Order();
        o.setDateCreated(formattedDate);
        o.setIdOrder(String.valueOf(idOrder));
        o.setIdCustomer(idCustomer);
        o.setStatus("1");
        o.setTotalBill(total);
        OrderDAL oo = new OrderDAL();
        oo.addOrder(o);
       
            
        
        int idOrderdetails = random.nextInt(10000) + 1;
          ShoppingCart cart = (ShoppingCart) request.getSession().getAttribute("cart");

        
         cart.addItemToData(String.valueOf(idOrder),formattedDate);
         OrderDAL or = new OrderDAL();
         List<Order> orr = or.findOrder("3");
        request.setAttribute("Order", orr);
                request.getRequestDispatcher("historyOrder.jsp").forward(request, response);

//        
        } else if ("detailsOrder".equals(action)) {
            String idOrder = request.getParameter("idOrder");
            OrderDetailDAL o = new OrderDetailDAL();
            List<OrderDetail> oo = o.findOrderDetails(idOrder);
            
            request.setAttribute("details", oo);
                            request.getRequestDispatcher("detailsOrder.jsp").forward(request, response);

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

package Controller;


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import DAL.CreateID;
import DAL.OrderDetailDAL;
import Model.OrderDetailModel;
import Model.OrderDetail;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author trinh
 */
@WebServlet({"/orderDetail", "/add-OrderDetail", "/delete-OrderDetail", "/update-OrderDetail"})
public class OrderDetailServlet extends HttpServlet {

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
            out.println("<title>Servlet OrderDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderDetail at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDetailDAL orderDetailDAL = new OrderDetailDAL();
        ArrayList<OrderDetail> odd = orderDetailDAL.readOrderDetail();
        request.setAttribute("listOrderDetail", odd);
        request.getRequestDispatcher("orderDetail.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDetailDAL orderDetailDAL = new OrderDetailDAL();
        String url = request.getRequestURI();
        JsonObject jsonResponse = new JsonObject();
        if (url.contains("add-OrderDetail")) {
            String idOrderDetail = new CreateID("DT").create();
            String idOrder = String.valueOf(request.getParameter("idOrder"));
            String idProduct = String.valueOf(request.getParameter("idProduct"));       
            String quantity = String.valueOf(request.getParameter("quantity"));
            String total = String.valueOf(request.getParameter("total"));
            String idSale = String.valueOf(request.getParameter("idSale"));
            String dateCreated = String.valueOf(request.getParameter("dateCreated"));
             String price = String.valueOf(request.getParameter("price"));
//              OrderDetail orderDetail = new OrderDetail(idOrderDetail, idOrder, idProduct, dateCreated, quantity, price, total, idSale) ;
            OrderDetail orderDetail = new OrderDetail(idOrderDetail, idOrder, idProduct, quantity, total, idSale, dateCreated, price);
            orderDetailDAL.addOrderDetail(orderDetail);
            jsonResponse.addProperty("message", "Thêm  thành công rồi thk lòn");
        } else if (url.contains("delete-OrderDetail")) {
            String idOrderDetail = String.valueOf(request.getParameter("idOrderDetail"));
            orderDetailDAL.deleteOrderDetail(idOrderDetail);
            jsonResponse.addProperty("message", "Xóa nhóm quyền thành công");
        } else if (url.contains("update-OrderDetail")) {
            String idOrderDetail = String.valueOf(request.getParameter("idOrderDetail"));
            String idOrder = String.valueOf(request.getParameter("idOrder"));
            String idProduct = String.valueOf(request.getParameter("idProduct"));
//            String dateCreated = String.valueOf(request.getParameter("dateCreated"));
            String quantity = String.valueOf(request.getParameter(" quantity"));
            String price = String.valueOf(request.getParameter("price"));
            String total = String.valueOf(request.getParameter("total"));
            String idSale = String.valueOf(request.getParameter("idSale"));
             String inputDateStr = request.getParameter("dateCreated");
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("MM/dd/yyyy");
            Date inputDate;
            try {
                inputDate = outputFormat.parse(inputDateStr);
                 String formattedDate = inputFormat.format(inputDate);
                  OrderDetail orderDetail = new OrderDetail(idOrderDetail, idOrder, idProduct, formattedDate, quantity, price, total, idSale);
                orderDetailDAL.updateOrderDetail(orderDetail);
            } catch (ParseException ex) {
                Logger.getLogger(OrderDetailServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
           
           
        }
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
        response.sendRedirect("orderDetail");
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

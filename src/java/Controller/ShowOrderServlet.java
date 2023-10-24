/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.CreateID;
import DAL.Order;
import DAL.OrderDAL;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.io.PrintWriter;
import java.util.List;
import static org.eclipse.tags.shaded.org.apache.xalan.xsltc.compiler.util.Type.Int;

@WebServlet({"/Order" ,"/add-Order","/delete-Order","/update-Order"})
public class ShowOrderServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // TODO: Process request here
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        OrderDAL orderDAL = new OrderDAL();
        ArrayList<Order> orderList = orderDAL.readOrder();
        request.setAttribute("data", orderList);
        request.getRequestDispatcher("listOrder.jsp").forward(request, response);
    }

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
            String status = String.valueOf(request.getParameter("status"));
            Order o = new Order(idOrder,idCustomer, dateCreated, totalBill,status);
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
            String status = String.valueOf(request.getParameter("status"));
            Order od = new Order(idOrder, idCustomer, dateCreated, totalBill, status);
            odDAL.updateOrder(od);
        }
        response.setContentType("application/json");
//        response.getWriter().write(jsonResponse.toString());
response.sendRedirect("Order");
    }

    @Override
    public String getServletInfo() {
        return "Servlet to show orders";
    }
}
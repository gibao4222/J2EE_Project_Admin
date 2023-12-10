/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.CustomerDAL;
import DAL.ImportDAL;
import DAL.OrderDAL;
import DAL.OrderDetailDAL;
import Model.ImportModel;
import Model.OrderModel;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

/**
 *
 * @author Admin
 */
@WebServlet(name="HomeServlet", urlPatterns={"/home"})
public class HomeServlet extends HttpServlet {
   
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
            out.println("<title>Servlet HomeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeServlet at " + request.getContextPath () + "</h1>");
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
    
    public static Map<String, BigDecimal> earnMonth(ArrayList<OrderModel> listOrder){
        Map<String, BigDecimal> revenueByMonth = new HashMap<>();
        
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        decimalFormat.setParseBigDecimal(true);
        for(OrderModel order : listOrder){
            try {
                LocalDate orderDate = LocalDate.parse(order.getDateCreated(),dateFormat);
                
                DateTimeFormatter monFormat = DateTimeFormatter.ofPattern("MM/yyyy");
                String monthKey = orderDate.format(monFormat);
                
                // Chuyển đổi chuỗi total thành số
                BigDecimal total =(BigDecimal)decimalFormat.parse(order.getTotalBill());
                BigDecimal totalRevenue = revenueByMonth.getOrDefault(monthKey, BigDecimal.ZERO);
                
                // Thực hiện phép cộng dồn
                BigDecimal newTotal = totalRevenue.add(total);
                
                
                revenueByMonth.put(monthKey, newTotal);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return revenueByMonth;
    }

    public String formatCurrency(BigDecimal amount) {
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        String formString = decimalFormat.format(amount);
        return formString;
    }
    
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //Doanh thu ALL
        OrderDAL orderDAL = new OrderDAL();
        OrderDetailDAL orderDetailDAL = new OrderDetailDAL();
        ImportDAL importDAL = new ImportDAL();
        CustomerDAL customerDAL = new CustomerDAL();
        
        DecimalFormat decimalFormat = new DecimalFormat("###,###,###");
        decimalFormat.setParseBigDecimal(true);
        ArrayList<OrderModel> listOrder = orderDAL.readOrder();
        
        BigDecimal total = BigDecimal.ZERO;
        BigDecimal newTotal = BigDecimal.ZERO;

        try{
        for(OrderModel o : listOrder){
            total =(BigDecimal)decimalFormat.parse(o.getTotalBill());
            // Thực hiện phép cộng dồn
            newTotal = newTotal.add(total);

        }
        } catch (Exception e) {
        }
        
        
        ArrayList<Object[]> top5Cus = orderDAL.getTop5Customer();
        
        ArrayList<Object[]> top10Pro = orderDetailDAL.getTop10Product();
        total = BigDecimal.ZERO;
        BigDecimal newTotalImport = BigDecimal.ZERO;
        ArrayList<ImportModel> listImport = importDAL.readImport();
        try {
            for(ImportModel im: listImport){
                String totalBill = cleanString(im.getTotalBill());
               total =(BigDecimal)decimalFormat.parse(totalBill); 
               newTotalImport = newTotalImport.add(total);
//                System.out.println(newTotalImport);
            }
        } catch (Exception e) {
        }
        request.setAttribute("top5Cus", top5Cus);
        request.setAttribute("top10Pro", top10Pro);
        request.setAttribute("total", formatCurrency(newTotal));
        request.setAttribute("totalImport", formatCurrency(newTotalImport));
        request.setAttribute("quantityCus", customerDAL.readCustomer().size());
        request.getRequestDispatcher("index.jsp").forward(request, response);
    } 
    private static String cleanString(String input) {
        // Loại bỏ các kí tự không mong muốn từ chuỗi
        return input.replaceAll("[^\\d.]", "");
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
        Gson gson = new Gson();
        //Doanh thu ALL
        OrderDAL orderDAL = new OrderDAL();
        ArrayList<OrderModel> listOrder = orderDAL.readOrder();
        //Doanh thu theo từng tháng
        Map<String, BigDecimal> map = earnMonth(listOrder);
        Map<String, String> totalMonth = new HashMap<>();
        Set<String> keys = map.keySet();
        for(String key : keys){
            totalMonth.put(key, formatCurrency(map.get(key)));
            
        }
        String totalMonthJSON = gson.toJson(totalMonth);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Gửi dữ liệu JSON về trang web
        response.getWriter().write(totalMonthJSON);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    public static void main(String[] args) {
        OrderDAL orderDAL = new OrderDAL();
        ArrayList<OrderModel> listOrder = orderDAL.readOrder();
        Map<String, BigDecimal> map = earnMonth(listOrder);
        System.out.println(map.size());
    }
}

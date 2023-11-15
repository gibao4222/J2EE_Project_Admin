package Controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import DAL.CustomerDAL;
import DAL.Item;
import DAL.ShoppingCart;
import DAL.historyPromo;
import DAL.historyPromoDAL;
import DAL.promotion;
import DAL.promotionDAL;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import model.CustomerModel;

/**
 *
 * @author trinh
 */
@WebServlet(urlPatterns = {"/ShoppingCartServlet"})
public class ShoppingCartServlet extends HttpServlet {

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
            out.println("<title>Servlet ShoppingCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShoppingCartServlet at " + request.getContextPath() + "</h1>");
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
          String action = request.getParameter("action");
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

        if (cart == null) {
            cart = new ShoppingCart();
            request.getSession().setAttribute("cart", cart);
        }

        if ("AddCart".equals(action)) {
            String maHang = request.getParameter("idProduct");
            String tenSanPham = request.getParameter("nameproduct");
            float gia = Float.parseFloat(request.getParameter("price"));
            String img = request.getParameter("image");
            int quantity= Integer.parseInt(request.getParameter("quantity"));
            Item item = new Item(maHang,img,tenSanPham,gia,quantity);
            double totalprice = cart.getTotalPrice();
            request.setAttribute("total", totalprice);
            System.out.print(totalprice);
            
            cart.addItem(item);
        } else if ("Remove".equals(action)) {
            String maHang = request.getParameter("maHang");
            cart.removeItem(maHang);
        } else if ("ClearCart".equals(action)) {
            cart.clearCart();
        } else if("updateCart".equals(action)){
                int quantity = Integer.parseInt(request.getParameter("quantity"));
            String maHang = request.getParameter("maHang");
            cart.updateQuantity(maHang, quantity);
        } else if("coupon".equals(action)){
            double saleOff1 = 0;
            
            String namePromotion=request.getParameter("coupon");
            double totalprice=Double.parseDouble(request.getParameter("totalprice"));
            String idcustomer = request.getParameter("idcustomer");
            
            // check mã 
            promotionDAL p = new  promotionDAL();
            promotion promo= new promotion();
            promo = p .checkpromotion(namePromotion);
                   
                    historyPromoDAL his = new historyPromoDAL();
                   int kq= his.checkPromo(3, namePromotion);
                  
                    if(kq==0){
                   Float saleOff = promo.getSaleOff();
                   Float priceMax = promo.getPriceMax();
                       if(saleOff !=null){
                                                 

                             saleOff1 = totalprice*(saleOff/100);
                          System.out.print(totalprice);
                          System.out.print(saleOff1);

                          double discountedPrice = totalprice - Math.min(saleOff1, priceMax);
                           historyPromo h = new historyPromo();
                           h.setIdidCustomer(3);
                           h.setNamePro(namePromotion);
                           historyPromoDAL hiss = new historyPromoDAL();
                           hiss.insertHistoryPromo(h);
                           System.err.println(discountedPrice);
                           request.setAttribute("discount", saleOff1);
                           request.setAttribute("discountedprice", Math.min(saleOff1, priceMax));
                           request.setAttribute("note", "apply success");
                                   request.getRequestDispatcher("confirm.jsp").forward(request, response);

                   }else{
                      request.setAttribute("note", "no find discount code");

                   }}else{
                        System.out.println("ma giam gia het han");
                        request.setAttribute("note", "Discount code has expired");
                        
                    }
           
        request.getRequestDispatcher("confirm.jsp").forward(request, response);
            }

        // Forward to JSP for displaying the cart or items
        
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        processRequest(request, response);
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

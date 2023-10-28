/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.category;
import DAL.categoryDAL;
import DAL.product;
import DAL.productDAL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.util.List;
/**
 *
 * @author Thanhchan
 */
@WebServlet({"/show-product", "/add-product", "/update-poduct","/delete-product","/save-product","/home","/category"})
public class productController extends HttpServlet {

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
            out.println("<title>Servlet productController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet productController at " + request.getContextPath() + "</h1>");
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
     if(uri.contains("show-product")) { // [Tính diện tích].Click
         String id_category=request.getParameter("id_category");
         
         categoryDAL c = new categoryDAL();
         List<category> cate = c.readcategory();
         request.setAttribute("cate", cate);
              
 productDAL p = new productDAL();
        List <product> list = p.readproduct();
        request.setAttribute("data", list);
        request.getRequestDispatcher("listProduct.jsp").forward(request, response);
//        
//        request.getRequestDispatcher("listCategory.jsp").forward(request, response);
        
}
else if(uri.contains("add-product")){ // [Tính chu vi].Click
String nameProduct = request.getParameter("nameProduct");
            String introduce = request.getParameter("introduce");

            String image = request.getParameter("image");

            String size = request.getParameter("size");
            String stuff = request.getParameter("stuff");
            String quantity = request.getParameter("quantity");
            String portray = request.getParameter("portray");




        
            float price = Float.parseFloat(request.getParameter("price"));
              

            productDAL product = new productDAL();
            product pro= new product();
            pro.setNameProduct(nameProduct);
            pro.setIntroduce(introduce);
            pro.setImage(image);
            pro.setSize(size);
            pro.setStuff(stuff);
            pro.setQuantity(quantity);
            pro.setPrice(price);
            pro.setPortray(portray);
            product.insertproduct(pro);
            request.setAttribute("mess", "add thành công");
//            request.getRequestDispatcher("listproduct.jsp").forward(request, response);

           response.sendRedirect("show-product");
}else if(uri.contains("update-product")){ // [Tính chu vi].Click
 
  int id =   Integer.parseInt( request.getParameter("id"));
        
productDAL p = new productDAL();
product pro = new product();
pro = p.findProduct(id);
request.setAttribute("proupdate", pro);
                                request.getRequestDispatcher("updatePro.jsp").forward(request, response);     
}else if(uri.contains("save-product")){ // [Tính chu vi].Click
 int id =Integer.parseInt(request.getParameter("IdProduct"));
         String nameProduct = request.getParameter("nameProduct");
         String introduce = request.getParameter("introduce");
         String image = request.getParameter("image");
         String size = request.getParameter("size");
         String stuff = request.getParameter("stuff");
         String quantity = request.getParameter("quantity");
         float price	 = Float.parseFloat(request.getParameter("price"));
         String portray = request.getParameter("portray");

         
            product pro = new product();
            pro.setNameProduct(nameProduct);
            pro.setIntroduce(introduce);
            pro.setImage(image);
            pro.setSize(size);
            pro.setStuff(stuff);
            pro.setQuantity(quantity);
            pro.setPrice(price);
            pro.setPortray(portray);
           
            productDAL p = new productDAL();
            p.updatePro(pro,id);
           request.setAttribute("message", "update thành công");
                      response.sendRedirect("show-product");
}else if(uri.contains("home")){ // [Tính chu vi].Click
    String id_category=request.getParameter("id_category");
         System.out.print(id_category);
        
    categoryDAL c = new categoryDAL();
        List <category> listcate = c.readcategory();
        request.setAttribute("datacate", listcate);
 productDAL p = new productDAL();
        List <product> list = p.readproduct();
        request.setAttribute("data", list);
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
         
}if(uri.contains("category")){ // [Tính chu vi].Click
    String id_category=request.getParameter("id_category");
         System.out.print(id_category);
        
    categoryDAL c = new categoryDAL();
        List <category> listcate = c.readcategory();
        request.setAttribute("datacate", listcate);
 productDAL p = new productDAL();
        List <product> list = p.findproductbyId_category(Integer.parseInt(id_category));
        request.setAttribute("data", list);
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
         
}else {
  String id = request.getParameter("id");
                
                   productDAL p = new productDAL();
                   p.deleteproduct( parseInt(id)  );
                   response.setContentType("text/html");
                   response.sendRedirect("show-product");
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

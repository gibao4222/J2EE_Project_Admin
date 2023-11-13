/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.CreateID;
import Model.category;
import DAL.categoryDAL;
import Model.ProductModel;
import DAL.ProductDAL;
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
@WebServlet({"/product", "/add-product", "/update-poduct","/delete-Product","/save-product","/home","/category"})
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
       ProductDAL p = new ProductDAL();
        List <ProductModel> list = p.readProduct();
        System.out.println(list.get(0).getNameProduct());
        request.setAttribute("data", list);
        categoryDAL c = new categoryDAL();
         List<category> cate = c.readcategory();
         request.setAttribute("cate", cate);
         
        request.getRequestDispatcher("listProduct.jsp").forward(request, response);
//     if(uri.contains("show-product")) { // [Tính diện tích].Click
//         String id_category=request.getParameter("id_category");
//         
         
//              
//        ProductDAL p = new ProductDAL();
//        List <ProductModel> list = p.readProduct();
//        request.setAttribute("data", list);
//        request.getRequestDispatcher("listProduct.jsp").forward(request, response);
//
//        
//}
//        else if(uri.contains("update-product")){ // [Tính chu vi].Click
// 
//  int id =   Integer.parseInt( request.getParameter("id"));
//        
//ProductDAL p = new ProductDAL();
//ProductModel pro = new ProductModel();
//pro = p.findProduct(id);
//request.setAttribute("proupdate", pro);
//                                request.getRequestDispatcher("updatePro.jsp").forward(request, response);     
//}else if(uri.contains("save-product")){ // [Tính chu vi].Click
// int id =Integer.parseInt(request.getParameter("IdProduct"));
//         String nameProduct = request.getParameter("nameProduct");
//         String introduce = request.getParameter("introduce");
//         String image = request.getParameter("image");
//         String size = request.getParameter("size");
//         String stuff = request.getParameter("stuff");
//         int quantity = Integer.parseInt(request.getParameter("quantity"));
//         float price	 = Float.parseFloat(request.getParameter("price"));
//         String portray = request.getParameter("portray");
//
//         
//            ProductModel pro = new ProductModel();
//            pro.setNameProduct(nameProduct);
//            pro.setIntroduce(introduce);
//            pro.setImage(image);
//            pro.setSize(size);
//            pro.setStuff(stuff);
//            pro.setQuantity(quantity);
//            pro.setPrice(price);
//            pro.setPortray(portray);
//           
//            ProductDAL p = new ProductDAL();
//            p.updatePro(pro,id);
//           request.setAttribute("message", "update thành công");
//                      response.sendRedirect("show-product");
//}else if(uri.contains("home")){ // [Tính chu vi].Click
//    String id_category=request.getParameter("id_category");
//         System.out.print(id_category);
//        
//    categoryDAL c = new categoryDAL();
//        List <category> listcate = c.readcategory();
//        request.setAttribute("datacate", listcate);
// ProductDAL p = new ProductDAL();
//        List <ProductModel> list = p.readProduct();
//        request.setAttribute("data", list);
//        request.getRequestDispatcher("homepage.jsp").forward(request, response);
//         
//}if(uri.contains("category")){ // [Tính chu vi].Click
//    String id_category=request.getParameter("id_category");
//         System.out.print(id_category);
//        
//    categoryDAL c = new categoryDAL();
//        List <category> listcate = c.readcategory();
//        request.setAttribute("datacate", listcate);
// ProductDAL p = new ProductDAL();
//        List <ProductModel> list = p.findproductbyId_category(Integer.parseInt(id_category));
//        request.setAttribute("data", list);
//        request.getRequestDispatcher("homepage.jsp").forward(request, response);
         
// if(uri.contains("delete-product")) {
//  String id = request.getParameter("id");
//                
//                   
//                   p.deleteproduct( id  );
//                   response.setContentType("text/html");
//                   request.setAttribute("ji", "ji");
//                   response.sendRedirect("product");
//        request.getRequestDispatcher("listProduct.jsp").forward(request, response);

//}
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
        ProductDAL product = new ProductDAL();
        if(uri.contains("add-product")){ // [Tính chu vi].Click
            String nameProduct = request.getParameter("nameProduct");
            String introduce = request.getParameter("introduce");

            String image = request.getParameter("image");
            String idCategory = request.getParameter("id_category");
            String size = request.getParameter("size");
            String stuff = request.getParameter("stuff");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String portray = request.getParameter("portray");




        
            float price = Float.parseFloat(request.getParameter("price"));
              

            
            ProductModel pro= new ProductModel();
            pro.setIdProduct(new CreateID("PR").create());
            pro.setIdCategory(idCategory);
            pro.setNameProduct(nameProduct);
            pro.setIntroduce(introduce);
            pro.setImage(image);
            pro.setSize(size);
            pro.setStuff(stuff);
            pro.setQuantity(quantity);
            pro.setPrice(price);
            pro.setPortray(portray);
            product.addProduct(pro);
//            request.setAttribute("mess", "add thành công");
//            request.getRequestDispatcher("listproduct.jsp").forward(request, response);
//
           response.sendRedirect("product");
}
//                 else if(uri.contains("delete-product")) {
//  String id = request.getParameter("id");
//                     System.out.println(id);
//                   ProductDAL p = new ProductDAL();
//                   p.deleteproduct( id  );
//                   response.setContentType("text/html");
////                   response.sendRedirect("product");
//}
    else if(uri.contains("delete-Product")){
        String idProduct = String.valueOf(request.getParameter("idProduct"));
        product.deleteproduct(idProduct);
        response.sendRedirect("product");
    }
        else if(uri.contains("save-product")){ // [Tính chu vi].Click
            String id =request.getParameter("IdProduct");
            String nameProduct = request.getParameter("nameProduct");
            String introduce = request.getParameter("introduce");
            String image = request.getParameter("image");
            System.out.println(image);
            String size = request.getParameter("size");
            String stuff = request.getParameter("stuff");
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            float price	 = Float.parseFloat(request.getParameter("price"));
            String portray = request.getParameter("portray");
            String idCategory = request.getParameter("id_category");
         
            ProductModel pro = new ProductModel();
            pro.setNameProduct(nameProduct);
            pro.setIntroduce(introduce);
            pro.setImage(image);
            pro.setSize(size);
            pro.setStuff(stuff);
            pro.setQuantity(quantity);
            pro.setPrice(price);
            pro.setPortray(portray);
           pro.setIdCategory(idCategory);
            ProductDAL p = new ProductDAL();
            p.updatePro(pro,id);
           request.setAttribute("message", "update thành công");
                      response.sendRedirect("product");
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
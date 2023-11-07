/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.category;
import DAL.categoryDAL;
import DAL.product;
import DAL.productDAL;
import DAL.subimage;
import DAL.subimageDAL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.util.List;

/**
 *
 * @author Thanhchan
 */
@WebServlet({"/show-subimage", "/add-subimage", "/edit-subimage","/delete-subimage","/save-subimage"})
public class subimageController extends HttpServlet {

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
            out.println("<title>Servlet subimageController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet subimageController at " + request.getContextPath() + "</h1>");
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
     if(uri.contains("show-subimage")) { // [Tính diện tích].Click
 productDAL p = new productDAL();
        List <product> list1 = p.readproduct();
        request.setAttribute("pro", list1);
  subimageDAL s = new subimageDAL();
        List <subimage> list = s.readsubimage();
        request.setAttribute("data", list);
       
        request.getRequestDispatcher("listSubimage1.jsp").forward(request, response);
//        
//        request.getRequestDispatcher("listCategory.jsp").forward(request, response);
        
}
else if(uri.contains("add-subimage")){ // [Tính chu vi].Click
subimage cate = new subimage();
subimageDAL c = new subimageDAL();
String idProduct = request.getParameter("idProduct");
String subImage = request.getParameter("subImage");

String note = request.getParameter("note");

cate.setIdProduct(idProduct);
cate.setSubImage(subImage);
cate.setNote(note);


c.insertsubimage(cate);
response.sendRedirect("show-subimage");
}else if(uri.contains("edit-subimage")){ // [Tính chu vi].Click
 
int id =   Integer.parseInt( request.getParameter("id"));
out.print(id);
        
subimageDAL s = new subimageDAL();
subimage sub = new subimage();
sub = s.findsubimage(id);
request.setAttribute("subupdate", sub);      
request.getRequestDispatcher("updateSubimage.jsp").forward(request, response);    
}else if(uri.contains("save-subimage")){ // [Tính chu vi].Click
 int id =Integer.parseInt(request.getParameter("idSubImage"));
         String idProduct = request.getParameter("idProduct");
                  String subImage = request.getParameter("subImage");

                           String note = request.getParameter("note");

           subimage sub = new subimage();
            sub.setIdProduct(idProduct);
                        sub.setSubImage(subImage);

                                    sub.setNote(note);

            
           
            subimageDAL s = new subimageDAL();
            s.updatesubimage(sub,id);
           request.setAttribute("message", "update thành công");
                     

response.sendRedirect("show-subimage");
}else {
  subimageDAL c = new subimageDAL();
             int id = Integer.parseInt(request.getParameter("id"));
             c.deletesubimage(id);
               response.sendRedirect("show-subimage");
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

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import DAL.CreateID;
import DAL.ProductDAL;
import DAL.SubImageDAL;
import Model.ProductModel;
import Model.SubImgModel;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import static java.lang.System.out;
import java.nio.file.Paths;
import java.util.List;

/**
 *
 * @author Admin
 */
@MultipartConfig(location = "C:\\Users\\Admin\\Documents\\NetBeansProjects\\J2EE_Project_Admin\\web")
@WebServlet({"/subimage", "/add-subimage", "/edit-subimage","/delete-subimage","/save-subimage"})
public class SubImageServlet extends HttpServlet {
   
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
            out.println("<title>Servlet SubImageController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubImageController at " + request.getContextPath () + "</h1>");
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
        ProductDAL p = new ProductDAL();
        List <ProductModel> list1 = p.readProduct();
        request.setAttribute("pro", list1);
        SubImageDAL s = new SubImageDAL();
        List <SubImgModel> list = s.readsubimage();
        request.setAttribute("data", list);
       
        request.getRequestDispatcher("listSubImage.jsp").forward(request, response);
        
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
        try {
        String uri = request.getRequestURI();
        if(uri.contains("add-subimage")){
            SubImgModel cate = new SubImgModel();
            SubImageDAL c = new SubImageDAL();
            String idSubImage = new CreateID("SI").create();
            String idProduct = request.getParameter("idProduce_SubImg");
            
                
            
            Part part = request.getPart("imageSub");

                    
                
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                

            part.write("resources\\subimg\\"+filename);

            cate.setIdSubImage(idSubImage);
            cate.setIdProduct(idProduct);
            cate.setSubImage(filename);
            cate.setNote("");

            int rs = c.insertsubimage(cate);
            if(rs!=0){
                response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                   response.getWriter().write("{\"rs\": \""+rs+"\"}");
            }
            response.sendRedirect("productDetail?idProduct="+idProduct);
           
        }else if(uri.contains("save-subimage")){ // [Tính chu vi].Click
            String id =request.getParameter("idSubImg");
            String idProduct = request.getParameter("idProduce_SubImg");
            
            Part part = request.getPart("imageSub");

                    
                
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                
            System.out.println(filename);
            part.write("resources\\subimg\\"+filename);
            SubImgModel sub = new SubImgModel();
            sub.setIdProduct(idProduct);
            sub.setSubImage(filename);

            sub.setNote("");

            
           
            SubImageDAL s = new SubImageDAL();
            int rs = s.updatesubimage(sub,id);
            if(rs!=0){
                response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                   response.getWriter().write("{\"rs\": \""+rs+"\"}");
            }
            request.setAttribute("message", "update thành công");
                     

            response.sendRedirect("show-subimage");
        }else {
            SubImageDAL c = new SubImageDAL();
            String idProduct = request.getParameter("idProduct");
            String id = (request.getParameter("idSubImage"));
            c.deletesubimage(id);
            response.sendRedirect("productDetail?idProduct="+idProduct);
        }
                } catch (Exception e) {
                    System.out.println(e);
        }
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

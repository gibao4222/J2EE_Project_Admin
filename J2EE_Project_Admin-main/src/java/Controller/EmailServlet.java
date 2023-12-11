/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAL.SenderEmail;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/EmailServlet")
public class EmailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Lấy thông tin từ request hoặc session (nếu cần)
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String body = request.getParameter("body");

        // Gọi phương thức gửi email từ class
          SenderEmail e = new SenderEmail();
        e.sendEmail("voquang17@gmail.com", "ccccc", "cccc");

        // Các xử lý khác nếu cần
        response.getWriter().println("Email sent successfully!");
    }
}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.activation.DataHandler;
import jakarta.activation.DataSource;
import jakarta.activation.FileDataSource;
import java.util.Properties;

public class SenderEmail {

    public static void sendEmail(String to, String subject, String body) {
        // Điều chỉnh thông tin email của bạn
        String from = "vainglory791@gmail.com";
        String host = "smtp.gmail.com"; // Điều chỉnh nếu bạn sử dụng dịch vụ email khác

        // Thiết lập thông tin đăng nhập
        final String username = "vainglory791@gmail.com";
        final String password = "pjvl bvlx podv niqm";

        // Thiết lập thuộc tính hệ thống
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Tạo phiên làm việc và kết nối
        Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo đối tượng MimeMessage
            MimeMessage message = new MimeMessage(session);

            // Thiết lập địa chỉ người gửi
            message.setFrom(new InternetAddress(from));

            // Thiết lập địa chỉ người nhận
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Thiết lập tiêu đề
            message.setSubject(subject);

            // Thiết lập nội dung của email
            message.setText(body);

            // Gửi email
            Transport.send(message);
            System.out.println("Email sent successfully!");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
    }
    public static void main(String[] args) {
         
        SenderEmail e = new SenderEmail();
        e.sendEmail("voquang17@gmail.com", "ccccc", "cccc");
    }
}


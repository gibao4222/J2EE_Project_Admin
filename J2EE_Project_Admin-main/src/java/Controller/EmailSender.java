package Controller;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class EmailSender {
    private static final String EMAIL_USERNAME = "vainglory791@gmail.com";
    private static final String EMAIL_PASSWORD = "tips iasu kwwk uawg";

    public static void sendOrderConfirmation(String recipientEmail, String orderDetails) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("Xác nhận Đơn Hàng");
            message.setText("Chúc mừng! Đơn hàng của bạn đã được xác nhận.\n\nChi tiết đơn hàng:\n" + orderDetails);

            Transport.send(message);

            System.out.println("Email sent successfully to: " + recipientEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
         String customerEmail = "voquang17@gmail.com"; // Lấy từ thông tin đơn hàng
        String orderDetails = "Chi tiết đơn hàng..."; // Lấy từ thông tin đơn hàng
        EmailSender.sendOrderConfirmation(customerEmail, orderDetails);
             
    }
}

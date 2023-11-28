/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
/**
 *
 * @author Thanhchan
 */
public class maill {
    private String username; // Địa chỉ email của bạn
    private String password; // Mật khẩu email của bạn

    public maill(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public void sendEmail(String toEmail, String subject, String messageBody) throws MessagingException {
        // Cài đặt thông tin kết nối với máy chủ email
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.your-email-provider.com"); // Thay thế bằng địa chỉ SMTP của nhà cung cấp email của bạn
        props.put("mail.smtp.port", "587");

        // Tạo phiên kết nối với máy chủ email
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        // Tạo đối tượng thư
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject(subject);
        message.setText(messageBody);

        // Gửi thư
        Transport.send(message);
    }
}

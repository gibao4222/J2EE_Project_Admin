import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailSender {
    private String email;
    private String password;

    public EmailSender(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public void sendEmail(String to, String subject, String text) {
        // Cài đặt thông tin máy chủ SMTP của Gmail
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo phiên làm việc (Session)
        Session session = Session.getInstance(props,
            new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(email, password);
                }
            });

        try {
            // Tạo đối tượng MimeMessage
            Message message = new MimeMessage(session);
            // Thiết lập người gửi
            message.setFrom(new InternetAddress(email));
            // Thiết lập người nhận
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            // Thiết lập chủ đề
            message.setSubject(subject);
            // Thiết lập nội dung email
            message.setText(text);

            // Gửi email
            Transport.send(message);

            System.out.println("Email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        // Thay thế thông tin đăng nhập của bạn
        EmailSender emailSender = new EmailSender("vainglory791@gmail.com", "tips iasu kwwk uawg");

        // Thay thế thông tin người nhận, chủ đề, và nội dung email của bạn
        emailSender.sendEmail("nq2017.tranvungocthanh251202@gmail.com", "Xác nhận đơn hàng thành công", "vui lòng để ý điện thoại để nhận hàng");
    }
}

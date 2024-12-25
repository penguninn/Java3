package bai2;

import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMessage.RecipientType;

public class Mailer {
    public static void send(String from, String to, String subject, String content) {
        // Thông số kết nối GMail
        Properties props = new Properties();
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.port", "587");
        // Đăng nhập GMail
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                String username = "";
                String password = "";
                return new PasswordAuthentication(username, password);
            }
        });
        try {
            // Tạo mail
            MimeMessage mail = new MimeMessage(session);
            mail.setFrom(new InternetAddress(from));
            mail.setRecipients(RecipientType.TO, to);
            mail.setSubject(subject, "utf-8");
            mail.setText(content, "utf-8", "html");
            mail.setReplyTo(mail.getFrom());
            // Gửi mail
            Transport.send(mail);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

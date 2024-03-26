/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.dao;

import java.io.Serializable;
import java.util.Properties;
import java.util.Random;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import phatntt.dto.EmailDTO;


/**
 *
 * @author Admin
 */
public class EmailDAO implements Serializable {

    
    public String getRandom() {
        Random rnd = new Random();
        int code = rnd.nextInt(999999);
        return String.format("%06d", code);
    }

    public boolean sendEmailVerify(EmailDTO email) {
        boolean result = false;
        // Email configuration
        final String fromEmail = "furnitureproject1910@gmail.com"; //  email 
        final String password = "bbzx alxk ebrg jchn"; //  mật khẩu 
        final String toEmail = email.getEmail();
        // SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Session
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });
        
        // Message      
        Message message = new MimeMessage(session);
        try {
            message.addHeader("Content-type", "text/HTML ; chartset=UTF-8");
            message.setFrom(new InternetAddress(fromEmail));       
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            
            message.setSubject("Email Verification");
            message.setContent("<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "<head>\n"
                    + "    <meta charset=\"UTF-8\">\n"
                    + "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
                    + "    <title>Email Verification Code</title>\n"
                    + "    <style>\n"
                    + "        body {\n"
                    + "            display: flex;\n"
                    + "            justify-content: center;\n"
                    + "            align-items: center;\n"
                    + "            height: 100vh;\n"
                    + "            margin: 0;\n"
                    + "        }\n"
                    + "        \n"
                    + "        .verification-form {\n"
                    + "            text-align: center;\n"
                    + "            width: 550px;\n"
                    + "            height: 250px;\n"
                    + "            padding: 20px;\n"
                    + "            background-color: #fff;\n"
                    + "            border-radius: 1rem;\n"
                    + "            border: 1px solid #ccc;\n"
                    + "        }\n"
                    + "        \n"
                    + "        .form-group {\n"
                    + "            margin-bottom: 15px;\n"
                    + "            text-align: center;\n"
                    + "        }\n"
                    + "        \n"
                    + "        label {\n"
                    + "            display: block;\n"
                    + "            margin-bottom: 5px;\n"
                    + "            font-weight: bold;\n"
                    + "        }\n"
                    + "        \n"
                    + "        #verificationCode {\n"
                    + "            font-size: 24px;\n"
                    + "            width: 25%;\n"
                    + "            margin-left: 190px;\n"
                    + "            padding: 15px;\n"
                    + "            letter-spacing: 6px;\n"
                    + "            font-weight: 600;\n"
                    + "        }\n"
                    + "        .verification-form h2 {"
                    + "            color: #f3a270;\n"
                    + "        }\n"
                    + "    </style>\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "\n"
                    + "    <div class=\"verification-form\">\n"
                    + "        <h2>Welcomes to the Lux Furniture !</h2>\n"
                    + "        <p>Thank you for being one of our beloved customers</p>\n"
                    + "        <p style=\"font-size: 12px;\">Please enter this code in the verification form to confirm your account</p>\n"
                    + "\n"
                    + "        <div class=\"form-group\">\n"
                    + "            <label for=\"verificationCode\">Verification Code:</label>\n"
                    + "            <p id=\"verificationCode\" name=\"verificationCode\">" + email.getCode() + "</p>\n"
                    + "        </div>\n"
                    + "\n"
                    + "\n"
                    + "    </div>\n"
                    + "\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>", "text/html");
            // Noi dung

            // Send the email
            Transport.send(message);
            result = true;

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    
    public void sendEmailTksForOrdering(String email) {
        // Email configuration
        final String fromEmail = "furnitureproject1910@gmail.com"; //  email 
        final String password = "bbzx alxk ebrg jchn"; //  mật khẩu 
        final String toEmail = email;
        // SMTP server properties
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Session
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(fromEmail, password);
                    }
                });

        // Message      
        Message message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Thanks For Ordering");
            
            // Content
            String htmlContent = "<!DOCTYPE html>"
                                + "<html lang=\"en\">"
                                + "<head>"
                                + "<meta charset=\"UTF-8\">"
                                + "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
                                + "<title>Thank You for Ordering</title>"
                                + "<style>"
                                + "body {"
                                + "font-family: Arial, sans-serif;"
                                + "}"
                                + ".container {"
                                + "width: 80%;"
                                + "margin: auto;"
                                + "}"
                                + ".card {"
                                + "background-color: #fff;"
                                + "border-radius: 8px;"
                                + "box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);"
                                + "margin-top: 50px;"
                                + "}"
                                + ".card-header {"
                                + "background-color: #28a745;"
                                + "color: #fff;"
                                + "padding: 10px;"
                                + "border-top-left-radius: 8px;"
                                + "border-top-right-radius: 8px;"
                                + "}"
                                + ".card-body {"
                                + "padding: 20px;"
                                + "}"
                                + "</style>"
                                + "</head>"
                                + "<body>"
                                + "<div class=\"container\">"
                                + "<div class=\"card\">"
                                + "<div class=\"card-header\">"
                                + "<h2 style=\"text-align: center;\">Thank You for Ordering</h2>"
                                + "</div>"
                                + "<div class=\"card-body\">"
                                + "<p>Dear Customer,</p>"
                                + "<p>We would like to extend our sincere gratitude for placing your order with us. Your business is greatly appreciated.</p>"
                                + "<p>If you have any questions or concerns regarding your order, feel free to contact us.</p>"
                                + "<p>Thank you again for choosing us. We look forward to serving you again in the future.</p>"
                                + "<p>Sincerely,</p>"
                                + "<p>The Furniture Project Team</p>"
                                + "</div>"
                                + "</div>"
                                + "</div>"
                                + "</body>"
                                + "</html>";
            
            message.setContent(htmlContent, "text/html");

            // Send the email
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }

}

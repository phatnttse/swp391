package com.swp391.eFurniture.services;

import com.swp391.eFurniture.dtos.DataMailDTO;
import com.swp391.eFurniture.dtos.UserDTO;
import com.swp391.eFurniture.utils.Constants;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring6.SpringTemplateEngine;

import java.util.HashMap;
import java.util.Map;

@Service
@Slf4j
public class MailService implements IMailService{
    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private SpringTemplateEngine templateEngine;

    @Override
    public void sendHtmlMail(DataMailDTO dataMail, String templateName) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();

        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

        Context context = new Context();
        context.setVariables(dataMail.getProps());

        String html = templateEngine.process(templateName, context);

        helper.setTo(dataMail.getTo());
        helper.setSubject(dataMail.getSubject());
        helper.setText(html, true);

        mailSender.send(message);
    }

    @Override
    public void sendEmail(UserDTO userDTO) {
        try {
            DataMailDTO dataMail = new DataMailDTO();

            dataMail.setTo(userDTO.getEmail());
            dataMail.setSubject("Xac nhan thong tin");

            Map<String, Object> props = new HashMap<>();
            props.put("name", userDTO.getName());
            props.put("username", userDTO.getUsername());
            props.put("password", userDTO.getPassword());
            dataMail.setProps(props);

            sendHtmlMail(dataMail, Constants.EMAIL_FEATURE.EMAIL_FILE);

        } catch (MessagingException exp){
            exp.printStackTrace();
        }

    }

}

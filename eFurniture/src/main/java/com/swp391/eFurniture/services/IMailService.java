package com.swp391.eFurniture.services;

import com.swp391.eFurniture.dtos.DataMailDTO;
import com.swp391.eFurniture.dtos.EmailDTO;
import com.swp391.eFurniture.dtos.UserDTO;
import jakarta.mail.MessagingException;

public interface IMailService {
    void sendHtmlMail(DataMailDTO dataMail, String templateName) throws MessagingException;
    void sendEmail(EmailDTO emailDTO);

    String getRandom();

}

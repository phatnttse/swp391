package com.swp391.eFurniture.controllers;

import com.swp391.eFurniture.dtos.EmailDTO;
import com.swp391.eFurniture.dtos.UserDTO;
import com.swp391.eFurniture.services.MailService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("email")
@RequiredArgsConstructor
public class EmailController {
    @Autowired
    private final MailService mailService;

    @PostMapping("/confirmVerify")
    public String confirmVerify(@Valid @RequestParam("userRegister") UserDTO userDTO,
                                Model model){
        String email = userDTO.getEmail();
        String code = mailService.getRandom();
        EmailDTO emailDTO = new EmailDTO(email, code);
        mailService.sendEmail(emailDTO);
        model.addAttribute("userRegister", userDTO);
        return "views/verifyCode";
    }
}

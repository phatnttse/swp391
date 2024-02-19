package com.swp391.eFurniture.controllers;

import com.swp391.eFurniture.dtos.UserDTO;
import com.swp391.eFurniture.dtos.UserLoginDTO;
import com.swp391.eFurniture.models.Role;
import com.swp391.eFurniture.models.User;
import com.swp391.eFurniture.services.IMailService;
import com.swp391.eFurniture.services.IUserService;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("users")
@RequiredArgsConstructor
public class UserController {
    @Autowired
    private final IMailService mailService;

    @Autowired
    private final IUserService userService;

    @GetMapping("/register")
    public String registerForm(Model model) {
        UserDTO user = new UserDTO();
        model.addAttribute("user", user);
        return "views/register";
    }

    @GetMapping("/login")
    public String loginForm(Model model){
        UserDTO user = new UserDTO();
        model.addAttribute("userLogin", user);
        return "views/login";
    }

    @PostMapping("/register")
    public String register(
            @Valid @ModelAttribute("user") UserDTO userDTO,
            BindingResult result,
            Model model
    ){
        try {
            if (result.hasErrors()){
                model.addAttribute("user", userDTO);
                return "redirect:/users/register";
            }
            if (!userDTO.getConfirmPassword().equals(userDTO.getPassword())){
                model.addAttribute("confirm_pass_notMatch", "Mật khẩu nhập lại không chính xác");
                return "views/register";
            }
            mailService.sendEmail(userDTO);
            userService.register(userDTO);
            return "redirect:/home";
        }catch (Exception e){
            System.out.println(e.getMessage());
            model.addAttribute("errorMessage", "Registration failed");
            return "views/register";
        }
    }
    @PostMapping("/login")
    public String login(
            @Valid @ModelAttribute("userLogin") User userDTO,
            BindingResult result,
            Model model,
            HttpServletResponse response
    ) throws Exception {
        try {
            if (result.hasErrors()){
                List<String> errorMessages = result.getFieldErrors()
                        .stream()
                        .map(FieldError::getDefaultMessage)
                        .toList();
                System.out.println(errorMessages.toString());
                model.addAttribute("userLogin", userDTO);
                return "redirect:/users/login";
            }
            //Kiểm tra thông tin ng dùng đăng nhập và tạo ra token
            String token = userService.login(userDTO.getUsername(), userDTO.getPassword());
            // Lưu token vào header của phản hồi
            response.setHeader("Authorization", "Bearer " + token);
            // Lưu token vào localStorage bằng JavaScript
            model.addAttribute("token", token);
            return "redirect:/home";
        }catch (Exception e){
            System.out.println(e.getMessage());
            return "views/login";
        }
    }


}

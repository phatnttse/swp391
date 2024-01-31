package com.swp391.eFurniture.controllers;

import com.swp391.eFurniture.dtos.UserDTO;
import com.swp391.eFurniture.models.Role;
import com.swp391.eFurniture.models.User;
import com.swp391.eFurniture.services.IUserService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("users")
@RequiredArgsConstructor
public class UserController {

    @Autowired
    private final IUserService userService;

    @GetMapping("/register")
    public String registerForm(Model model) {
        UserDTO user = new UserDTO();
        model.addAttribute("user", user);
        return "views/register";
    }

    @GetMapping("/login")
    public String loginDispatch(){
        return "views/login";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("user") UserDTO userDTO,
            BindingResult result,
            Model model
    ){
        try {
            userService.register(userDTO);
          model.addAttribute("successMessage", "Registration successful!");
          return "redirect:/home";
        }catch (Exception e){
            System.out.println(e.getMessage());
            model.addAttribute("errorMessage", "Registration failed");
            return "views/register";
        }
    }



}

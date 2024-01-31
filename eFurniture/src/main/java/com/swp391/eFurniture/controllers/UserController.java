package com.swp391.eFurniture.controllers;

import com.swp391.eFurniture.dtos.UserDTO;
import com.swp391.eFurniture.models.Role;
import com.swp391.eFurniture.models.User;
import com.swp391.eFurniture.services.IUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("users")
@RequiredArgsConstructor
public class UserController {

    @Autowired
    private final IUserService userService;

    @GetMapping("/register")
    public String registerDispatch() {
        return "views/register";
    }

    @GetMapping("/login")
    public String loginDispatch(){
        return "views/login";
    }

    @PostMapping("/register")
    public String register(
            @RequestParam("fullName") String name,
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("confirmPassword") String confirmPassword,
            @RequestParam("email") String email,
            Model model
    ){
        try {
          User newUser = userService.register(name,username,password, email);
          model.addAttribute("successMessage", "Registration successful!");
          return "views/home";
        }catch (Exception e){
            System.out.println(e.getMessage());
            model.addAttribute("errorMessage", "Registration failed");
            return "views/register";
        }
    }



}

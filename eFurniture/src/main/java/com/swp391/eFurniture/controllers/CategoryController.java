package com.swp391.eFurniture.controllers;

import com.swp391.eFurniture.models.Category;
import com.swp391.eFurniture.models.Product;
import com.swp391.eFurniture.services.ICategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("categories")
@RequiredArgsConstructor
public class CategoryController {
    @Autowired
    private final ICategoryService categoryService;

    @GetMapping("")
    public String getAllCategories(Model model) {
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("categories", categories);
        return "home"; // Thymeleaf view template name
    }
}

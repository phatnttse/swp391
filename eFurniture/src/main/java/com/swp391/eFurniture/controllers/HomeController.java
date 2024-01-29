package com.swp391.eFurniture.controllers;

import com.swp391.eFurniture.models.Product;
import com.swp391.eFurniture.services.IProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("home")
@RequiredArgsConstructor
public class HomeController {
    @Autowired
    private final IProductService productService;

    // Phương thức GET để hiển thị trang home khi truy cập đường dẫn "/home"
    @GetMapping("")
    public String showHomePage(@RequestParam(value = "page", defaultValue = "0") int page,
                               @RequestParam(value = "size", defaultValue = "5") int size,
                               Model model) {
        Page<Product> newestProducts = showNewestProducts(page,size);
        model.addAttribute("page", newestProducts);
        return "home";
    }

    @GetMapping("newest")
    public Page<Product> showNewestProducts(@RequestParam("page") int page,
                                     @RequestParam("size") int size) {
        return productService.getNewestProducts(PageRequest.of(page, size));
    }

}

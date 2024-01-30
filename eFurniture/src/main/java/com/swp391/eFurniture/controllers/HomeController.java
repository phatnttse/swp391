package com.swp391.eFurniture.controllers;

import com.swp391.eFurniture.models.Product;
import com.swp391.eFurniture.services.IProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("home")
@RequiredArgsConstructor
public class HomeController {
    @Autowired
    private final IProductService productService;

    @GetMapping("")
    public String index(Model model) {
        Page<Product> page = productService.getNewestProducts(PageRequest.of(0,4));
        model.addAttribute("products", page.getContent());
        model.addAttribute("page", page);
        return "home";
    }
    @GetMapping("/page")
    public ResponseEntity<String> getPage(Model model, @RequestParam(defaultValue = "0") int page) {
        Page<Product> pageable = productService.getNewestProducts(PageRequest.of(page, 4));
        model.addAttribute("products", pageable.getContent());
        String newestProductsHtml = generateProductHtml(pageable.getContent()); // Tạo HTML từ danh sách sản phẩm
        return ResponseEntity.ok().body(newestProductsHtml);
    }
    private String generateProductHtml(List<Product> products) {
        StringBuilder htmlBuilder = new StringBuilder();
        for (Product product : products) {
            htmlBuilder.append("<div th:each=\"product : ${products}\" class=\"col-lg-3 col-6 col-xl-3 col-md-4 col-sm-6 col-fix\">");
            htmlBuilder.append("<div class=\"product-action\">");
            htmlBuilder.append("<div class=\"product-thumbnail\">");
            htmlBuilder.append("<a class=\"image_thumb\">");
            htmlBuilder.append("<img width=\"520\" height=\"520\" class=\"lazyload loaded\" src=\"" + product.getThumbnail() + "\">");
            htmlBuilder.append("</a>");
            htmlBuilder.append("<div class=\"smart\">");
            htmlBuilder.append("<span>" + '-' + product.getDiscount() * 100 + '%' + "</span>");
            htmlBuilder.append("</div>");
            htmlBuilder.append("<a class=\"btn-wishlist\">");
            htmlBuilder.append("<i class=\"fas fa-search\"></i>");
            htmlBuilder.append("</a>");
            htmlBuilder.append("<div class=\"badge\">");
            htmlBuilder.append("<span class=\"new\">" + product.getPurchases() + " lượt mua" + "</span>");
            htmlBuilder.append("</div>");
            htmlBuilder.append("</div>");
            htmlBuilder.append("<div class=\"product-info\">");
            htmlBuilder.append("<h5 class=\"product-name\">");
            htmlBuilder.append("<a class=\"line-clamp line-clamp-2\" href=\"\"></a>");
            htmlBuilder.append("</h5>");
            htmlBuilder.append("<div class=\"price-box\">" + product.getPrice() * product.getDiscount() + "</div>");
            htmlBuilder.append("<span class=\"compare-price\">" + product.getPrice() + "</span>");
            htmlBuilder.append("</div>");
            htmlBuilder.append("<div class=\"btn-shopping\">");
            htmlBuilder.append("<button type=\"submit\" title=\"Thêm vào giỏ hàng\" class=\"fas fa-shopping-cart\"></button>");
            htmlBuilder.append("</div>");
            htmlBuilder.append("</div>");
            htmlBuilder.append("</div>");

        }
        return htmlBuilder.toString();
    }


}

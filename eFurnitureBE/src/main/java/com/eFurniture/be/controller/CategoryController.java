package com.eFurniture.be.controller;

import com.eFurniture.be.dto.CategoryDTO;
import com.eFurniture.be.model.Category;
import com.eFurniture.be.service.CategoryService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${be.prefix}/categories")
@RequiredArgsConstructor
public class CategoryController {
    private final CategoryService categoryService;
    //Hiển thị tất cả các categories
    @GetMapping("")
    public ResponseEntity<List<Category>> getAllCategories(
            @RequestParam("page") int page,
            @RequestParam("limit") int limit
    ) {
        List<Category> categories = categoryService.getAllCategories();
        return ResponseEntity.ok(categories);
    }
    @PostMapping("")
    public ResponseEntity<Category> createCategory(
            @Valid @RequestBody CategoryDTO categoryDTO,
            BindingResult result
    ) {
        Category newCategory = categoryService.createCategory(categoryDTO);

        return ResponseEntity.ok(newCategory);
    }

    @PutMapping("/{id}")
    public ResponseEntity<String> updateCategory(
            @PathVariable int id,
            @Valid @RequestBody CategoryDTO categoryDTO
    ){
        categoryService.updateCategory(id,categoryDTO);
        return ResponseEntity.ok(" update category with id ="+ id);
    }
    @DeleteMapping("/{id}")
    public ResponseEntity<String> deleteCateGory(@PathVariable int id){
        categoryService.deleteCategory(id);
        return ResponseEntity.ok("delete with category =" +id);
    }
}

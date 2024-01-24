package com.eFurniture.be.service;

import com.eFurniture.be.dto.CategoryDTO;
import com.eFurniture.be.model.Category;

import java.util.List;

public interface ICategoryService {
    Category createCategory(CategoryDTO category);
    Category getCategoryById(int id);
    List<Category> getAllCategories();
    Category updateCategory(int categoryId, CategoryDTO category);
    void deleteCategory(int id);


}

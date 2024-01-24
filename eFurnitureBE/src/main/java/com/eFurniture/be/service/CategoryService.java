package com.eFurniture.be.service;

import com.eFurniture.be.dto.CategoryDTO;
import com.eFurniture.be.model.Category;
import com.eFurniture.be.repositories.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService implements ICategoryService {
    private final CategoryRepository categoryRepository;

    @Override
    public Category createCategory(CategoryDTO categoryDTO) {
        Category newCategory = Category.builder()
                .name(categoryDTO.getName())
                .build();
        return categoryRepository.save(newCategory);
    }

    @Override
    public Category getCategoryById(int id) {
        return categoryRepository.findById(id).orElseThrow(
                () -> new RuntimeException("Category does not exits")
        );
    }

    @Override
    public List<Category> getAllCategories() {
        return categoryRepository.findAll();
    }

    @Override
    public Category updateCategory(int categoryId, CategoryDTO category) {
        Category updateCategory = getCategoryById(categoryId);
        updateCategory.setName(category.getName());
        categoryRepository.save(updateCategory);
        return updateCategory;
    }

    @Override
    public void deleteCategory(int id) {
        categoryRepository.deleteById(id);
    }
}

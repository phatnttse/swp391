package com.swp391.eFurniture.repositories;

import com.swp391.eFurniture.models.Category;
import com.swp391.eFurniture.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {
}

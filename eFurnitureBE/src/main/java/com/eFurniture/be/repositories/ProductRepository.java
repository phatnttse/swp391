package com.eFurniture.be.repositories;

import com.eFurniture.be.dto.ProductDTO;
import com.eFurniture.be.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    Page<Product> findAll(Pageable pageable); //Phan trang
}

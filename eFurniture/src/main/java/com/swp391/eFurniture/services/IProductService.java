package com.swp391.eFurniture.services;

import com.swp391.eFurniture.models.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IProductService {
    Page<Product> getNewestProducts(Pageable pageable);
    Page<Product> getAllProducts(Pageable pageable);
}

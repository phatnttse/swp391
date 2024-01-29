package com.swp391.eFurniture.services;

import com.swp391.eFurniture.models.Product;
import com.swp391.eFurniture.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductService implements IProductService {
    @Autowired
    private final ProductRepository productRepository;
    @Override
    public Page<Product> getNewestProducts(PageRequest pageRequest) {
        return productRepository.findAll(pageRequest);
    }
}

package com.swp391.eFurniture.services;

import com.swp391.eFurniture.models.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.List;

public interface IProductService {
    Page<Product> getNewestProducts(PageRequest pageRequest);
}

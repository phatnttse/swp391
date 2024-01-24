package com.eFurniture.be.service;

import com.eFurniture.be.dto.ProductDTO;
import com.eFurniture.be.dto.ProductImageDTO;
import com.eFurniture.be.exception.DataNotFoundException;
import com.eFurniture.be.model.Product;
import com.eFurniture.be.model.ProductImage;
import com.eFurniture.be.response.ProductResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

public interface IProductService {
    Product createProduct(ProductDTO productDTO) throws DataNotFoundException;
    Product getProductById(int id) throws DataNotFoundException;
    Page<ProductResponse> getAllProducts(PageRequest pageRequest);
    Product updateProduct(int id, ProductDTO productDTO) throws DataNotFoundException;
    void deleteProduct(int id);
    ProductImage createProductImage(
            int productId,
            ProductImageDTO productImageDTO) throws Exception;

}

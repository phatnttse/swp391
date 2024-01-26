package com.eFurniture.be.response;

import com.eFurniture.be.model.Product;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductResponse extends BaseResponse {
    private String title;
    private int price;
    private int quantity;
    private String thumbnail;
    private String description;
    private int purchases;

    @JsonProperty("category_id")
    private int categoryId;

    public static ProductResponse fromProduct(Product product) {
        ProductResponse productResponse = ProductResponse.builder()
                .title(product.getTitle())
                .price(product.getPrice())
                .quantity(product.getQuantity())
                .thumbnail(product.getThumbnail())
                .description(product.getDescription())
                .purchases(product.getPurchases())
                .categoryId(product.getCategory().getCategoryId())
                .build();
        productResponse.setCreatedAt(product.getCreatedAt());
        return productResponse;
    }
}
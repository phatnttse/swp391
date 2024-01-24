package com.eFurniture.be.response;

import com.eFurniture.be.model.Product;
import lombok.*;

import java.util.List;

@AllArgsConstructor
@Data
@Builder
@NoArgsConstructor
@Getter
@Setter
public class ProductListResponse {
    private List<ProductResponse> products;
    private int totalPages;
}

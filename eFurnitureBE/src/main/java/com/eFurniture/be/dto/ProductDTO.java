package com.eFurniture.be.dto;

import com.eFurniture.be.model.BaseEntity;
import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductDTO extends BaseEntity {
    @NotBlank(message = "Title is required")
    @Size(min = 3, max = 255, message = "Title must be between 3 and 255 characters")
    private String title;

    @Min(value = 0, message = "Price must be greater than or equal to 0")
    private int price;

    @Min(value = 0, message = "Quantity must be greater than or equal to 0")
    private int quantity;

    @Min(value = 0, message = "Discount must be greater than or equal to 0")
    private int discount;

    private String thumbnail;

    private String description;

    @JsonProperty("category_id")
    private int categoryId;

}

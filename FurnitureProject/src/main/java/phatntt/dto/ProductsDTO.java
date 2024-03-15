/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.dto;

import java.io.Serializable;
import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author Admin
 */
@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
public class ProductsDTO implements Serializable{
    
    private int productId;
    private int categoryId;
    private String categoryName;
    private String title;
    private String description;
    private int quantity;
    private int price;
    private String formattedPrice;
    private String thumbnail;
    private int discount;
    private int purchases;
    private Timestamp createdAt;   
    private int discountProduct;

    public int getDiscountProduct() {
        return (price - (price*discount/100));
    }

    public void setDiscountProduct(int discountProduct) {
        this.discountProduct = discountProduct;
    }
    
}

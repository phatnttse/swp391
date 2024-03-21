/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dto;

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
public class WishlistDTO {
    private int id;
    private int productId;
    private String userId;
    private String title;
    private int quantity;
    private int price;
    private String formattedPrice;
    private String thumbnail;
    private int discount;
    private int discountPice;
    private Timestamp created_at;
    
    public int getDiscountPrice() {
        return (price - (price*discount/100));
    }

    public void setDiscountPrice(int discountPice) {
        this.discountPice = discountPice;
    }
    
}

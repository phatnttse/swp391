/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dto;

import java.io.Serializable;
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
public class CartDTO implements Serializable{
    private int cartId;
    private String userId;
    private int productId;
    private String title;
    private String thumbnail;
    private int quantity;
    private int price;
   
}

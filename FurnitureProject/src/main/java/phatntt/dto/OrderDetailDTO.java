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
public class OrderDetailDTO {

    private int id;
    private String order_id;
    private int product_id;
    private String title;
    private int price;
    private int quantity;
    private String thumbnail;
    private int total_money;
    private String name;
    private Timestamp createAt;
    
}

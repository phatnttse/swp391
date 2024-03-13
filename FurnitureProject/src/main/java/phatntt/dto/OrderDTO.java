/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
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
public class OrderDTO implements Serializable{
    
    private String orderId;
    private String userId;
    private String email;
    private String name;
    private String phone;
    private String address;
    private String note;
    private int status;
    private String statusName;
    private boolean paymentStatus;
    private String paymentMethod;
    private int amount;
    private Timestamp createdAt;
    private String formattedPrice;

}

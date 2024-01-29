package com.swp391.eFurniture.models;

import jakarta.persistence.*;
import lombok.*;

import java.sql.Timestamp;

@Entity
@Table(name = "product")
@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id", nullable = false)
    private int productId;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    private String title;
    private int price;
    private int quantity;
    private double discount;
    private String thumbnail;
    private String description;
    private int purchases;
    private Timestamp createdAt;

}

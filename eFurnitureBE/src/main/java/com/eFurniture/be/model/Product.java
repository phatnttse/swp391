package com.eFurniture.be.model;

import com.eFurniture.be.response.BaseResponse;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "product")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private int id;

    @Column(nullable = false)
    private String title;

    @Column(nullable = false)
    private int price;

    @Column(nullable = false)
    private int quantity;

    private int discount;

    @Column(nullable = false)
    private String thumbnail;

    private String description;

    private int purchases;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;
}

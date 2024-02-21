/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.dto;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class ProductsDTO implements Serializable{
    private int productId;
    private int categoryId;
    private String title;
    private String description;
    private int quantity;
    private float price;
    private String thumbnail;
    private float discount;
    private int purchase;
    private Timestamp createdAt;
    
    private int productCount;

    public ProductsDTO() {
    }

    public ProductsDTO(int productId, int categoryId, String title, String description, int quantity, float price, String thumbnail, float discount, int purchase, Timestamp createdAt) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.title = title;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.thumbnail = thumbnail;
        this.discount = discount;
        this.purchase = purchase;
        this.createdAt = createdAt;
    }

    public ProductsDTO(int productId, int categoryId, String title, String description, int quantity, float price, String thumbnail, float discount, int purchase, Timestamp createdAt, int productCount) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.title = title;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.thumbnail = thumbnail;
        this.discount = discount;
        this.purchase = purchase;
        this.createdAt = createdAt;
        this.productCount = productCount;
    }
    
    

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public int getPurchase() {
        return purchase;
    }

    public void setPurchase(int purchase) {
        this.purchase = purchase;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    
}

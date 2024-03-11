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
    
    public ProductsDTO() {
    }

    public ProductsDTO(int productId, int categoryId, String title, String description, int quantity, int price, String thumbnail, int discount, int purchases, Timestamp createdAt) {
        this.productId = productId;
        this.categoryId = categoryId;
        this.title = title;
        this.description = description;
        this.quantity = quantity;
        this.price = price;
        this.thumbnail = thumbnail;
        this.discount = discount;
        this.purchases = purchases;
        this.createdAt = createdAt;
    }

    public ProductsDTO(String title, int quantity, int price, String thumbnail, int discount, int purchases, Timestamp createdAt) {
        this.title = title;
        this.quantity = quantity;
        this.price = price;
        this.thumbnail = thumbnail;
        this.discount = discount;
        this.purchases = purchases;
        this.createdAt = createdAt;
    }
    
    

    /**
     * @return the productId
     */
    public int getProductId() {
        return productId;
    }

    /**
     * @param productId the productId to set
     */
    public void setProductId(int productId) {
        this.productId = productId;
    }

    /**
     * @return the categoryId
     */
    public int getCategoryId() {
        return categoryId;
    }

    /**
     * @param categoryId the categoryId to set
     */
    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the price
     */
    public int getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(int price) {
        this.price = price;
    }

    /**
     * @return the formattedPrice
     */
    public String getFormattedPrice() {
        return formattedPrice;
    }

    /**
     * @param formattedPrice the formattedPrice to set
     */
    public void setFormattedPrice(String formattedPrice) {
        this.formattedPrice = formattedPrice;
    }

    /**
     * @return the thumbnail
     */
    public String getThumbnail() {
        return thumbnail;
    }

    /**
     * @param thumbnail the thumbnail to set
     */
    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    /**
     * @return the discount
     */
    public int getDiscount() {
        return discount;
    }

    /**
     * @param discount the discount to set
     */
    public void setDiscount(int discount) {
        this.discount = discount;
    }

    /**
     * @return the purchases
     */
    public int getPurchases() {
        return purchases;
    }

    /**
     * @param purchases the purchases to set
     */
    public void setPurchases(int purchases) {
        this.purchases = purchases;
    }

    /**
     * @return the createdAt
     */
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    /**
     * @param createdAt the createdAt to set
     */
    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

   

}

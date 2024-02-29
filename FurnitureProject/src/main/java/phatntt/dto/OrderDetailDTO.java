/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dto;

/**
 *
 * @author Admin
 */
public class OrderDetailDTO {
    private int id;
    private int order_id;
    private int product_id;
    private String title;
    private float price;
    private int quantity;
    private String thumbnail;
    private float total_money;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int id, int order_id, int product_id, String title, float price, int quantity, String thumbnail, float total_money) {
        this.id = id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
        this.thumbnail = thumbnail;
        this.total_money = total_money;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the order_id
     */
    public int getOrder_id() {
        return order_id;
    }

    /**
     * @param order_id the order_id to set
     */
    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    /**
     * @return the product_id
     */
    public int getProduct_id() {
        return product_id;
    }

    /**
     * @param product_id the product_id to set
     */
    public void setProduct_id(int product_id) {
        this.product_id = product_id;
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
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
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
     * @return the total_money
     */
    public float getTotal_money() {
        return total_money;
    }

    /**
     * @param total_money the total_money to set
     */
    public void setTotal_money(float total_money) {
        this.total_money = total_money;
    }
    
    
}

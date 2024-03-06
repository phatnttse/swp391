/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dto;

import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class OrderDetailDTO {

    private int id;
    private int order_id;
    private int product_id;
    private String title;
    private int price;
    private int quantity;
    private String thumbnail;
    private int total_money;
    private String name;
    private Timestamp createAt;

    public OrderDetailDTO(int id, int order_id, int product_id, String title, int price, int quantity, String thumbnail, int total_money, String name, Timestamp createAt) {
        this.id = id;
        this.order_id = order_id;
        this.product_id = product_id;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
        this.thumbnail = thumbnail;
        this.total_money = total_money;
        this.name = name;
        this.createAt = createAt;
    }

    public OrderDetailDTO() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getTotal_money() {
        return total_money;
    }

    public void setTotal_money(int total_money) {
        this.total_money = total_money;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }


    
}

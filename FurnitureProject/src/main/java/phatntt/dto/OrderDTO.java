/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dto;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 *
 * @author Admin
 */
public class OrderDTO {
    
    private int order_id;
    private String user_id;
    private String email;
    private String name;
    private String phone;
    private String address;
    private String note;
    private int status;
    private String status_name;
    private String payment_method;
    private Timestamp createdAt;
    private float priceOfOrder;
    private String formattedPrice;

    public OrderDTO() {
    }

    public OrderDTO(int order_id, String user_id, String email, String name, String phone, String address, String note, int status, String status_name, String payment_method, Timestamp createdAt, float priceOfOrder, String formattedPrice) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.status = status;
        this.status_name = status_name;
        this.payment_method = payment_method;
        this.createdAt = createdAt;
        this.priceOfOrder = priceOfOrder;
        this.formattedPrice = formattedPrice;
    }

    public OrderDTO(int order_id, String user_id, String email,String name ,String phone, String address, String note, String status_name, String payment_method, Timestamp createdAt, float priceOfOrder) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.status_name = status_name;
        this.payment_method = payment_method;
        this.createdAt = createdAt;
        this.priceOfOrder = priceOfOrder;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatus_name() {
        return status_name;
    }

    public void setStatus_name(String status_name) {
        this.status_name = status_name;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public float getPriceOfOrder() {
        return priceOfOrder;
    }

    public void setPriceOfOrder(float priceOfOrder) {
        this.priceOfOrder = priceOfOrder;
    }

    public String getFormattedPrice() {
        return formattedPrice;
    }

    public void setFormattedPrice(String formattedPrice) {
        this.formattedPrice = formattedPrice;
    }
    
    
}

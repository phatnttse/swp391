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
    
    private int orderId;
    private String userId;
    private String email;
    private String name;
    private String phone;
    private String address;
    private String note;
    private int status;
    private String statusName;
    private String paymentMethod;
    private Timestamp createdAt;
    private float priceOfOrder;
    private String formattedPrice;

    public OrderDTO() {
    }

    public OrderDTO(int orderId, String userId, String email, String name, String phone, String address, String note, int status, String statusName, String paymentMethod, Timestamp createdAt, float priceOfOrder, String formattedPrice) {
        this.orderId = orderId;
        this.userId = userId;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.status = status;
        this.statusName = statusName;
        this.paymentMethod = paymentMethod;
        this.createdAt = createdAt;
        this.priceOfOrder = priceOfOrder;
        this.formattedPrice = formattedPrice;
    }

    public OrderDTO(int order_id, String user_id, String email,String name ,String phone, String address, String note, String statusName, String paymentMethod, Timestamp createdAt, float priceOfOrder) {
        this.orderId = order_id;
        this.userId = user_id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.statusName = statusName;
        this.paymentMethod = paymentMethod;
        this.createdAt = createdAt;
        this.priceOfOrder = priceOfOrder;
    }


    /**
     * @return the orderId
     */
    public int getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the userId
     */
    public String getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(String userId) {
        this.userId = userId;
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

    /**
     * @return the statusName
     */
    public String getStatusName() {
        return statusName;
    }

    /**
     * @param statusName the statusName to set
     */
    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    /**
     * @return the paymentMethod
     */
    public String getPaymentMethod() {
        return paymentMethod;
    }

    /**
     * @param paymentMethod the paymentMethod to set
     */
    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
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

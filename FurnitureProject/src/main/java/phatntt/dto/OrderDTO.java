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
public class OrderDTO {
    
    private int order_id;
    private String user_id;
    private String email;
    private String name;
    private String phone;
    private String address;
    private String note;
    private int status;
    private String payment_method;
    private Timestamp createdAt;

    public OrderDTO() {
    }

    public OrderDTO(int order_id, String user_id, String email, String name, String phone, String address, String note, int status, String payment_method, Timestamp createdAt) {
        this.order_id = order_id;
        this.user_id = user_id;
        this.email = email;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.note = note;
        this.status = status;
        this.payment_method = payment_method;
        this.createdAt = createdAt;
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
     * @return the user_id
     */
    public String getUser_id() {
        return user_id;
    }

    /**
     * @param user_id the user_id to set
     */
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the note
     */
    public String getNote() {
        return note;
    }

    /**
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }

    /**
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the payment_method
     */
    public String getPayment_method() {
        return payment_method;
    }

    /**
     * @param payment_method the payment_method to set
     */
    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
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

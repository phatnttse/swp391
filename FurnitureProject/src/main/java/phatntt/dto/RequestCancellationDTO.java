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
public class RequestCancellationDTO {
    
    private int id;
    private String userId;
    private String orderId;
    private String reason;
    private boolean requestStatus;
    private Timestamp createdAt;

    public RequestCancellationDTO() {
    }

    public RequestCancellationDTO(int id, String userId, String orderId, String reason, boolean requestStatus, Timestamp createdAt) {
        this.id = id;
        this.userId = userId;
        this.orderId = orderId;
        this.reason = reason;
        this.requestStatus = requestStatus;
        this.createdAt = createdAt;
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

    /**
     * @return the orderId
     */
    public String getOrderId() {
        return orderId;
    }

    /**
     * @param orderId the orderId to set
     */
    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    /**
     * @return the reason
     */
    public String getReason() {
        return reason;
    }

    /**
     * @param reason the reason to set
     */
    public void setReason(String reason) {
        this.reason = reason;
    }

    /**
     * @return the requestStatus
     */
    public boolean isRequestStatus() {
        return requestStatus;
    }

    /**
     * @param requestStatus the requestStatus to set
     */
    public void setRequestStatus(boolean requestStatus) {
        this.requestStatus = requestStatus;
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

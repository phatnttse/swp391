/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.dto;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class EmailDTO implements Serializable {
    private String email;
    private String code;

    public EmailDTO() {
    }

    public EmailDTO(String email, String code) {
        this.email = email;
        this.code = code;
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
     * @return the code
     */
    public String getCode() {
        return code;
    }

    /**
     * @param code the code to set
     */
    public void setCode(String code) {
        this.code = code;
    }
    
    
}

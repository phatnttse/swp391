/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.dto;

/**
 *
 * @author Admin
 */
public class UsersCreateNewPassErr {
    
    private String passwordErr;
    private String confirmPassErr;

    public UsersCreateNewPassErr() {
    }

    public UsersCreateNewPassErr(String passwordErr, String confirmPassErr) {
        this.passwordErr = passwordErr;
        this.confirmPassErr = confirmPassErr;
    }

    public String getPasswordErr() {
        return passwordErr;
    }

    public void setPasswordErr(String passwordErr) {
        this.passwordErr = passwordErr;
    }

    public String getConfirmPassErr() {
        return confirmPassErr;
    }

    public void setConfirmPassErr(String confirmPassErr) {
        this.confirmPassErr = confirmPassErr;
    }
    
    
}

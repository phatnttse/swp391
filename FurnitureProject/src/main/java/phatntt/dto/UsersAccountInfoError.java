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
public class UsersAccountInfoError {
    
    private String fullnameLengthError;
    private String phoneLengthError;
    private String oldPassNotMatch;
    private String passwordLengthError;
    private String confirmNotMatch;

    public UsersAccountInfoError() {
    }

    public UsersAccountInfoError(String fullnameLengthError, String phoneLengthError, String oldPassNotMatch, String passwordLengthError, String confirmNotMatch) {
        this.fullnameLengthError = fullnameLengthError;
        this.phoneLengthError = phoneLengthError;
        this.oldPassNotMatch = oldPassNotMatch;
        this.passwordLengthError = passwordLengthError;
        this.confirmNotMatch = confirmNotMatch;
    }

    /**
     * @return the fullnameLengthError
     */
    public String getFullnameLengthError() {
        return fullnameLengthError;
    }

    /**
     * @param fullnameLengthError the fullnameLengthError to set
     */
    public void setFullnameLengthError(String fullnameLengthError) {
        this.fullnameLengthError = fullnameLengthError;
    }

    /**
     * @return the phoneLengthError
     */
    public String getPhoneLengthError() {
        return phoneLengthError;
    }

    /**
     * @param phoneLengthError the phoneLengthError to set
     */
    public void setPhoneLengthError(String phoneLengthError) {
        this.phoneLengthError = phoneLengthError;
    }

    /**
     * @return the oldPassNotMatch
     */
    public String getOldPassNotMatch() {
        return oldPassNotMatch;
    }

    /**
     * @param oldPassNotMatch the oldPassNotMatch to set
     */
    public void setOldPassNotMatch(String oldPassNotMatch) {
        this.oldPassNotMatch = oldPassNotMatch;
    }

    /**
     * @return the passwordLengthError
     */
    public String getPasswordLengthError() {
        return passwordLengthError;
    }

    /**
     * @param passwordLengthError the passwordLengthError to set
     */
    public void setPasswordLengthError(String passwordLengthError) {
        this.passwordLengthError = passwordLengthError;
    }

    /**
     * @return the confirmNotMatch
     */
    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    /**
     * @param confirmNotMatch the confirmNotMatch to set
     */
    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }
    
    
}

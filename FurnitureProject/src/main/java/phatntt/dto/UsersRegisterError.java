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
public class UsersRegisterError {
    
    private String emailDuplicateError;
    private String passwordLengthError;
    private String confirmNotMatch;
    private String fullnameLengthError;
    private String phoneLengthError;

    public UsersRegisterError() {
    }

    public UsersRegisterError(String emailDuplicateError, String passwordLengthError, String confirmNotMatch, String fullnameLengthError, String phoneLengthError) {
        this.emailDuplicateError = emailDuplicateError;
        this.passwordLengthError = passwordLengthError;
        this.confirmNotMatch = confirmNotMatch;
        this.fullnameLengthError = fullnameLengthError;
        this.phoneLengthError = phoneLengthError;
    }

    /**
     * @return the emailDuplicateError
     */
    public String getEmailDuplicateError() {
        return emailDuplicateError;
    }

    /**
     * @param emailDuplicateError the emailDuplicateError to set
     */
    public void setEmailDuplicateError(String emailDuplicateError) {
        this.emailDuplicateError = emailDuplicateError;
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
    
}

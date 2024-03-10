/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dto;

/**
 *
 * @author Admin
 */
public class ErrorDTO {
    
    private String givenNameLengthError;
    private String familyNameLengthError;
    private String phoneRegexError;
    private String passwordRegexError;
    private String confirmNotMatch;
    private String oldPassNotMatch;
    private String oldPassIncorrect;

    public ErrorDTO() {
    }

    /**
     * @return the givenNameLengthError
     */
    public String getGivenNameLengthError() {
        return givenNameLengthError;
    }

    /**
     * @param givenNameLengthError the givenNameLengthError to set
     */
    public void setGivenNameLengthError(String givenNameLengthError) {
        this.givenNameLengthError = givenNameLengthError;
    }

    /**
     * @return the familyNameLengthError
     */
    public String getFamilyNameLengthError() {
        return familyNameLengthError;
    }

    /**
     * @param familyNameLengthError the familyNameLengthError to set
     */
    public void setFamilyNameLengthError(String familyNameLengthError) {
        this.familyNameLengthError = familyNameLengthError;
    }

    /**
     * @return the phoneRegexError
     */
    public String getPhoneRegexError() {
        return phoneRegexError;
    }

    /**
     * @param phoneRegexError the phoneRegexError to set
     */
    public void setPhoneRegexError(String phoneRegexError) {
        this.phoneRegexError = phoneRegexError;
    }

    /**
     * @return the passwordRegexError
     */
    public String getPasswordRegexError() {
        return passwordRegexError;
    }

    /**
     * @param passwordRegexError the passwordRegexError to set
     */
    public void setPasswordRegexError(String passwordRegexError) {
        this.passwordRegexError = passwordRegexError;
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
     * @return the oldPassIncorrect
     */
    public String getOldPassIncorrect() {
        return oldPassIncorrect;
    }

    /**
     * @param oldPassIncorrect the oldPassIncorrect to set
     */
    public void setOldPassIncorrect(String oldPassIncorrect) {
        this.oldPassIncorrect = oldPassIncorrect;
    }
    
    
    
}

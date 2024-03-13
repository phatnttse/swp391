/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author Admin
 */
@Data 
@NoArgsConstructor 
@AllArgsConstructor 
@Builder
public class ErrorDTO {
    
    private String givenNameLengthError;
    private String familyNameLengthError;
    private String phoneRegexError;
    private String passwordRegexError;
    private String confirmNotMatch;
    private String oldPassNotMatch;
    private String oldPassIncorrect;

}

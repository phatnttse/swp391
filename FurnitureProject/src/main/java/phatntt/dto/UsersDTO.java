/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatntt.dto;

import java.sql.Timestamp;
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
public class UsersDTO {

    private String id;
    private String email;
    private String password;
    private String name;
    private String givenName;
    private String familyName;
    private String picture;
    private String phone;
    private String address;
    private String googleId;
    private int role;
    private Timestamp createdAt;
    private String roleName;
    private boolean delete;

}

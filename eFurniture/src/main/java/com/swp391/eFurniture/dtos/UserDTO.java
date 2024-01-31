package com.swp391.eFurniture.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.swp391.eFurniture.models.Role;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

import java.sql.Timestamp;
import java.util.Date;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDTO {

    private String userId;
    private String email;
    private String username;
    private String password;
    private String name;
    private String phone;
    private String picture;
    private String address;
    private Date dateOfBirth;
    private int roleId;
    private Timestamp createdAt;

}

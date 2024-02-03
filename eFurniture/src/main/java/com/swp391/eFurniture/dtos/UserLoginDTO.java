package com.swp391.eFurniture.dtos;

import lombok.*;

@Data
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserLoginDTO {
    private String username;
    private String password;
    private int roleId;
}

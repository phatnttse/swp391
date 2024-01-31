package com.swp391.eFurniture.services;

import com.swp391.eFurniture.dtos.UserDTO;
import com.swp391.eFurniture.models.Role;
import com.swp391.eFurniture.models.User;

public interface IUserService {
    User register(String username, String password,String name, String email) throws Exception;
    String login(String username, String password) throws Exception;
}

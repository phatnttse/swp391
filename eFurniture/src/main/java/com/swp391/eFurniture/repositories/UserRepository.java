package com.swp391.eFurniture.repositories;

import com.swp391.eFurniture.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, String> {
}

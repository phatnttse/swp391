package com.swp391.eFurniture.services;

import com.swp391.eFurniture.components.JwtTokenUtil;
import com.swp391.eFurniture.dtos.UserDTO;
import com.swp391.eFurniture.exceptions.DataNotFoundException;
import com.swp391.eFurniture.models.Role;
import com.swp391.eFurniture.models.User;
import com.swp391.eFurniture.repositories.RoleRepository;
import com.swp391.eFurniture.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class UserService implements IUserService{
    @Autowired
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenUtil jwtTokenUtil;
    private final AuthenticationManager authenticationManager;
    @Override
    public User register(String name, String username, String password, String email) throws Exception {
        if (userRepository.existsByUsername(username)){
            throw new DataIntegrityViolationException("Username already exists");
        }
        String userId = UUID.randomUUID().toString();
        User newUser = User.builder()
                .userId(userId)
                .username(username)
                .email(email)
                .password(password)
                .name(name)
                .createdAt(new Date())
                .build();
        String encodedPassword = passwordEncoder.encode(password);
        newUser.setPassword(encodedPassword);
        return userRepository.save(newUser);
    }

    @Override
    public String login(String username, String password) throws Exception {
        Optional<User> optionalUser = userRepository.findByUsername(username);
        if(optionalUser.isEmpty()) {
            throw new DataNotFoundException("Incorrect username or password");
        }
        //return optionalUser.get();//muốn trả JWT token ?
        User existingUser = optionalUser.get();
        //check password
        if(!passwordEncoder.matches(password, existingUser.getPassword())) {
            throw new BadCredentialsException("Incorrect username or password");
        }
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(
                username, password,
                existingUser.getAuthorities()
        );
        //authenticate with Java Spring security
        authenticationManager.authenticate(authenticationToken);
        return jwtTokenUtil.generateToken(existingUser);
    }

}

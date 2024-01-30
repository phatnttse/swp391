//package com.swp391.eFurniture.models;
//
//import jakarta.persistence.*;
//import lombok.*;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.Date;
//import java.util.List;
//
//@Entity
//@Table(name = "user")
//@Getter
//@Setter
//@Data
//@AllArgsConstructor
//@NoArgsConstructor
//public class User implements UserDetails {
//    @Id
//    @Column(name = "user_id", nullable = false)
//    private String userId;
//
//    @Column(nullable = false)
//    private String email;
//
//    @Column(nullable = false)
//    private String username;
//
//    @Column(nullable = false)
//    private String password;
//
//    @Column(nullable = false)
//    private String name;
//
//    @Column(nullable = false)
//    private String phone;
//
//    private String picture;
//
//    private String address;
//
//    @Temporal(TemporalType.DATE)
//    @Column(name = "date_of_birth")
//    private Date dateOfBirth;
//
//    @ManyToOne
//    @JoinColumn(name = "role_id", nullable = false)
//    private Role role;
//
//    @Temporal(TemporalType.TIMESTAMP)
//    @Column(name = "created_at")
//    private Date createdAt;
//
//
//    @Override
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();
//        authorityList.add(new SimpleGrantedAuthority("ROLE_"+ getRole().getName()));
//        return authorityList;
//    }
//
//    @Override
//    public boolean isAccountNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isAccountNonLocked() {
//        return true;
//    }
//
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return true;
//    }
//
//    @Override
//    public boolean isEnabled() {
//        return true;
//    }
//}

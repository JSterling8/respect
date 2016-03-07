package com.jms.respect.config.security;

import com.jms.respect.dao.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class RespectUserDetails implements UserDetails {
    private User user;
    private List<GrantedAuthority> authorities = new ArrayList<>(1);

    public RespectUserDetails(User user) {
        this.user = user;

        if (user.getType().equalsIgnoreCase("ADMIN")) {
            AdminAuthority adminAuthority = new AdminAuthority();
            authorities.add(adminAuthority);
        } else {
            UserAuthority userAuthority = new UserAuthority();
            authorities.add(userAuthority);
        }
    }

    public User getUser(){
        return user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
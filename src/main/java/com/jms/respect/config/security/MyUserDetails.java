package com.jms.respect.config.security;

import com.jms.respect.dao.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class MyUserDetails implements UserDetails {
    private User user;
    private List<GrantedAuthority> authorities = new ArrayList<>(1);

    public MyUserDetails(User user) {
        this.user = user;

        if (user.getType().equalsIgnoreCase("ADMIN")) {
            MyGrantedAdminAuthority adminAuthority = new MyGrantedAdminAuthority();
            authorities.add(adminAuthority);
        }
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
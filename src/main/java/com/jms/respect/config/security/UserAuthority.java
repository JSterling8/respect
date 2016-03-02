package com.jms.respect.config.security;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by anon on 02/03/2016.
 */
public class UserAuthority implements GrantedAuthority {
    @Override
    public String getAuthority() {
        return "ROLE_USER";
    }
}

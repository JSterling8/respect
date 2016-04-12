package com.jms.respect.config.security;

import org.springframework.security.core.GrantedAuthority;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 02/03/2016.
 */
public class AdminAuthority implements GrantedAuthority {
    @Override
    public String getAuthority() {
        return "ROLE_ADMIN";
    }
}

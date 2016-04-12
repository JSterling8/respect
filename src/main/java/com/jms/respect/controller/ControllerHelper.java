package com.jms.respect.controller;

import com.jms.respect.config.security.RespectUserDetails;
import com.jms.respect.dao.User;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 12/03/2016.
 */
@Controller
public class ControllerHelper {
    public boolean isAdmin() {
        RespectUserDetails userDetails = (RespectUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        for(GrantedAuthority authority : userDetails.getAuthorities()) {
            if(authority.getAuthority().equalsIgnoreCase("ROLE_ADMIN")) {
                return true;
            }
        }

        return false;
    }

    public User getUser() {
        RespectUserDetails respectUserDetails = (RespectUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return respectUserDetails.getUser();
    }
}

package com.jms.respect.controller;

import com.jms.respect.config.security.RespectUserDetails;
import com.jms.respect.dao.User;
import com.jms.respect.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by anon on 09/03/2016.
 */
@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
public class AdminController {
    private final AccountService accountService;

    @Autowired
    public AdminController(AccountService accountService) {
        this.accountService = accountService;
    }

    @RequestMapping(value = "/respect/admin/users", method = RequestMethod.GET)
    public ModelAndView getAdminPage() {
        ModelAndView modelAndView = new ModelAndView("admin-users");
        List<User> users = accountService.getAllUsers();
        modelAndView.addObject("users", users);

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/{id}", method = RequestMethod.GET)
    public ModelAndView getUserPage(@PathVariable("id") Integer userId) {
        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);

        modelAndView.addObject("user", user);

        return modelAndView;
    }

    public boolean isAdmin() {
        RespectUserDetails userDetails = (RespectUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        for(GrantedAuthority authority : userDetails.getAuthorities()) {
            if(authority.getAuthority().equalsIgnoreCase("ROLE_ADMIN")) {
                return true;
            }
        }

        return false;
    }
}

package com.jms.respect.controller;

import com.jms.respect.config.security.RespectUserDetails;
import com.jms.respect.dao.User;
import com.jms.respect.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
public class AdminAccountController {
    private final AccountService accountService;

    @Autowired
    public AdminAccountController(AccountService accountService) {
        this.accountService = accountService;
    }

    @RequestMapping(value = "/respect/admin/users", method = RequestMethod.GET)
    public ModelAndView getUsersPage() {
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

    @RequestMapping(value = "/respect/admin/user/approve/{id}", method = RequestMethod.GET)
    public ModelAndView approve(@PathVariable("id") Integer userId) {
        accountService.approve(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/disapprove/{id}", method = RequestMethod.GET)
    public ModelAndView disapprove(@PathVariable("id") Integer userId) {
        accountService.disapprove(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/validate/{id}", method = RequestMethod.GET)
    public ModelAndView validate(@PathVariable("id") Integer userId) {
        accountService.validate(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/invalidate/{id}", method = RequestMethod.GET)
    public ModelAndView invalidate(@PathVariable("id") Integer userId) {
        accountService.invalidate(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/make-admin/{userId}", method = RequestMethod.GET)
    public ModelAndView makeAdmin(@PathVariable("userId") Integer userId) {
        accountService.makeAdmin(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/delete/{id}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") Integer userId) {
        RespectUserDetails currentUserDetails = (RespectUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = currentUserDetails.getUser();

        if(currentUser.getId() == userId) {
            return new ModelAndView("forbidden");
        }

        accountService.delete(userId);

        return getUsersPage();
    }
}

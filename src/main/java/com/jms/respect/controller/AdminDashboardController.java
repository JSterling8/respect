package com.jms.respect.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by anon on 03/03/2016.
 */
@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
public class AdminDashboardController {
    @RequestMapping(value = "/respect/admin/dashboard", method = RequestMethod.GET)
    public ModelAndView getRegistrationPage() {
        return new ModelAndView("admin-dashboard");
    }
}
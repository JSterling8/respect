package com.jms.respect.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by anon on 03/03/2016.
 */
@Controller
public class DashboardController {
    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView getRegistrationPage() {
        return new ModelAndView("dashboard");
    }
}
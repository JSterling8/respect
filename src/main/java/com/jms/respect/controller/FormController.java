package com.jms.respect.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by anon on 25/02/2016.
 */
@Controller
public class FormController {
    @RequestMapping("/form")
    public String index() {
        //TODO If logged in, redirect to panel

        //TODO If not logged in, present with login/register screen
        return "respect-form";
    }
}

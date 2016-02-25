package com.jms.respect.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SplashController {
    @RequestMapping("/")
    public String index() {
        //TODO If logged in, redirect to panel

        //TODO If not logged in, present with login/register screen
        return "splash";
    }
}
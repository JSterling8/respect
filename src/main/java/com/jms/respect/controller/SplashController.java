package com.jms.respect.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SplashController {

    @RequestMapping("/")
    public String index() {
        return "splash";
    }

}
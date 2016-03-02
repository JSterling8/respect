package com.jms.respect.controller;

import com.jms.respect.config.security.RespectUserDetailsService;
import com.jms.respect.dao.User;
import com.jms.respect.dto.AccountCreationDto;
import com.jms.respect.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.security.InvalidParameterException;

/**
 * Created by anon on 25/02/2016.
 */
@Controller
public class LoginController {
    private final AccountService accountService;
    private final AuthenticationManager authenticationManager;
    private final RespectUserDetailsService userDetailsService;

    @Autowired
    public LoginController(AccountService accountService,
                           AuthenticationManager authenticationManager,
                           RespectUserDetailsService userDetailsService) {
        this.accountService = accountService;
        this.authenticationManager = authenticationManager;
        this.userDetailsService = userDetailsService;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLoginPage() {
        return "login";
    }

    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }

        return "redirect:/login?logout";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String getRegistrationPage() {
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid AccountCreationDto accountCreationDto, HttpServletRequest request) throws ServletException {
        //TODO Tell user why it failed if it does...
        String password = accountCreationDto.getPassword();

        User user = null;
        try {
            user = accountService.register(accountCreationDto);
        } catch (InvalidParameterException e) {
            return "redirect:/register?error";
        }

        if (user != null) {
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user.getEmail(), password);
            token = (UsernamePasswordAuthenticationToken) authenticationManager.authenticate(token);

            if(token.isAuthenticated()) {
                SecurityContextHolder.getContext().setAuthentication(token);

                return "redirect:/form";
            }
        }

        return "redirect:/register?error";
    }
}

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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView getRegistrationPage() {
        ModelAndView modelAndView = new ModelAndView("register");
        modelAndView.addObject("accountCreationDto", new AccountCreationDto());
        return modelAndView;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@ModelAttribute("registrationForm") @Valid AccountCreationDto accountCreationDto,
                                 BindingResult result) throws ServletException {
        if(result.hasErrors()) {
            ModelAndView modelAndView = new ModelAndView("/register");
            modelAndView.addObject(accountCreationDto);
            return modelAndView;
        }
        String password = accountCreationDto.getPassword();

        User user;
        try {
            user = accountService.register(accountCreationDto);
        } catch (InvalidParameterException e) {
            //TODO Tell user why it failed if it does...

            ModelAndView modelAndView = new ModelAndView("/register");
            modelAndView.addObject(accountCreationDto);
            return modelAndView;
        }

        if (user != null) {
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user.getEmail(), password);
            token = (UsernamePasswordAuthenticationToken) authenticationManager.authenticate(token);

            if(token.isAuthenticated()) {
                SecurityContextHolder.getContext().setAuthentication(token);

                return new ModelAndView("redirect:/form");
            }
        }

        ModelAndView modelAndView = new ModelAndView("/register");
        modelAndView.addObject(accountCreationDto);
        return modelAndView;
    }
}

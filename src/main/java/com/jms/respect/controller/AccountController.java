package com.jms.respect.controller;

import com.jms.respect.config.security.RespectUserDetailsService;
import com.jms.respect.dao.User;
import com.jms.respect.dto.AccountCreationDto;
import com.jms.respect.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
public class AccountController {
    private final AccountService accountService;
    private final AuthenticationManager authenticationManager;
    private final RespectUserDetailsService userDetailsService;

    @Autowired
    public AccountController(AccountService accountService,
                             AuthenticationManager authenticationManager,
                             RespectUserDetailsService userDetailsService) {
        this.accountService = accountService;
        this.authenticationManager = authenticationManager;
        this.userDetailsService = userDetailsService;
    }

    @RequestMapping(value = {"/", "/login", "/index"}, method = RequestMethod.GET)
    public ModelAndView getLoginPage() {
        if(isLoggedIn()) {
            return new ModelAndView("redirect:/form");
        } else {
            return new ModelAndView("login");
        }
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
        if(!isLoggedIn()) {
            ModelAndView modelAndView = new ModelAndView("register");
            modelAndView.addObject("accountCreationDto", new AccountCreationDto());

            return modelAndView;
        } else {
            return new ModelAndView("redirect:/form");
        }
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@ModelAttribute("accountCreationDto") @Valid AccountCreationDto accountCreationDto,
                                 BindingResult result) throws ServletException {
        if(!isLoggedIn()) {
            if (result.hasErrors()) {
                ModelAndView modelAndView = new ModelAndView("/register");
                modelAndView.addObject(accountCreationDto);
                return modelAndView;
            }

            User user;
            try {
                user = accountService.register(accountCreationDto);
            } catch (InvalidParameterException e) {
                ObjectError error = new ObjectError("accountCreationDto", e.getMessage());
                result.addError(error);

                ModelAndView modelAndView = new ModelAndView("/register");
                modelAndView.addObject(accountCreationDto);
                return modelAndView;
            }

            if (user != null) {
                UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(accountCreationDto.getEmail(), accountCreationDto.getPassword());
                token = (UsernamePasswordAuthenticationToken) authenticationManager.authenticate(token);

                if (token.isAuthenticated()) {
                    SecurityContextHolder.getContext().setAuthentication(token);

                    return new ModelAndView("redirect:/form");
                }
            }

            ModelAndView modelAndView = new ModelAndView("register");
            modelAndView.addObject(accountCreationDto);
            return modelAndView;
        } else {
            return new ModelAndView("redirect:/form");
        }
    }

    @RequestMapping(value = "/validate/{validationCode}", method = RequestMethod.GET)
    public ModelAndView validate(@PathVariable("validationCode") String validationCode) {
        try {
            accountService.validate(validationCode);
        } catch (InvalidParameterException e) {
            return new ModelAndView("validation-error");
        }

        return new ModelAndView("validated");
    }

    private boolean isLoggedIn() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        return authentication != null && !(authentication instanceof AnonymousAuthenticationToken) && authentication.isAuthenticated();
    }
}

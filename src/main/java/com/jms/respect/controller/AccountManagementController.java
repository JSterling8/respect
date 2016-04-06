package com.jms.respect.controller;

import com.jms.respect.config.security.RespectUserDetails;
import com.jms.respect.dao.Referee;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.User;
import com.jms.respect.service.AccountService;
import com.jms.respect.service.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by anon on 06/04/2016.
 */
@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
@Controller
public class AccountManagementController {
    private AccountService accountService;
    private FormService formService;
    private ControllerHelper controllerHelper;

    @Autowired
    public AccountManagementController(AccountService accountService, FormService formService, ControllerHelper controllerHelper) {
        this.accountService = accountService;
        this.formService = formService;
        this.controllerHelper = controllerHelper;
    }

    @RequestMapping(value = "/my-reports", method = RequestMethod.GET)
    public ModelAndView getReportsForUser() {
        ModelAndView modelAndView = new ModelAndView("user-reports");
        RespectUserDetails respectUserDetails = (RespectUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = respectUserDetails.getUser();

        if(user == null) {
            return new ModelAndView("error");
        }

        Referee referee = user.getRefereeId();

        List<Report> reports = formService.getAllReportsByReferee(referee);
        modelAndView.addObject("reports", reports);
        modelAndView.addObject("user", user);
        modelAndView.addObject("admin", controllerHelper.isAdmin());

        return modelAndView;
    }
}

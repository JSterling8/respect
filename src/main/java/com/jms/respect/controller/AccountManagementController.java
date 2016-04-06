package com.jms.respect.controller;

import com.jms.respect.dao.Referee;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.User;
import com.jms.respect.service.AccountService;
import com.jms.respect.service.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
        User user = controllerHelper.getUser();

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

    @RequestMapping(value = {"/my-account", "/account", "/user-account"}, method = RequestMethod.GET)
    public ModelAndView getMyAccountPage() {
        ModelAndView mav = new ModelAndView("user-account");
        mav.addObject("admin", controllerHelper.isAdmin());

        User user = controllerHelper.getUser();
        // Overriding validation code so user can't grab it from the object in javascript and validate a fake email
        user.setValidationCode("REDACTED");
        mav.addObject("user", user);

        return mav;
    }
}

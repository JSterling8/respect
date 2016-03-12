package com.jms.respect.controller;

import com.jms.respect.dao.Referee;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.User;
import com.jms.respect.service.AccountService;
import com.jms.respect.service.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by anon on 11/03/2016.
 */
@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
public class AdminReportController {
    private final FormService formService;
    private final AccountService accountService;

    @Autowired
    public AdminReportController(FormService formService, AccountService accountService) {
        this.formService = formService;
        this.accountService = accountService;
    }

    @RequestMapping(value = "/respect/admin/reports/user/{id}", method = RequestMethod.GET)
    public ModelAndView getReportsForUser(@PathVariable("id") Integer userId) {
        ModelAndView modelAndView = new ModelAndView("admin-reports");
        User user = accountService.getUserById(userId);
        if(user == null) {
            return new ModelAndView("error");
        }

        Referee referee = user.getRefereeId();

        List<Report> reports = formService.getAllReportsByReferee(referee);
        modelAndView.addObject("reports", reports);
        modelAndView.addObject("user", user);

        return modelAndView;
    }
}

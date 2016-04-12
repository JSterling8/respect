package com.jms.respect.controller;

import com.jms.respect.service.AccountService;
import com.jms.respect.service.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 11/03/2016.
 */
@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
public class AdminReportController {
    private final FormService formService;
    private final AccountService accountService;
    private final ControllerHelper controllerHelper;

    @Autowired
    public AdminReportController(FormService formService,
                                 AccountService accountService,
                                 ControllerHelper controllerHelper) {
        this.formService = formService;
        this.accountService = accountService;
        this.controllerHelper = controllerHelper;
    }

    @RequestMapping(value = "/respect/admin/reports/delete-all", method = RequestMethod.GET)
    public ModelAndView deleteAll() {
        formService.deleteAllReportsTeamsAndCompetitions();

        return new ModelAndView("success");
    }
}

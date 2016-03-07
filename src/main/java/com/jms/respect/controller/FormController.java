package com.jms.respect.controller;

import com.jms.respect.config.security.AdminAuthority;
import com.jms.respect.config.security.RespectUserDetails;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.User;
import com.jms.respect.dto.CompletedForm;
import com.jms.respect.dto.IncompleteForm;
import com.jms.respect.repository.ReportRepository;
import com.jms.respect.service.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by anon on 25/02/2016.
 */
@Controller
public class FormController {
    private final ReportRepository reportRepository;
    private final FormService formService;

    @Autowired
    public FormController(ReportRepository reportRepository,
                          FormService formService) {
        this.reportRepository = reportRepository;
        this.formService = formService;
    }

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public ModelAndView getForm(IncompleteForm incompleteForm) {
        ModelAndView modelAndView = new ModelAndView("respect-form");
        RespectUserDetails respectUserDetails = (RespectUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = respectUserDetails.getUser();
        incompleteForm.setReferee(user.getRefereeId().getFirstName() + " " + user.getRefereeId().getLastName());
        modelAndView.addObject("form", incompleteForm);
        modelAndView.addObject("admin", isAdmin());
        return modelAndView;
    }

    @RequestMapping(value = "/confirm", method = RequestMethod.POST)
    public ModelAndView confirmForm(CompletedForm completedForm) {
        ModelAndView modelAndView = new ModelAndView("confirm");

        modelAndView.addObject("form", completedForm);

        return modelAndView;
    }

    @RequestMapping(value = "/submit", method = RequestMethod.POST)
    public ModelAndView submitForm(CompletedForm completedForm) {
        formService.submitForm(completedForm);

        ModelAndView modelAndView = new ModelAndView("redirect:success");
        modelAndView.addObject("form", completedForm);

        return modelAndView;
    }

    @RequestMapping("/all-reports")
    @ResponseBody
    public Iterable<Report> getAllReports() {
        return reportRepository.findAll();
    }

    @RequestMapping("/reports/home/{team}")
    @ResponseBody
    public Iterable<Report> getByHomeTeam(@PathVariable String team) {
        return reportRepository.findByHomeTeamIdName(team);
    }

    @RequestMapping("/reports/away/{team}")
    @ResponseBody
    public Iterable<Report> getByAwayTeam(@PathVariable String team) {
        return reportRepository.findByAwayTeamIdName(team);
    }

    public boolean isAdmin() {
        RespectUserDetails userDetails = (RespectUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (userDetails.getAuthorities().contains(new AdminAuthority())) {
            return true;
        } else {
            return false;
        }
    }
}

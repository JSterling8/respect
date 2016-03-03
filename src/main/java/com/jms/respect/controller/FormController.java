package com.jms.respect.controller;

import com.jms.respect.config.security.AdminAuthority;
import com.jms.respect.config.security.RespectUserDetails;
import com.jms.respect.dao.League;
import com.jms.respect.dao.Report;
import com.jms.respect.dto.Form;
import com.jms.respect.repository.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by anon on 25/02/2016.
 */
@Controller
public class FormController {
    private final ReportRepository reportRepository;
    private boolean SecurityContext;

    @Autowired
    public FormController(ReportRepository reportRepository) {
        this.reportRepository = reportRepository;
    }

    @RequestMapping("/form")
    public ModelAndView getForm() {
        ModelAndView modelAndView = new ModelAndView("respect-form");
        modelAndView.addObject("admin", isAdmin());
        return modelAndView;
    }

    @RequestMapping("/confirm")
    public ModelAndView confirmForm() {
        ModelAndView modelAndView = new ModelAndView("confirm");
        modelAndView.addObject("admin", isAdmin());
        League league = new League();
        league.setName("Test League");
        Form form = new Form();
        form.setLeague(league);
        modelAndView.addObject("form", form);

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

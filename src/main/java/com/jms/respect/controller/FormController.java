package com.jms.respect.controller;

import com.jms.respect.dao.Report;
import com.jms.respect.repository.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by anon on 25/02/2016.
 */
@Controller
public class FormController {
    private final ReportRepository reportRepository;

    @Autowired
    public FormController(ReportRepository reportRepository) {
        this.reportRepository = reportRepository;
    }

    @RequestMapping("/form")
    public String index() {
        //TODO If logged in, redirect to panel

        //TODO If not logged in, present with login/register screen
        return "respect-form";
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
}

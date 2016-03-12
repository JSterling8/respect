package com.jms.respect.controller;

import com.jms.respect.dto.IncompleteForm;
import com.jms.respect.service.HistoricalImporterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by anon on 12/03/2016.
 */
@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
public class HistoricalImporterController {
    private final HistoricalImporterService historicalImporterService;
    private final FormController formController;

    @Autowired
    public HistoricalImporterController(HistoricalImporterService historicalImporterService, FormController formController) {
        this.historicalImporterService = historicalImporterService;
        this.formController = formController;
    }

    @RequestMapping(value = "/import/", method = RequestMethod.GET)
    public ModelAndView load() {
        historicalImporterService.readFile();

        return formController.getForm(new IncompleteForm());
    }
}

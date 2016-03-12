package com.jms.respect.controller;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.League;
import com.jms.respect.dto.OverallScoresDto;
import com.jms.respect.service.CompetitionService;
import com.jms.respect.service.StatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.TreeMap;

/**
 * Created by anon on 12/03/2016.
 */
@Controller
public class StatsController {
    private final StatsService statsService;
    private final CompetitionService competitionService;

    @Autowired
    public StatsController(StatsService statsService, CompetitionService competitionService) {
        this.statsService = statsService;
        this.competitionService = competitionService;
    }

    @RequestMapping(value = "/stats/competitions", method = RequestMethod.GET)
    public ModelAndView getCompetitions() {
        ModelAndView modelAndView = new ModelAndView("stats-competitions");
        TreeMap<League, List<Competition>> leagueMap = competitionService.getCompetitionsByLeague();
        modelAndView.addObject("leagueMap", leagueMap);

        return modelAndView;
    }

    @RequestMapping(value = "/stats/competition/{id}", method = RequestMethod.GET)
    public ModelAndView getStatsForCompetitionId(@PathVariable("id") Integer id) {
        OverallScoresDto overallScoresDto = statsService.getOverallScoresForCompetitionId(id);
        ModelAndView modelAndView = new ModelAndView("overall-stats");
        modelAndView.addObject("overallScores", overallScoresDto);
        return modelAndView;
    }

    @RequestMapping(value = "/stats/league/{id}", method = RequestMethod.GET)
    public ModelAndView getStatsForLeagueId(@PathVariable("id") Integer id) {
        OverallScoresDto overallScoresDto = statsService.getOverallScoresForLeagueId(id);
        ModelAndView modelAndView = new ModelAndView("overall-stats");
        modelAndView.addObject("overallScores", overallScoresDto);
        return modelAndView;
    }
}

package com.jms.respect.controller;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.League;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.Team;
import com.jms.respect.dto.OverallScoresDto;
import com.jms.respect.service.CompetitionService;
import com.jms.respect.service.StatsService;
import com.jms.respect.service.TeamService;
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
    private final TeamService teamService;
    private final ControllerHelper controllerHelper;

    @Autowired
    public StatsController(StatsService statsService,
                           CompetitionService competitionService,
                           TeamService teamService,
                           ControllerHelper controllerHelper) {
        this.statsService = statsService;
        this.competitionService = competitionService;
        this.teamService = teamService;
        this.controllerHelper = controllerHelper;
    }

    @RequestMapping(value = "/stats", method = RequestMethod.GET)
    public ModelAndView getMainStatsPage() {
        return getCompetitions();
    }

    @RequestMapping(value = "/stats/competitions", method = RequestMethod.GET)
    public ModelAndView getCompetitions() {
        ModelAndView modelAndView = new ModelAndView("stats-competitions");
        TreeMap<League, List<Competition>> leagueMap = competitionService.getCompetitionsByLeague();
        modelAndView.addObject("leagueMap", leagueMap);
        modelAndView.addObject("admin", controllerHelper.isAdmin());

        return modelAndView;
    }

    @RequestMapping(value = "/stats/competition/{id}", method = RequestMethod.GET)
    public ModelAndView getOverallStatsForCompetitionId(@PathVariable("id") Integer id) {
        OverallScoresDto overallScoresDto = statsService.getOverallScoresForCompetitionId(id);
        ModelAndView modelAndView = new ModelAndView("overall-stats");
        modelAndView.addObject("overallScores", overallScoresDto);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        return modelAndView;
    }

    @RequestMapping(value = "/stats/league/{id}", method = RequestMethod.GET)
    public ModelAndView getOverallStatsForLeagueId(@PathVariable("id") Integer id) {
        OverallScoresDto overallScoresDto = statsService.getOverallScoresForLeagueId(id);
        ModelAndView modelAndView = new ModelAndView("overall-stats");
        modelAndView.addObject("overallScores", overallScoresDto);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        return modelAndView;
    }

    @RequestMapping(value = "/stats/team/{id}", method = RequestMethod.GET)
    public ModelAndView getStatsForTeamId(@PathVariable("id") Integer id) {
        Team team = teamService.getTeamById(id);
        List<Report> reports = statsService.getReportsForTeam(team);
        Double averageOverallScore = statsService.calculateAverageScoreForTeam(reports, team.getName());

        ModelAndView modelAndView = new ModelAndView("stats-team");
        modelAndView.addObject("reports", reports);
        modelAndView.addObject("team", team);
        modelAndView.addObject("averageOverallScore", averageOverallScore);
        modelAndView.addObject("admin", controllerHelper.isAdmin());

        return modelAndView;
    }
}

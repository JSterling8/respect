package com.jms.respect.controller;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.League;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.Team;
import com.jms.respect.dto.StatsTableDataDto;
import com.jms.respect.service.CompetitionService;
import com.jms.respect.service.StatsService;
import com.jms.respect.service.TeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.List;
import java.util.TreeMap;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 12/03/2016.
 */
@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
public class StatsController {
    private static final long DEFAULT_START_DATE = 1433548800000l;
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
    public ModelAndView getStatsForCompetitionId(@PathVariable("id") Integer id,
                                                 @RequestParam(value = "statName",
                                                         defaultValue = "overall",
                                                         required = false)
                                                    String statName,
                                                    @RequestParam(value = "startDate",
                                                            required = false)
                                                     Date startDate,
                                                    @RequestParam(value = "endDate",
                                                            required = false)
                                                     Date endDate){
        if(startDate == null) {
            startDate = new Date(DEFAULT_START_DATE);
        }
        if(endDate == null) {
            endDate = new Date(System.currentTimeMillis());
        }

        StatsTableDataDto statsTableDataDto = statsService.getStatsForCompetitionId(id, statName, startDate, endDate);
        ModelAndView modelAndView = new ModelAndView("stats-table");
        modelAndView.addObject("tableData", statsTableDataDto);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("startDate", startDate);
        modelAndView.addObject("endDate", endDate);
        return modelAndView;
    }

    @RequestMapping(value = "/stats/league/{id}", method = RequestMethod.GET)
    public ModelAndView getStatsForLeagueId(@PathVariable("id") Integer id,
                                            @RequestParam(value = "statName",
                                                    defaultValue = "overall",
                                                    required = false)
                                                        String statName,
                                            @RequestParam(value = "startDate",
                                                    required = false)
                                                Date startDate,
                                            @RequestParam(value = "endDate",
                                                    required = false)
                                                Date endDate) {
        if(startDate == null) {
            startDate = new Date(DEFAULT_START_DATE);
        }
        if(endDate == null) {
            endDate = new Date(System.currentTimeMillis());
        }

        StatsTableDataDto statsTableDataDto = statsService.getStatsForLeagueId(id, statName, startDate, endDate);
        ModelAndView modelAndView = new ModelAndView("stats-table");
        modelAndView.addObject("tableData", statsTableDataDto);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("startDate", startDate);
        modelAndView.addObject("endDate", endDate);
        return modelAndView;
    }

    @RequestMapping(value = "/stats/all", method = RequestMethod.GET)
    public ModelAndView getStatsForAllLeagues(@RequestParam(value = "statName",
                                                            defaultValue = "overall",
                                                            required = false)
                                                                String statName,
                                              @RequestParam(value = "startDate",
                                                      required = false)
                                              Date startDate,
                                              @RequestParam(value = "endDate",
                                                      required = false)
                                              Date endDate) {
        if(startDate == null) {
            startDate = new Date(DEFAULT_START_DATE);
        }
        if(endDate == null) {
            endDate = new Date(System.currentTimeMillis());
        }

        StatsTableDataDto statsTableDataDto = statsService.getStatsForAllLeagues(statName, startDate, endDate);
        ModelAndView modelAndView = new ModelAndView("stats-table");
        modelAndView.addObject("tableData", statsTableDataDto);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("startDate", startDate);
        modelAndView.addObject("endDate", endDate);
        return modelAndView;
    }

    @RequestMapping(value = "/stats/team/{id}", method = RequestMethod.GET)
    public ModelAndView getStatsForTeamId(@PathVariable("id") Integer id) {
        Team team = teamService.getTeamById(id);
        List<Report> reports = statsService.getReportsForTeam(team);
        Double averageOverallScore = statsService.calculateAverageScoreForTeam("overall", reports, team.getName());

        ModelAndView modelAndView = new ModelAndView("stats-team");
        modelAndView.addObject("reports", reports);
        modelAndView.addObject("team", team);
        modelAndView.addObject("averageOverallScore", averageOverallScore);
        modelAndView.addObject("admin", controllerHelper.isAdmin());

        return modelAndView;
    }
}

package com.jms.respect.service;

import com.google.common.collect.Lists;
import com.jms.respect.dao.*;
import com.jms.respect.dto.StatsTableDataDto;
import com.jms.respect.repository.CompetitionRepository;
import com.jms.respect.repository.LeagueRepository;
import com.jms.respect.repository.ReportRepository;
import com.jms.respect.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created by anon on 12/03/2016.
 */
@Service
public class StatsService {
    private static final String ALL_LEAGUES = "All Leagues";

    private final ReportRepository reportRepository;
    private final CompetitionRepository competitionRepository;
    private final TeamRepository teamRepository;
    private final LeagueRepository leagueRepository;

    @Autowired
    public StatsService(ReportRepository reportRepository, CompetitionRepository competitionRepository, TeamRepository teamRepository, LeagueRepository leagueRepository) {
        this.reportRepository = reportRepository;
        this.competitionRepository = competitionRepository;
        this.teamRepository = teamRepository;
        this.leagueRepository = leagueRepository;
    }

    public StatsTableDataDto getStatsForCompetitionId(Integer competitionId){
        Competition competition = competitionRepository.findById(competitionId);
        List<Report> competitionReports = reportRepository.findByCompetition(competition);
        List<Team> teamsInCompetition = teamRepository.findByCompetition(competition);

        if(competition.getLeague().getName().equalsIgnoreCase("Cup Competition")) {
            teamsInCompetition = Lists.newArrayList(teamRepository.findAll());
        }

        Map<Team, Double> teamAverages = getTeamAverageScoreMap(competitionReports, teamsInCompetition);
        Map<String, Integer> teamReportNums = getTeamReportNums(competitionReports, new ArrayList(teamAverages.keySet()));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(teamAverages);

        String competitionAndOrLeagueName = competition.getLeague().getName() + " - " + competition.getName();

        return new StatsTableDataDto(competitionAndOrLeagueName, teamAverages, teamReportNums, averageScoreForAllTeams);
    }

    public StatsTableDataDto getStatsForLeagueId(Integer id) {
        League league = leagueRepository.findById(id);
        List<Competition> competitions = competitionRepository.findByLeague(league);
        List<Report> leagueReports = new ArrayList<>();
        List<Team> teamsInCompetition = new ArrayList<>();

        for(Competition competition : competitions) {
            leagueReports.addAll(reportRepository.findByCompetition(competition));
            teamsInCompetition.addAll(teamRepository.findByCompetition(competition));
        }

        if(league.getName().equalsIgnoreCase("Cup Competition")) {
            teamsInCompetition = Lists.newArrayList(teamRepository.findAll());
        }

        Map<Team, Double> teamAverages = getTeamAverageScoreMap(leagueReports, teamsInCompetition);
        Map<String, Integer> teamReportNums = getTeamReportNums(leagueReports, new ArrayList(teamAverages.keySet()));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(teamAverages);

        String competitionAndOrLeagueName = league.getName();

        return new StatsTableDataDto(competitionAndOrLeagueName, teamAverages, teamReportNums, averageScoreForAllTeams);
    }

    public StatsTableDataDto getStatsForAllLeagues() {
        List<Report> reports = Lists.newArrayList(reportRepository.findAll());
        List<Team> teamsInCompetition = Lists.newArrayList(teamRepository.findAll());

        Map<Team, Double> teamAverages = getTeamAverageScoreMap(reports, teamsInCompetition);
        Map<String, Integer> teamReportNums = getTeamReportNums(reports, new ArrayList(teamAverages.keySet()));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(teamAverages);

        String competitionAndOrLeagueName = ALL_LEAGUES;

        return new StatsTableDataDto(competitionAndOrLeagueName, teamAverages, teamReportNums, averageScoreForAllTeams);
    }

    private Map<String, Integer> getTeamReportNums(List<Report> leagueReports, List<Team> teamsInCompetition) {
        Map<String, Integer> teamReportNums = new LinkedHashMap<>();

        for(Team team : teamsInCompetition) {
            int totalForTeam = 0;
            for(Report report : leagueReports) {
                if (report.getHomeTeamId().getName().equals(team.getName())) {
                    totalForTeam++;
                } else if (report.getAwayTeamId().getName().equals(team.getName())) {
                    totalForTeam++;
                }
            }

            teamReportNums.put(team.getName(), totalForTeam);
        }

        return teamReportNums;
    }

    private Map<Team, Double> getTeamAverageScoreMap(List<Report> leagueReports, List<Team> teamsInCompetitionAndOrLeague) {
        Map<Team, Double> teamAverages = new HashMap<>();
        for(Team team : teamsInCompetitionAndOrLeague) {
            double averageScoreForTeam = calculateAverageScoreForTeam(leagueReports, team.getName());
            if(averageScoreForTeam >= 0) {
                teamAverages.put(team, calculateAverageScoreForTeam(leagueReports, team.getName()));
            }
        }

        // Sort them...
        teamAverages = teamAverages.entrySet().stream().sorted(Map.Entry.<Team, Double>comparingByValue().reversed())
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
        return teamAverages;
    }

    public double calculateAverageScoreForTeam(List<Report> reports, String teamName) {
        double totalScore = 0d;
        double size = reports.size();

        for(Report report : reports) {
            if(report.getHomeTeamId().getName().equalsIgnoreCase(teamName)) {
                for(OverallScore overallScore : report.getOverallScores()) {
                    totalScore += overallScore.getHomeScore();
                }
            } else if (report.getAwayTeamId().getName().equalsIgnoreCase(teamName)) {
                for(OverallScore overallScore : report.getOverallScores()) {
                    totalScore += overallScore.getAwayScore();
                }
            } else {
                size--;
            }
        }

        if(totalScore == 0 || size == 0) {
            return -1d;
        } else {
            DecimalFormat formatter = new DecimalFormat("#.00");
            Double average = Double.parseDouble(formatter.format(totalScore / size));

            return average;
        }
    }

    private double calculateAverageScoreAllTeams(Map<Team, Double> averages) {
        double total = 0d;

        for(Map.Entry<Team, Double> entry : averages.entrySet()) {
            total += entry.getValue();
        }

        if(total == 0d || averages.size() == 0) {
            return -1d;
        } else {
            DecimalFormat formatter = new DecimalFormat("#.00");
            Double average = Double.parseDouble(formatter.format(total / (double) averages.size()));

            return average;
        }
    }

    public List<Report> getReportsForTeam(Team team) {
        List<Report> reports = reportRepository.findByHomeTeamId(team);
        reports.addAll(reportRepository.findByAwayTeamId(team));

        return reports
                .stream()
                .sorted((r1, r2) -> r1.getMatchDate().compareTo(r2.getMatchDate()))
                .collect(Collectors.toList());
    }
}

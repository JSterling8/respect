package com.jms.respect.service;

import com.jms.respect.dao.*;
import com.jms.respect.dto.OverallScoresDto;
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

    public OverallScoresDto getOverallScoresForCompetitionId(Integer competitionId){
        Competition competition = competitionRepository.findById(competitionId);
        List<Report> leagueReports = reportRepository.findByCompetition(competition);
        List<Team> teamsInCompetition = teamRepository.findByCompetition(competition);

        Map<Team, Double> teamAverages = getTeamAverageScoreMap(leagueReports, teamsInCompetition);
        Map<String, Integer> teamReportNums = getTeamReportNums(leagueReports, new ArrayList(teamAverages.keySet()));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(leagueReports);

        String competitionAndOrLeagueName = competition.getLeague().getName() + " - " + competition.getName();

        return new OverallScoresDto(competitionAndOrLeagueName, teamAverages, teamReportNums, averageScoreForAllTeams);
    }

    public OverallScoresDto getOverallScoresForLeagueId(Integer id) {
        League league = leagueRepository.findById(id);
        List<Competition> competitions = competitionRepository.findByLeague(league);
        List<Report> leagueReports = new ArrayList<>();
        List<Team> teamsInCompetition = new ArrayList<>();

        for(Competition competition : competitions) {
            leagueReports.addAll(reportRepository.findByCompetition(competition));
            teamsInCompetition.addAll(teamRepository.findByCompetition(competition));
        }

        Map<Team, Double> teamAverages = getTeamAverageScoreMap(leagueReports, teamsInCompetition);
        Map<String, Integer> teamReportNums = getTeamReportNums(leagueReports, new ArrayList(teamAverages.keySet()));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(leagueReports);

        String competitionAndOrLeagueName = league.getName();

        return new OverallScoresDto(competitionAndOrLeagueName, teamAverages, teamReportNums, averageScoreForAllTeams);
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
            teamAverages.put(team, calculateAverageScoreForTeam(leagueReports, team.getName()));
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
        DecimalFormat formatter = new DecimalFormat("#.00");
        Double average = Double.parseDouble(formatter.format(totalScore / size));

        return average;
    }

    private double calculateAverageScoreAllTeams(List<Report> reports) {
        double total = 0d;

        for(Report report : reports) {
            Set<OverallScore> overallScores = report.getOverallScores();
            for(OverallScore overallScore : overallScores) {
                total += overallScore.getHomeScore();
                total += overallScore.getAwayScore();
            }
        }

        DecimalFormat formatter = new DecimalFormat("#.00");
        Double average = Double.parseDouble(formatter.format(total / ((double) reports.size() * 2d)));

        // Report size multiplied by 2 because each report has two scores - home and away
        return average;
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

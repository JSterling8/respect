package com.jms.respect.service;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.OverallScore;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.Team;
import com.jms.respect.dto.OverallScoresDto;
import com.jms.respect.repository.CompetitionRepository;
import com.jms.respect.repository.ReportRepository;
import com.jms.respect.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Autowired
    public StatsService(ReportRepository reportRepository, CompetitionRepository competitionRepository, TeamRepository teamRepository) {
        this.reportRepository = reportRepository;
        this.competitionRepository = competitionRepository;
        this.teamRepository = teamRepository;
    }

    public OverallScoresDto getOverallScoresForCompetitionId(Integer competitionId){
        Competition competition = competitionRepository.findById(competitionId);
        List<Report> leagueReports = reportRepository.findByCompetition(competition);
        List<Team> teamsInCompetition = teamRepository.findByCompetition(competition);

        Map<String, Double> teamAverages = new HashMap<>();
        for(Team team : teamsInCompetition) {
            teamAverages.put(team.getName(), calculateAverageScoreForTeam(leagueReports, team.getName()));
        }

        // Sort them...
        teamAverages = teamAverages.entrySet().stream().sorted(Map.Entry.<String, Double>comparingByValue().reversed())
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(leagueReports);

        return new OverallScoresDto(teamAverages, averageScoreForAllTeams);
    }

    private double calculateAverageScoreForTeam(List<Report> reports, String teamName) {
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

        return totalScore / size;
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

        // Report size multiplied by 2 because each report has two scores - home and away
        return total / ((double) reports.size() * 2d);
    }
}

package com.jms.respect.service;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.OverallScore;
import com.jms.respect.dao.Report;
import com.jms.respect.dto.OverallScoresDto;
import com.jms.respect.repository.CompetitionRepository;
import com.jms.respect.repository.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by anon on 12/03/2016.
 */
@Service
public class StatsService {
    private final ReportRepository reportRepository;
    private final CompetitionRepository competitionRepository;

    @Autowired
    public StatsService(ReportRepository reportRepository, CompetitionRepository competitionRepository) {
        this.reportRepository = reportRepository;
        this.competitionRepository = competitionRepository;
    }

    public OverallScoresDto getOverallScoresForCompetitionId(Integer competitionId){
        Competition competition = competitionRepository.findById(competitionId);
        List<Report> leagueReports = reportRepository.findByCompetition(competition);
        List<OverallScore> overallScores = new ArrayList<>(leagueReports.size());

        for(Report report : leagueReports) {
            overallScores.addAll(report.getOverallScores());
        }

        double averageScore = calculateAverageScore(leagueReports);

        return new OverallScoresDto(overallScores, averageScore);
    }

    private double calculateAverageScore(List<Report> reports) {
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

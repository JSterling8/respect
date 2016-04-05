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

    public StatsTableDataDto getStatsForCompetitionId(Integer competitionId, String statName){
        Competition competition = competitionRepository.findById(competitionId);
        List<Report> competitionReports = reportRepository.findByCompetition(competition);
        List<Team> teamsInCompetition = teamRepository.findByCompetition(competition);

        if(competition.getLeague().getName().equalsIgnoreCase("Cup Competition")) {
            teamsInCompetition = Lists.newArrayList(teamRepository.findAll());
        }

        Map<Team, Double> teamAverages = getTeamAverageScoreMap(statName, competitionReports, teamsInCompetition);
        Map<String, Integer> teamReportNums = getTeamReportNums(statName, competitionReports, new ArrayList(teamAverages.keySet()));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(teamAverages);

        String competitionAndOrLeagueName = competition.getLeague().getName() + " - " + competition.getName();

        return new StatsTableDataDto(statName,
                competitionAndOrLeagueName,
                teamAverages,
                teamReportNums,
                averageScoreForAllTeams);
    }

    public StatsTableDataDto getStatsForLeagueId(Integer id, String statName) {
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

        Map<Team, Double> teamAverages = getTeamAverageScoreMap(statName, leagueReports, teamsInCompetition);
        Map<String, Integer> teamReportNums = getTeamReportNums(statName, leagueReports, new ArrayList(teamAverages.keySet()));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(teamAverages);

        String competitionAndOrLeagueName = league.getName();

        return new StatsTableDataDto(statName,
                competitionAndOrLeagueName,
                teamAverages,
                teamReportNums,
                averageScoreForAllTeams);
    }

    public StatsTableDataDto getStatsForAllLeagues(String statName) {
        List<Report> reports = Lists.newArrayList(reportRepository.findAll());
        List<Team> teamsInCompetition = Lists.newArrayList(teamRepository.findAll());

        Map<Team, Double> teamAverages = getTeamAverageScoreMap(statName, reports, teamsInCompetition);
        Map<String, Integer> teamReportNums = getTeamReportNums(statName, reports, new ArrayList(teamAverages.keySet()));

        double averageScoreForAllTeams = calculateAverageScoreAllTeams(teamAverages);

        String competitionAndOrLeagueName = ALL_LEAGUES;

        return new StatsTableDataDto(statName,
                competitionAndOrLeagueName,
                teamAverages,
                teamReportNums,
                averageScoreForAllTeams);
    }

    private Map<String, Integer> getTeamReportNums(String statName, List<Report> leagueReports, List<Team> teamsInCompetition) {
        Map<String, Integer> teamReportNums = new LinkedHashMap<>();

        for(Team team : teamsInCompetition) {
            int totalForTeam = 0;
            for(Report report : leagueReports) {
                if (report.getHomeTeamId().getName().equals(team.getName())) {
                    totalForTeam++;
                } else if (report.getAwayTeamId().getName().equals(team.getName()) &&
                        !statName.equals("facilities") &&
                        !statName.equals("hospitality")) {
                    totalForTeam++;
                }
            }

            teamReportNums.put(team.getName(), totalForTeam);
        }

        return teamReportNums;
    }

    private Map<Team, Double> getTeamAverageScoreMap(String statName, List<Report> leagueReports, List<Team> teamsInCompetitionAndOrLeague) {
        Map<Team, Double> teamAverages = new HashMap<>();
        for(Team team : teamsInCompetitionAndOrLeague) {
            double averageScoreForTeam = calculateAverageScoreForTeam(statName, leagueReports, team.getName());
            if(averageScoreForTeam >= 0) {
                teamAverages.put(team, calculateAverageScoreForTeam(statName, leagueReports, team.getName()));
            }
        }

        // Sort them...
        teamAverages = teamAverages.entrySet().stream().sorted(Map.Entry.<Team, Double>comparingByValue().reversed())
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue, (e1, e2) -> e1, LinkedHashMap::new));
        return teamAverages;
    }

    public double calculateAverageScoreForTeam(String statName, List<Report> reports, String teamName) {
        double totalScore = 0d;
        double size = reports.size();

        if(statName.equals("overall")) {
            return getOverallAverage(reports, teamName, totalScore, size);
        } else if (statName.equals("facilities")) {
            return getFacilitiesAverage(reports, teamName, totalScore, size);
        } else if (statName.equals("spectators")) {
            return getSpectatorsAverage(reports, teamName, totalScore, size);
        } else if (statName.equals("assistants")) {
            return getAssistantsAverage(reports, teamName, totalScore, size);
        } else if (statName.equals("hospitality")) {
            return getHospitalityAverage(reports, teamName, totalScore, size);
        } else if (statName.equals("captain")) {
            return getCaptainLiaisonAverage(reports, teamName, totalScore, size);
        } else {
                return -1d;
        }
    }

    private double getOverallAverage(List<Report> reports, String teamName, double totalScore, double size) {
        for (Report report : reports) {
            if (report.getHomeTeamId().getName().equalsIgnoreCase(teamName)) {
                for (OverallScore overallScore : report.getOverallScores()) {
                    totalScore += overallScore.getHomeScore();
                }
            } else if (report.getAwayTeamId().getName().equalsIgnoreCase(teamName)) {
                for (OverallScore overallScore : report.getOverallScores()) {
                    totalScore += overallScore.getAwayScore();
                }
            } else {
                size--;
            }
        }

        if (totalScore == 0 || size == 0) {
            return -1d;
        } else {
            return formatScoreDecimal(totalScore, size);
        }
    }

    private double getFacilitiesAverage(List<Report> reports, String teamName, double totalScore, double size) {
        for (Report report : reports) {
            if (report.getHomeTeamId().getName().equalsIgnoreCase(teamName)) {
                for (ChangingFacility changingFacility : report.getChangingFacilities()) {
                    totalScore += changingFacility.getScore();
                }
            } else {
                size--;
            }
        }

        if (totalScore == 0 || size == 0) {
            return -1d;
        } else {
            return formatScoreDecimal(totalScore, size);
        }
    }

    private double getSpectatorsAverage(List<Report> reports, String teamName, double totalScore, double size) {
        for (Report report : reports) {
            if (report.getHomeTeamId().getName().equalsIgnoreCase(teamName)) {
                for (Spectator spectator : report.getSpectators()) {
                    totalScore += spectator.getHomeScore();
                }
            } else if (report.getAwayTeamId().getName().equalsIgnoreCase(teamName)) {
                for (Spectator spectator : report.getSpectators()) {
                    totalScore += spectator.getAwayScore();
                }
            } else {
                size--;
            }
        }

        if (totalScore == 0 || size == 0) {
            return -1d;
        } else {
            return formatScoreDecimal(totalScore, size);
        }
    }

    private double getAssistantsAverage(List<Report> reports, String teamName, double totalScore, double size) {
        for (Report report : reports) {
            if (report.getHomeTeamId().getName().equalsIgnoreCase(teamName)) {
                for (Assistant assistant : report.getAssistants()) {
                    totalScore += assistant.getHomeScore();
                }
            } else if (report.getAwayTeamId().getName().equalsIgnoreCase(teamName)) {
                for (Assistant assistant : report.getAssistants()) {
                    totalScore += assistant.getAwayScore();
                }
            } else {
                size--;
            }
        }

        if (totalScore == 0 || size == 0) {
            return -1d;
        } else {
            return formatScoreDecimal(totalScore, size);
        }
    }

    private double getHospitalityAverage(List<Report> reports, String teamName, double totalScore, double size) {
        for (Report report : reports) {
            if (report.getHomeTeamId().getName().equalsIgnoreCase(teamName)) {
                for (HomeHospitality homeHospitality : report.getHomeHospitalities()) {
                    totalScore += homeHospitality.getScore();
                }
            } else {
                size--;
            }
        }

        if (totalScore == 0 || size == 0) {
            return -1d;
        } else {
            return formatScoreDecimal(totalScore, size);
        }
    }

    private double getCaptainLiaisonAverage(List<Report> reports, String teamName, double totalScore, double size) {
        for (Report report : reports) {
            if (report.getHomeTeamId().getName().equalsIgnoreCase(teamName)) {
                for (CaptainLiaison captainLiaison : report.getCaptainLiaisons()) {
                    totalScore += captainLiaison.getHomeScore();
                }
            } else if (report.getAwayTeamId().getName().equalsIgnoreCase(teamName)) {
                for (CaptainLiaison captainLiaison : report.getCaptainLiaisons()) {
                    totalScore += captainLiaison.getAwayScore();
                }
            } else {
                size--;
            }
        }

        if (totalScore == 0 || size == 0) {
            return -1d;
        } else {
            return formatScoreDecimal(totalScore, size);
        }
    }

    private double formatScoreDecimal(double totalScore, double size) {
        DecimalFormat formatter = new DecimalFormat("#.00");
        Double average = Double.parseDouble(formatter.format(totalScore / size));

        return average;
    }

    private double calculateAverageScoreAllTeams(Map<Team, Double> averages) {
        double total = 0d;

        for(Map.Entry<Team, Double> entry : averages.entrySet()) {
            total += entry.getValue();
        }

        if(total == 0d || averages.size() == 0) {
            return -1d;
        } else {
            return formatScoreDecimal(total, (double) averages.size());
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

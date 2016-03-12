package com.jms.respect.dto;

import com.jms.respect.dao.Team;

import java.util.Map;

/**
 * Created by anon on 12/03/2016.
 */
public class OverallScoresDto {
    private String competitionAndOrLeagueName;
    private Map<Team, Double> teamAverages;
    private Map<String, Integer> teamReportNums;
    private double competitionAverage;

    public OverallScoresDto(String competitionAndOrLeagueName, Map<Team, Double> teamAverages, Map<String, Integer> teamReportNums, double competitionAverage) {
        this.competitionAndOrLeagueName = competitionAndOrLeagueName;
        this.teamReportNums = teamReportNums;
        this.teamAverages = teamAverages;
        this.competitionAverage = competitionAverage;
    }

    public OverallScoresDto() {
    }

    public Integer teamReportNums(String name) {
        return teamReportNums.get(name);
    }

    public String getCompetitionAndOrLeagueName() {
        return competitionAndOrLeagueName;
    }

    public void setCompetitionAndOrLeagueName(String competitionAndOrLeagueName) {
        this.competitionAndOrLeagueName = competitionAndOrLeagueName;
    }

    public Map<Team, Double> getTeamAverages() {
        return teamAverages;
    }

    public void setTeamAverages(Map<Team, Double> teamAverages) {
        this.teamAverages = teamAverages;
    }

    public double getCompetitionAverage() {
        return competitionAverage;
    }

    public void setCompetitionAverage(double competitionAverage) {
        this.competitionAverage = competitionAverage;
    }

    public Map<String, Integer> getTeamReportNums() {
        return teamReportNums;
    }

    public void setTeamReportNums(Map<String, Integer> teamReportNums) {
        this.teamReportNums = teamReportNums;
    }
}

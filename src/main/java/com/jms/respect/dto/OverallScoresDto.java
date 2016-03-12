package com.jms.respect.dto;

import java.util.Map;
import java.util.TreeMap;

/**
 * Created by anon on 12/03/2016.
 */
public class OverallScoresDto {
    private Map<String, Double> teamAverages;
    private double competitionAverage;

    public OverallScoresDto(Map<String, Double> teamAverages, double competitionAverage) {
        this.teamAverages = teamAverages;
        this.competitionAverage = competitionAverage;
    }

    public OverallScoresDto() {
    }

    public Map<String, Double> getTeamAverages() {
        return teamAverages;
    }

    public void setTeamAverages(TreeMap<String, Double> teamAverages) {
        this.teamAverages = teamAverages;
    }

    public double getCompetitionAverage() {
        return competitionAverage;
    }

    public void setCompetitionAverage(double competitionAverage) {
        this.competitionAverage = competitionAverage;
    }
}

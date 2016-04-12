package com.jms.respect.dto;

import com.jms.respect.dao.Team;

import java.sql.Date;
import java.util.Map;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 12/03/2016.
 */
public class StatsTableDataDto {
    private String statName;
    private String competitionAndOrLeagueName;
    private Map<Team, Double> teamAverages;
    private Map<String, Integer> teamReportNums;
    private double competitionAverage;
    private Date startDate;
    private Date endDate;

    public StatsTableDataDto(String statName,
                             String competitionAndOrLeagueName,
                             Map<Team, Double> teamAverages,
                             Map<String, Integer> teamReportNums,
                             double competitionAverage,
                             Date startDate,
                             Date endDate) {
        this.statName = statName;
        this.competitionAndOrLeagueName = competitionAndOrLeagueName;
        this.teamReportNums = teamReportNums;
        this.teamAverages = teamAverages;
        this.competitionAverage = competitionAverage;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public StatsTableDataDto() {
    }

    public String getStatName() {
        return statName;
    }

    public void setStatName(String statName) {
        this.statName = statName;
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

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }
}

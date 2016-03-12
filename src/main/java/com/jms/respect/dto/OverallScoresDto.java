package com.jms.respect.dto;

import com.jms.respect.dao.OverallScore;

import java.util.List;

/**
 * Created by anon on 12/03/2016.
 */
public class OverallScoresDto {
    private List<OverallScore> overallScores;
    private double averageScore;

    public OverallScoresDto(List<OverallScore> overallScores, double averageScore) {
        this.overallScores = overallScores;
        this.averageScore = averageScore;
    }

    public OverallScoresDto() {
    }

    public List<OverallScore> getOverallScores() {
        return overallScores;
    }

    public void setOverallScores(List<OverallScore> overallScores) {
        this.overallScores = overallScores;
    }

    public double getAverageScore() {
        return averageScore;
    }

    public void setAverageScore(double averageScore) {
        this.averageScore = averageScore;
    }
}

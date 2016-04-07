package com.jms.respect.dto;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.NotNull;
import java.sql.Date;

/**
 * Created by anon on 25/02/2016.
 */
public class CompletedForm {
    @NotNull
    @NotEmpty
    private String league;
    @NotNull
    @NotEmpty
    private String competition;
    @NotNull
    @NotEmpty
    private String referee;
    @NotNull
    @NotEmpty
    private String homeTeam;
    @NotNull
    @NotEmpty
    private String awayTeam;
    @NotNull
    private Date matchDate;
    @NotNull
    private Short changingFacilityScore;
    private String changingFacilityComment;
    @NotNull
    @NotEmpty
    private String kickOffLate;
    private String kickOffHowLate;
    private String kickOffFault;
    @NotNull
    @NotEmpty
    private String ball;
    @NotNull
    @NotEmpty
    private String shirt;
    @NotNull
    private Short spectatorHome;
    @NotNull
    private Short spectatorAway;
    private String spectatorComment;
    @NotNull
    private Short assistantHome;
    @NotNull
    private Short assistantAway;
    private String assistantComment;
    @NotNull
    private Short captainLiaisonHome;
    @NotNull
    private Short captainLiaisonAway;
    private String captainLiaisonComment;
    @NotNull
    private Short hospitality;
    @NotNull
    @NotEmpty
    private String teamSheet;
    @NotNull
    @NotEmpty
    private String contact;
    @NotNull
    @NotEmpty
    private String captainArmband;
    @NotNull
    private Short overallScoreHome;
    @NotNull
    private Short overallScoreAway;
    private String overallScoreComment;
    private Date dateFormSubmitted;

    public String getLeague() {
        return league;
    }

    public void setLeague(String league) {
        this.league = league;
    }

    public String getCompetition() {
        return competition;
    }

    public void setCompetition(String competition) {
        this.competition = competition;
    }

    public String getReferee() {
        return referee;
    }

    public void setReferee(String referee) {
        this.referee = referee;
    }

    public String getHomeTeam() {
        return homeTeam;
    }

    public void setHomeTeam(String homeTeam) {
        this.homeTeam = homeTeam;
    }

    public String getAwayTeam() {
        return awayTeam;
    }

    public void setAwayTeam(String awayTeam) {
        this.awayTeam = awayTeam;
    }

    public Date getMatchDate() {
        return matchDate;
    }

    public void setMatchDate(Date matchDate) {
        this.matchDate = matchDate;
    }

    public Short getChangingFacilityScore() {
        return changingFacilityScore;
    }

    public void setChangingFacilityScore(Short changingFacilityScore) {
        this.changingFacilityScore = changingFacilityScore;
    }

    public String getChangingFacilityComment() {
        return changingFacilityComment;
    }

    public void setChangingFacilityComment(String changingFacilityComment) {
        this.changingFacilityComment = changingFacilityComment;
    }

    public String getKickOffLate() {
        return kickOffLate;
    }

    public void setKickOffLate(String kickOffLate) {
        this.kickOffLate = kickOffLate;
    }

    public String getKickOffHowLate() {
        return kickOffHowLate;
    }

    public void setKickOffHowLate(String kickOffHowLate) {
        this.kickOffHowLate = kickOffHowLate;
    }

    public String getKickOffFault() {
        return kickOffFault;
    }

    public void setKickOffFault(String kickOffFault) {
        this.kickOffFault = kickOffFault;
    }

    public String getBall() {
        return ball;
    }

    public void setBall(String ball) {
        this.ball = ball;
    }

    public String getShirt() {
        return shirt;
    }

    public void setShirt(String shirt) {
        this.shirt = shirt;
    }

    public Short getSpectatorHome() {
        return spectatorHome;
    }

    public void setSpectatorHome(Short spectatorHome) {
        this.spectatorHome = spectatorHome;
    }

    public Short getSpectatorAway() {
        return spectatorAway;
    }

    public void setSpectatorAway(Short spectatorAway) {
        this.spectatorAway = spectatorAway;
    }

    public String getSpectatorComment() {
        return spectatorComment;
    }

    public void setSpectatorComment(String spectatorComment) {
        this.spectatorComment = spectatorComment;
    }

    public Short getAssistantHome() {
        return assistantHome;
    }

    public void setAssistantHome(Short assistantHome) {
        this.assistantHome = assistantHome;
    }

    public Short getAssistantAway() {
        return assistantAway;
    }

    public void setAssistantAway(Short assistantAway) {
        this.assistantAway = assistantAway;
    }

    public String getAssistantComment() {
        return assistantComment;
    }

    public void setAssistantComment(String assistantComment) {
        this.assistantComment = assistantComment;
    }

    public Short getCaptainLiaisonHome() {
        return captainLiaisonHome;
    }

    public void setCaptainLiaisonHome(Short captainLiaisonHome) {
        this.captainLiaisonHome = captainLiaisonHome;
    }

    public Short getCaptainLiaisonAway() {
        return captainLiaisonAway;
    }

    public void setCaptainLiaisonAway(Short captainLiaisonAway) {
        this.captainLiaisonAway = captainLiaisonAway;
    }

    public String getCaptainLiaisonComment() {
        return captainLiaisonComment;
    }

    public void setCaptainLiaisonComment(String captainLiaisonComment) {
        this.captainLiaisonComment = captainLiaisonComment;
    }

    public Short getHospitality() {
        return hospitality;
    }

    public void setHospitality(Short hospitality) {
        this.hospitality = hospitality;
    }

    public String getTeamSheet() {
        return teamSheet;
    }

    public void setTeamSheet(String teamSheet) {
        this.teamSheet = teamSheet;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getCaptainArmband() {
        return captainArmband;
    }

    public void setCaptainArmband(String captainArmband) {
        this.captainArmband = captainArmband;
    }

    public Short getOverallScoreHome() {
        return overallScoreHome;
    }

    public void setOverallScoreHome(Short overallScoreHome) {
        this.overallScoreHome = overallScoreHome;
    }

    public Short getOverallScoreAway() {
        return overallScoreAway;
    }

    public void setOverallScoreAway(Short overallScoreAway) {
        this.overallScoreAway = overallScoreAway;
    }

    public String getOverallScoreComment() {
        return overallScoreComment;
    }

    public void setOverallScoreComment(String overallScoreComment) {
        this.overallScoreComment = overallScoreComment;
    }

    public Date getDateFormSubmitted() {
        return dateFormSubmitted;
    }

    public void setDateFormSubmitted(Date dateFormSubmitted) {
        this.dateFormSubmitted = dateFormSubmitted;
    }
}
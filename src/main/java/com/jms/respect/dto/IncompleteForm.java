package com.jms.respect.dto;

import java.sql.Date;
import java.util.List;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 07/03/2016.
 */
public class IncompleteForm {
    private List<String> leagues;
    private List<String> competitions;
    private List<String> referees;
    private String referee;
    private List<String> homeTeams;
    private List<String> awayTeams;
    private Date matchDate;
    private Short changingFacilityScore;
    private String changingFacilityComment;
    private String kickOffLate;
    private String kickOffHowLate;
    private String kickOffFault;
    private String ball;
    private String shirt;
    private Short spectatorHome;
    private Short spectatorAway;
    private String spectatorComment;
    private Short assistantHome;
    private Short assistantAway;
    private String assistantComment;
    private Short captainLiaisonHome;
    private Short captainLiaisonAway;
    private String captainLiaisonComment;
    private Short hospitality;
    private String teamSheet;
    private String contact;
    private String captainArmband;
    private Short overallScoreHome;
    private Short overallScoreAway;
    private String overallScoreComment;

    public List<String> getLeagues() {
        return leagues;
    }

    public void setLeagues(List<String> leagues) {
        this.leagues = leagues;
    }

    public List<String> getCompetitions() {
        return competitions;
    }

    public void setCompetitions(List<String> competitions) {
        this.competitions = competitions;
    }

    public List<String> getReferees() {
        return referees;
    }

    public void setReferees(List<String> referees) {
        this.referees = referees;
    }

    public String getReferee() {
        return referee;
    }

    public void setReferee(String referee) {
        this.referee = referee;
    }

    public List<String> getHomeTeams() {
        return homeTeams;
    }

    public void setHomeTeams(List<String> homeTeams) {
        this.homeTeams = homeTeams;
    }

    public List<String> getAwayTeams() {
        return awayTeams;
    }

    public void setAwayTeams(List<String> awayTeams) {
        this.awayTeams = awayTeams;
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
}

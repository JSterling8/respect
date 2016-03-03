package com.jms.respect.dto;

import com.jms.respect.dao.*;

import java.sql.Date;

/**
 * Created by anon on 25/02/2016.
 */
public class Form {
    private League league;
    private Competition competition;
    private Referee referee;
    private Team homeTeam;
    private Team awayTeam;
    private Date date;
    private ChangingFacility changingFacility;
    private KickOff kickOff;
    private Ball ball;
    private Shirt shirt;
    private Spectator spectator;
    private Assistant assistant;
    private CaptainLiaison captainLiaison;
    private HomeHospitality homeHospitality;
    private TeamSheet teamSheet;
    private Contact contact;
    private CaptainArmband captainArmband;
    private OverallScore overallScore;

    public League getLeague() {
        return league;
    }

    public void setLeague(League league) {
        this.league = league;
    }

    public Competition getCompetition() {
        return competition;
    }

    public void setCompetition(Competition competition) {
        this.competition = competition;
    }

    public Referee getReferee() {
        return referee;
    }

    public void setReferee(Referee referee) {
        this.referee = referee;
    }

    public Team getHomeTeam() {
        return homeTeam;
    }

    public void setHomeTeam(Team homeTeam) {
        this.homeTeam = homeTeam;
    }

    public Team getAwayTeam() {
        return awayTeam;
    }

    public void setAwayTeam(Team awayTeam) {
        this.awayTeam = awayTeam;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public ChangingFacility getChangingFacility() {
        return changingFacility;
    }

    public void setChangingFacility(ChangingFacility changingFacility) {
        this.changingFacility = changingFacility;
    }

    public KickOff getKickOff() {
        return kickOff;
    }

    public void setKickOff(KickOff kickOff) {
        this.kickOff = kickOff;
    }

    public Ball getBall() {
        return ball;
    }

    public void setBall(Ball ball) {
        this.ball = ball;
    }

    public Shirt getShirt() {
        return shirt;
    }

    public void setShirt(Shirt shirt) {
        this.shirt = shirt;
    }

    public Spectator getSpectator() {
        return spectator;
    }

    public void setSpectator(Spectator spectator) {
        this.spectator = spectator;
    }

    public Assistant getAssistant() {
        return assistant;
    }

    public void setAssistant(Assistant assistant) {
        this.assistant = assistant;
    }

    public CaptainLiaison getCaptainLiaison() {
        return captainLiaison;
    }

    public void setCaptainLiaison(CaptainLiaison captainLiaison) {
        this.captainLiaison = captainLiaison;
    }

    public HomeHospitality getHomeHospitality() {
        return homeHospitality;
    }

    public void setHomeHospitality(HomeHospitality homeHospitality) {
        this.homeHospitality = homeHospitality;
    }

    public TeamSheet getTeamSheet() {
        return teamSheet;
    }

    public void setTeamSheet(TeamSheet teamSheet) {
        this.teamSheet = teamSheet;
    }

    public Contact getContact() {
        return contact;
    }

    public void setContact(Contact contact) {
        this.contact = contact;
    }

    public CaptainArmband getCaptainArmband() {
        return captainArmband;
    }

    public void setCaptainArmband(CaptainArmband captainArmband) {
        this.captainArmband = captainArmband;
    }

    public OverallScore getOverallScore() {
        return overallScore;
    }

    public void setOverallScore(OverallScore overallScore) {
        this.overallScore = overallScore;
    }
}

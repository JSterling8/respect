package com.jms.respect.dao;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.Set;

@Table(name = "report")
@Entity
public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer id;

    @OneToMany(mappedBy = "reportId")
    private Set<Assistant> assistants;

    @OneToMany(mappedBy = "reportId")
    private Set<Ball> balls;

    @OneToMany(mappedBy = "reportId")
    private Set<CaptainArmband> captainArmbands;

    @OneToMany(mappedBy = "reportId")
    private Set<CaptainLiaison> captainLiaisons;

    @OneToMany(mappedBy = "reportId")
    private Set<ChangingFacility> changingFacilities;

    @OneToMany(mappedBy = "reportId")
    private Set<Contact> contacts;

    @OneToMany(mappedBy = "reportId")
    private Set<HomeHospitality> homeHospitalities;

    @OneToMany(mappedBy = "reportId")
    private Set<KickOff> kickOffs;

    @OneToMany(mappedBy = "reportId")
    private Set<OverallScore> overallScores;

    @OneToMany(mappedBy = "reportId")
    private Set<Shirt> shirts;

    @OneToMany(mappedBy = "reportId")
    private Set<Spectator> spectators;

    @OneToMany(mappedBy = "reportId")
    private Set<TeamSheet> teamSheets;

    @ManyToOne
    @JoinColumn(name = "league", referencedColumnName = "id", nullable = false)
    private League league;

    @ManyToOne
    @JoinColumn(name = "referee_id", referencedColumnName = "id", nullable = false)
    private Referee refereeId;

    @ManyToOne
    @JoinColumn(name = "home_team_id", referencedColumnName = "id", nullable = false)
    private Team homeTeamId;

    @ManyToOne
    @JoinColumn(name = "away_team_id", referencedColumnName = "id", nullable = false)
    private Team awayTeamId;

    @Column(name = "date", columnDefinition = "date")
    @NotNull
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(style = "M-")
    private Date date;

    public Set<Assistant> getAssistants() {
        return assistants;
    }

    public void setAssistants(Set<Assistant> assistants) {
        this.assistants = assistants;
    }

    public Set<Ball> getBalls() {
        return balls;
    }

    public void setBalls(Set<Ball> balls) {
        this.balls = balls;
    }

    public Set<CaptainArmband> getCaptainArmbands() {
        return captainArmbands;
    }

    public void setCaptainArmbands(Set<CaptainArmband> captainArmbands) {
        this.captainArmbands = captainArmbands;
    }

    public Set<CaptainLiaison> getCaptainLiaisons() {
        return captainLiaisons;
    }

    public void setCaptainLiaisons(Set<CaptainLiaison> captainLiaisons) {
        this.captainLiaisons = captainLiaisons;
    }

    public Set<ChangingFacility> getChangingFacilities() {
        return changingFacilities;
    }

    public void setChangingFacilities(Set<ChangingFacility> changingFacilities) {
        this.changingFacilities = changingFacilities;
    }

    public Set<Contact> getContacts() {
        return contacts;
    }

    public void setContacts(Set<Contact> contacts) {
        this.contacts = contacts;
    }

    public Set<HomeHospitality> getHomeHospitalities() {
        return homeHospitalities;
    }

    public void setHomeHospitalities(Set<HomeHospitality> homeHospitalities) {
        this.homeHospitalities = homeHospitalities;
    }

    public Set<KickOff> getKickOffs() {
        return kickOffs;
    }

    public void setKickOffs(Set<KickOff> kickOffs) {
        this.kickOffs = kickOffs;
    }

    public Set<OverallScore> getOverallScores() {
        return overallScores;
    }

    public void setOverallScores(Set<OverallScore> overallScores) {
        this.overallScores = overallScores;
    }

    public Set<Shirt> getShirts() {
        return shirts;
    }

    public void setShirts(Set<Shirt> shirts) {
        this.shirts = shirts;
    }

    public Set<Spectator> getSpectators() {
        return spectators;
    }

    public void setSpectators(Set<Spectator> spectators) {
        this.spectators = spectators;
    }

    public Set<TeamSheet> getTeamSheets() {
        return teamSheets;
    }

    public void setTeamSheets(Set<TeamSheet> teamSheets) {
        this.teamSheets = teamSheets;
    }

    public League getLeague() {
        return league;
    }

    public void setLeague(League league) {
        this.league = league;
    }

    public Referee getRefereeId() {
        return refereeId;
    }

    public void setRefereeId(Referee refereeId) {
        this.refereeId = refereeId;
    }

    public Team getHomeTeamId() {
        return homeTeamId;
    }

    public void setHomeTeamId(Team homeTeamId) {
        this.homeTeamId = homeTeamId;
    }

    public Team getAwayTeamId() {
        return awayTeamId;
    }

    public void setAwayTeamId(Team awayTeamId) {
        this.awayTeamId = awayTeamId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}

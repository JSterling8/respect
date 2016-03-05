package com.jms.respect.service;

import com.jms.respect.dao.*;
import com.jms.respect.dto.Form;
import com.jms.respect.repository.CompetitionRepository;
import com.jms.respect.repository.RefereeRepository;
import com.jms.respect.repository.ReportRepository;
import com.jms.respect.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.sql.Date;

/**
 * Created by anon on 05/03/2016.
 */
@Service
public class FormService {
    private final CompetitionRepository competitionRepository;
    private final RefereeRepository refereeRepository;
    private final TeamRepository teamRepository;
    private final ReportRepository reportRepository;

    @Autowired
    public FormService(CompetitionRepository competitionRepository,
                       RefereeRepository refereeRepository,
                       TeamRepository teamRepository,
                        ReportRepository reportRepository) {
        this.competitionRepository = competitionRepository;
        this.refereeRepository = refereeRepository;
        this.teamRepository = teamRepository;
        this.reportRepository = reportRepository;
    }

    @Transactional(rollbackOn = {Exception.class})
    public void submitForm(Form form) {
        Competition competition = competitionRepository.findByName(form.getCompetition());

        String refereeName = form.getReferee();
        String refereeFirstName = refereeName.substring(0, refereeName.indexOf(' '));
        String refereeLastName = refereeName.substring(refereeName.indexOf(' '), refereeName.length());
        Referee referee = refereeRepository
                .findByFirstNameIgnoreCaseAndLastNameIgnoreCase(refereeFirstName, refereeLastName);

        Team homeTeam = teamRepository.findByName(form.getHomeTeam());
        Team awayTeam = teamRepository.findByName(form.getAwayTeam());

        Date date = form.getDate();

        Report report = new Report();
        report.setCompetition(competition);
        report.setRefereeId(referee);
        report.setHomeTeamId(homeTeam);
        report.setAwayTeamId(awayTeam);
        report = reportRepository.save(report);

        TeamSheet teamSheet = new TeamSheet();
        teamSheet.setRecieved(form.getTeamSheet());
        teamSheet.setReportId(report);

        Spectator spectator = new Spectator();
        spectator.setHomeScore(form.getSpectatorHome());
        spectator.setAwayScore(form.getSpectatorAway());
        spectator.setComment(form.getSpectatorComment());
        spectator.setReportId(report);

        Shirt shirt = new Shirt();
        shirt.setDidWear(form.getShirt());
        shirt.setReportId(report);

        OverallScore overallScore = new OverallScore();
        overallScore.setHomeScore(form.getOverallScoreHome());
        overallScore.setAwayScore(form.getOverallScoreAway());
        overallScore.setComment(form.getOverallScoreComment());
        overallScore.setReportId(report);

        KickOff kickOff = new KickOff();
        if(form.getKickOffLate().equalsIgnoreCase("Yes")) {
            kickOff.setLate(true);
        } else {
            kickOff.setLate(false);
        }
        kickOff.setFault(form.getKickOffFault());
        kickOff.setHowLate(form.getKickOffHowLate());
        kickOff.setReportId(report);

        HomeHospitality homeHospitality = new HomeHospitality();
        homeHospitality.setScore(form.getHospitality());
        homeHospitality.setReportId(report);

        Contact contact = new Contact();
        contact.setYesNoClub(form.getContact());
        contact.setReportId(report);

        ChangingFacility changingFacility = new ChangingFacility();
        changingFacility.setScore(form.getChangingFacilityScore());
        changingFacility.setComment(form.getChangingFacilityComment());
        changingFacility.setReportId(report);

        CaptainLiaison captainLiaison = new CaptainLiaison();
        captainLiaison.setHomeScore(form.getCaptainLiaisonHome());
        captainLiaison.setAwayScore(form.getCaptainLiaisonAway());
        captainLiaison.setComment(form.getCaptainLiaisonComment());
        captainLiaison.setReportId(report);

        CaptainArmband captainArmband = new CaptainArmband();
        captainArmband.setHomeAwayBothNeither(form.getCaptainArmband());
        captainArmband.setReportId(report);

        Ball ball = new Ball();
        if(form.getBall().equalsIgnoreCase("Yes")) {
            ball.setProvided(true);
        } else {
            ball.setProvided(false);
        }
        ball.setReportId(report);

        Assistant assistant = new Assistant();
        assistant.setHomeScore(form.getAssistantHome());
        assistant.setAwayScore(form.getAssistantAway());
        assistant.setComment(form.getAssistantComment());
        assistant.setReportId(report);
    }
}

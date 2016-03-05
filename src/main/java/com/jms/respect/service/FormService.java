package com.jms.respect.service;

import com.jms.respect.dao.*;
import com.jms.respect.dto.Form;
import com.jms.respect.repository.*;
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
    private final AssistantRepository assistantRepository;
    private final BallRepository ballRepository;
    private final CaptainArmbandRepository captainArmbandRepository;
    private final CaptainLiaisonRepository captainLiaisonRepository;
    private final ChangingFacilityRepository changingFacilityRepository;
    private final ContactRepository contactRepository;
    private final HomeHospitalityRepository homeHospitalityRepository;
    private final KickOffRepository kickOffRepository;
    private final OverallScoreRepository overallScoreRepository;
    private final ShirtRepository shirtRepository;
    private final SpectatorRepository spectatorRepository;
    private final TeamSheetRepository teamSheetRepository;

    @Autowired
    public FormService(CompetitionRepository competitionRepository,
                       RefereeRepository refereeRepository,
                       TeamRepository teamRepository,
                        ReportRepository reportRepository,
                       AssistantRepository assistantRepository,
                       BallRepository ballRepository,
                       CaptainArmbandRepository captainArmbandRepository,
                       CaptainLiaisonRepository captainLiaisonRepository,
                       ChangingFacilityRepository changingFacilityRepository,
                       ContactRepository contactRepository,
                       HomeHospitalityRepository homeHospitalityRepository,
                       KickOffRepository kickOffRepository,
                       OverallScoreRepository overallScoreRepository,
                       ShirtRepository shirtRepository,
                       SpectatorRepository spectatorRepository,
                       TeamSheetRepository teamSheetRepository) {
        this.competitionRepository = competitionRepository;
        this.refereeRepository = refereeRepository;
        this.teamRepository = teamRepository;
        this.reportRepository = reportRepository;
        this.assistantRepository = assistantRepository;
        this.ballRepository = ballRepository;
        this.captainArmbandRepository = captainArmbandRepository;
        this.captainLiaisonRepository = captainLiaisonRepository;
        this.changingFacilityRepository = changingFacilityRepository;
        this.contactRepository = contactRepository;
        this.homeHospitalityRepository = homeHospitalityRepository;
        this.kickOffRepository = kickOffRepository;
        this.overallScoreRepository = overallScoreRepository;
        this.shirtRepository = shirtRepository;
        this.spectatorRepository = spectatorRepository;
        this.teamSheetRepository = teamSheetRepository;
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
        teamSheetRepository.save(teamSheet);

        Spectator spectator = new Spectator();
        spectator.setHomeScore(form.getSpectatorHome());
        spectator.setAwayScore(form.getSpectatorAway());
        spectator.setComment(form.getSpectatorComment());
        spectator.setReportId(report);
        spectatorRepository.save(spectator);

        Shirt shirt = new Shirt();
        shirt.setDidWear(form.getShirt());
        shirt.setReportId(report);
        shirtRepository.save(shirt);

        OverallScore overallScore = new OverallScore();
        overallScore.setHomeScore(form.getOverallScoreHome());
        overallScore.setAwayScore(form.getOverallScoreAway());
        overallScore.setComment(form.getOverallScoreComment());
        overallScore.setReportId(report);
        overallScoreRepository.save(overallScore);

        KickOff kickOff = new KickOff();
        if(form.getKickOffLate().equalsIgnoreCase("Yes")) {
            kickOff.setLate(true);
        } else {
            kickOff.setLate(false);
        }
        kickOff.setFault(form.getKickOffFault());
        kickOff.setHowLate(form.getKickOffHowLate());
        kickOff.setReportId(report);
        kickOffRepository.save(kickOff);

        HomeHospitality homeHospitality = new HomeHospitality();
        homeHospitality.setScore(form.getHospitality());
        homeHospitality.setReportId(report);
        homeHospitalityRepository.save(homeHospitality);

        Contact contact = new Contact();
        contact.setYesNoClub(form.getContact());
        contact.setReportId(report);
        contactRepository.save(contact);

        ChangingFacility changingFacility = new ChangingFacility();
        changingFacility.setScore(form.getChangingFacilityScore());
        changingFacility.setComment(form.getChangingFacilityComment());
        changingFacility.setReportId(report);
        changingFacilityRepository.save(changingFacility);

        CaptainLiaison captainLiaison = new CaptainLiaison();
        captainLiaison.setHomeScore(form.getCaptainLiaisonHome());
        captainLiaison.setAwayScore(form.getCaptainLiaisonAway());
        captainLiaison.setComment(form.getCaptainLiaisonComment());
        captainLiaison.setReportId(report);
        captainLiaisonRepository.save(captainLiaison);

        CaptainArmband captainArmband = new CaptainArmband();
        captainArmband.setHomeAwayBothNeither(form.getCaptainArmband());
        captainArmband.setReportId(report);
        captainArmbandRepository.save(captainArmband);

        Ball ball = new Ball();
        if(form.getBall().equalsIgnoreCase("Yes")) {
            ball.setProvided(true);
        } else {
            ball.setProvided(false);
        }
        ball.setReportId(report);
        ballRepository.save(ball);

        Assistant assistant = new Assistant();
        assistant.setHomeScore(form.getAssistantHome());
        assistant.setAwayScore(form.getAssistantAway());
        assistant.setComment(form.getAssistantComment());
        assistant.setReportId(report);
        assistantRepository.save(assistant);
    }
}

package com.jms.respect.repository;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.Referee;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.Team;
import org.springframework.data.repository.CrudRepository;

import java.sql.Date;
import java.util.List;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 26/02/2016.
 */
public interface ReportRepository extends CrudRepository<Report, Long> {
    List<Report> findAllByMatchDateBetween(Date start, Date end);
    List<Report> findByHomeTeamIdName(String team);
    List<Report> findByAwayTeamIdName(String team);
    List<Report> findByRefereeId(Referee referee);
    Report findBySubmittedAndMatchDateAndHomeTeamIdAndAwayTeamId(Date dateSubmittedCheck,
                                                                 Date matchDateCheck,
                                                                 Team homeTeam,
                                                                 Team awayTeam);
    List<Report> findByCompetitionAndMatchDateBetween(Competition competition, Date start, Date end);
    List<Report> findByHomeTeamId(Team team);
    List<Report> findByAwayTeamId(Team team);
}

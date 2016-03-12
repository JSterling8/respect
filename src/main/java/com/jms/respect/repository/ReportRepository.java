package com.jms.respect.repository;

import com.jms.respect.dao.Referee;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.Team;
import org.springframework.data.repository.CrudRepository;

import java.sql.Date;
import java.util.List;

/**
 * Created by anon on 26/02/2016.
 */
public interface ReportRepository extends CrudRepository<Report, Long> {
    List<Report> findByHomeTeamIdName(String team);
    List<Report> findByAwayTeamIdName(String team);
    List<Report> findByRefereeId(Referee referee);
    Report findBySubmittedAndMatchDateAndHomeTeamIdAndAwayTeamId(Date dateSubmittedCheck,
                                                                 Date matchDateCheck,
                                                                 Team homeTeam,
                                                                 Team awayTeam);
}

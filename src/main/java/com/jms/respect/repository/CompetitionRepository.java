package com.jms.respect.repository;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.League;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by anon on 05/03/2016.
 */
@Repository
public interface CompetitionRepository extends CrudRepository<Competition, Long> {
    Competition findByNameAndLeague(String name, League league);
    Competition findById(Integer competitionId);
    List<Competition> findByLeague(League league);
}

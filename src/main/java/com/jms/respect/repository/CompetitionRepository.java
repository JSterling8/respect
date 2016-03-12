package com.jms.respect.repository;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.League;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by anon on 05/03/2016.
 */
@Repository
public interface CompetitionRepository extends CrudRepository<Competition, Long> {
    Competition findByNameAndLeague(String name, League league);
}

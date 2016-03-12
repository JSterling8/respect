package com.jms.respect.repository;

import com.jms.respect.dao.Competition;
import com.jms.respect.dao.Team;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by anon on 05/03/2016.
 */
public interface TeamRepository extends CrudRepository<Team, Long> {
    Team findByName(String name);
    List<Team> findByCompetition(Competition competition);
}

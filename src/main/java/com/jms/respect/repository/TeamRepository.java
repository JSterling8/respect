package com.jms.respect.repository;

import com.jms.respect.dao.Team;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by anon on 05/03/2016.
 */
public interface TeamRepository extends CrudRepository<Team, Long> {
    Team findByName(String name);
}

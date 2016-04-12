package com.jms.respect.repository;

import com.jms.respect.dao.League;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 07/03/2016.
 */
public interface LeagueRepository extends CrudRepository<League, Long> {
    League findByName(String league);
    League findById(Integer id);
}

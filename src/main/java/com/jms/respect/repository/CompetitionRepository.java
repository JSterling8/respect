package com.jms.respect.repository;

import com.jms.respect.dao.Competition;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by anon on 05/03/2016.
 */
@Repository
public interface CompetitionRepository extends CrudRepository<Competition, Long> {
    Competition findByName(String name);
}

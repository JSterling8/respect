package com.jms.respect.repository;

import com.jms.respect.dao.Referee;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 02/03/2016.
 */
public interface RefereeRepository extends CrudRepository<Referee, Long>{
    Referee findByFirstNameIgnoreCaseAndLastNameIgnoreCase(String firstName, String lastName);
}

package com.jms.respect.repository;

import com.jms.respect.dao.Shirt;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 05/03/2016.
 */
public interface ShirtRepository extends CrudRepository<Shirt, Long> {
}

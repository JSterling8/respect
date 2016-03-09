package com.jms.respect.repository;

import com.jms.respect.dao.User;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by anon on 02/03/2016.
 */
public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmailIgnoreCase(String email);
    User findByValidationCodeIgnoreCase(String validationCode);
}

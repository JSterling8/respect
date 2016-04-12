package com.jms.respect.repository;

import com.jms.respect.dao.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 02/03/2016.
 */
public interface UserRepository extends CrudRepository<User, Long> {
    User findByEmailIgnoreCase(String email);
    User findByValidationCodeIgnoreCase(String validationCode);
    User findById(Integer id);
    List<User> findAllByRemindAndValidated(Boolean remind, Boolean validated);
}

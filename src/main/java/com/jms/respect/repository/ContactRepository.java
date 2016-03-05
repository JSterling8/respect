package com.jms.respect.repository;

import com.jms.respect.dao.Contact;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by anon on 05/03/2016.
 */
public interface ContactRepository extends CrudRepository<Contact, Long> {
}

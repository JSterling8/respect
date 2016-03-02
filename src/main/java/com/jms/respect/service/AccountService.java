package com.jms.respect.service;

import com.jms.respect.dao.Referee;
import com.jms.respect.dao.User;
import com.jms.respect.dto.AccountCreationDto;
import com.jms.respect.repository.RefereeRepository;
import com.jms.respect.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.security.InvalidParameterException;

/**
 * Created by anon on 25/02/2016.
 */
@Service
public class AccountService {
    private static final String DEFAULT_USER_TYPE = "DEFAULT";

    private final UserRepository userRepository;
    private final RefereeRepository refereeRepository;
    private final PasswordEncoder passwordEncoder;

    @Autowired
    public AccountService(UserRepository userRepository, RefereeRepository refereeRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.refereeRepository = refereeRepository;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional(rollbackOn = {Exception.class})
    public boolean register(AccountCreationDto accountCreationDto) {
        if(emailInUse(accountCreationDto.getEmail())) {
            throw new InvalidParameterException("Email address already in use.");
        }

        Referee referee = getRefereeFromAccountCreationDto(accountCreationDto);
        referee = refereeRepository.save(referee);

        User user = getUserFromAccountCreationDtoAndReferee(accountCreationDto, referee);
        userRepository.save(user);

        return true;
    }

    private User getUserFromAccountCreationDtoAndReferee(AccountCreationDto accountCreationDto, Referee referee) {
        User user = new User();
        user.setRefereeId(referee);
        user.setEmail(accountCreationDto.getEmail());
        String encryptedPassword = passwordEncoder.encode(accountCreationDto.getPassword());
        user.setPassword(encryptedPassword);
        user.setType(DEFAULT_USER_TYPE);
        return user;
    }

    private Referee getRefereeFromAccountCreationDto(AccountCreationDto accountCreationDto) {
        Referee referee = new Referee();
        referee.setFirstName(accountCreationDto.getFirstName());
        referee.setLastName(accountCreationDto.getLastName());
        referee.setLevel(accountCreationDto.getRefereeLevel());
        return referee;
    }

    private boolean emailInUse(String email) {
        if(userRepository.findByEmailIgnoreCase(email) != null) {
            return true;
        } else {
            return false;
        }
    }
}

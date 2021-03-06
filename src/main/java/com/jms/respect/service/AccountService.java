package com.jms.respect.service;

import com.google.common.collect.Lists;
import com.jms.respect.dao.Referee;
import com.jms.respect.dao.User;
import com.jms.respect.dto.AccountCreationDto;
import com.jms.respect.dto.AccountUpdateDto;
import com.jms.respect.dto.PasswordUpdateDto;
import com.jms.respect.repository.RefereeRepository;
import com.jms.respect.repository.UserRepository;
import com.sun.jersey.api.client.ClientResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.security.InvalidParameterException;
import java.sql.Date;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.UUID;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 25/02/2016.
 */
@Service
public class AccountService {
    private static final String DEFAULT_USER_TYPE = "DEFAULT";
    private static final boolean DEFAULT_APPROVED_STATUS = true;
    private static final boolean DEFAULT_VALIDATED_STATUS = false;
    private static final String ADMIN_ACCOUNT_TYPE = "ADMIN";

    private final UserComparator userComparator = new UserComparator();
    private final UserRepository userRepository;
    private final RefereeRepository refereeRepository;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;

    @Autowired
    public AccountService(UserRepository userRepository,
                          RefereeRepository refereeRepository,
                          PasswordEncoder passwordEncoder,
                          MailService mailService) {
        this.userRepository = userRepository;
        this.refereeRepository = refereeRepository;
        this.passwordEncoder = passwordEncoder;
        this.mailService = mailService;
    }

    @Transactional(rollbackOn = {Exception.class})
    public User register(AccountCreationDto accountCreationDto) {
        if(emailInUse(accountCreationDto.getEmail())) {
            throw new InvalidParameterException("Email address already in use.");
        }

        Referee refereeEntryAssociatedWithUser = getRefereeFromAccountCreationDto(accountCreationDto);
        Referee refereeInDb = refereeRepository.findByFirstNameIgnoreCaseAndLastNameIgnoreCase(refereeEntryAssociatedWithUser.getFirstName(), refereeEntryAssociatedWithUser.getLastName());

        // If the referee is not in the db yet, save them to the db
        if(refereeInDb == null) {
            refereeEntryAssociatedWithUser = refereeRepository.save(refereeEntryAssociatedWithUser);
        } else {
            // If they are in the db, make sure their level is correct in the db
            if(refereeInDb.getLevel() != refereeEntryAssociatedWithUser.getLevel()) {
                refereeInDb.setLevel(refereeEntryAssociatedWithUser.getLevel());
                refereeInDb = refereeRepository.save(refereeInDb);
            }

            refereeEntryAssociatedWithUser = refereeInDb;
        }

        User user = getUserFromAccountCreationDtoAndReferee(accountCreationDto, refereeEntryAssociatedWithUser);
        user = userRepository.save(user);
        mailService.sendValidationEmail(user);

        return user;
    }

    @Transactional(rollbackOn = Exception.class)
    public Boolean validate(String validationCode) {
        User user = userRepository.findByValidationCodeIgnoreCase(validationCode);

        if(user == null) {
            throw new InvalidParameterException("Invalid validation code.  No user found with that code.");
        } else {
            user.setValidationCode(null);
            user.setValidated(true);
            userRepository.save(user);

            return true;
        }
    }

    private User getUserFromAccountCreationDtoAndReferee(AccountCreationDto accountCreationDto, Referee referee) {
        User user = new User();
        user.setRefereeId(referee);
        user.setEmail(accountCreationDto.getEmail());
        String encryptedPassword = passwordEncoder.encode(accountCreationDto.getPassword());
        user.setPassword(encryptedPassword);
        user.setType(DEFAULT_USER_TYPE);
        user.setApproved(DEFAULT_APPROVED_STATUS);
        user.setCreated(new Date(System.currentTimeMillis()));
        user.setValidated(DEFAULT_VALIDATED_STATUS);
        user.setRemind(accountCreationDto.getRemind());
        user.setValidationCode(getValidationCode());
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

    public String getValidationCode() {
        return UUID.randomUUID().toString();
    }

    public List<User> getAllUsers() {
        List<User> users = Lists.newArrayList(userRepository.findAll());
        Collections.sort(users, userComparator);

        return  users;
    }

    public User getUserById(Integer id) {
        return userRepository.findById(id);
    }

    public void approve(Integer userId) {
        User user = userRepository.findById(userId);

        if(user != null) {
            user.setApproved(true);
            userRepository.save(user);
        }
    }

    public void disapprove(Integer userId) {
        User user = userRepository.findById(userId);

        if(user != null) {
            user.setApproved(false);
            userRepository.save(user);
        }
    }

    public void delete(Integer userId) {
        User user = userRepository.findById(userId);

        if(user != null) {
            userRepository.delete(user);
        }
    }

    public void validate(Integer userId) {
        User user = userRepository.findById(userId);

        if (user != null) {
            user.setValidated(true);
            user.setValidationCode(null);

            userRepository.save(user);
        }
    }

    public void invalidate(Integer userId) {
        User user = userRepository.findById(userId);

        if (user != null) {
            user.setValidated(false);
            user.setValidationCode(getValidationCode());

            userRepository.save(user);
        }
    }

    public void makeAdmin(Integer userId) {
        User user = userRepository.findById(userId);

        if (user != null) {
            user.setType(ADMIN_ACCOUNT_TYPE);

            userRepository.save(user);
        }
    }

    @Transactional(rollbackOn = Exception.class)
    public void update(AccountUpdateDto accountUpdateDto, User user) {
        if(!accountUpdateDto.getEmail().equalsIgnoreCase(user.getEmail())) {
            updateEmail(user, accountUpdateDto.getEmail());
        }

        if(accountUpdateDto.getRemind() != user.getRemind()) {
            updateRemind(user, accountUpdateDto.getRemind());
        }

        if(!accountUpdateDto.getRefereeLevel().equals(user.getRefereeId().getLevel())) {
            updateRefereeLevel(user, accountUpdateDto.getRefereeLevel());
        }
    }

    @Transactional(rollbackOn = Exception.class)
    private void updateRefereeLevel(User user, Short refereeLevel) {
        Referee referee = user.getRefereeId();
        referee.setLevel(refereeLevel);
        refereeRepository.save(referee);
    }

    @Transactional(rollbackOn = Exception.class)
    private void updateRemind(User user, Boolean remind) {
        user.setRemind(remind);
        userRepository.save(user);
    }

    @Transactional(rollbackOn = Exception.class)
    private void updateEmail(User user, String email) {
        if(userRepository.findByEmailIgnoreCase(email) != null) {
            throw new InvalidParameterException("Email already in use");
        } else {
            user.setEmail(email);
            user.setValidationCode(UUID.randomUUID().toString());
            user.setValidated(false);
            user = userRepository.save(user);

            ClientResponse response = mailService.sendValidationEmail(user);
            if (response.getStatus() != 200) {
                throw new InvalidParameterException("Failed to send email");
            }
        }
    }

    public void updatePassword(User user, PasswordUpdateDto passwordUpdateDto) {
        String encryptedPassword = passwordEncoder.encode(passwordUpdateDto.getPassword());
        user.setPassword(encryptedPassword);

        userRepository.save(user);
    }

    private class UserComparator implements Comparator<User>{
        @Override
        public int compare(User o1, User o2) {
            return o1.getRefereeId().getLastName().compareTo(o2.getRefereeId().getLastName());
        }
    }
}
package com.jms.respect.controller;

import com.jms.respect.dao.Referee;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.User;
import com.jms.respect.dto.AccountUpdateDto;
import com.jms.respect.dto.PasswordUpdateDto;
import com.jms.respect.service.AccountService;
import com.jms.respect.service.FormService;
import com.jms.respect.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.security.InvalidParameterException;
import java.util.List;

/**
 * Created by anon on 06/04/2016.
 */
@PreAuthorize("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
@Controller
public class AccountManagementController {
    private AccountService accountService;
    private FormService formService;
    private ControllerHelper controllerHelper;
    private MailService mailService;

    @Autowired
    public AccountManagementController(AccountService accountService,
                                       FormService formService,
                                       ControllerHelper controllerHelper,
                                       MailService mailService) {
        this.accountService = accountService;
        this.formService = formService;
        this.controllerHelper = controllerHelper;
        this.mailService = mailService;
    }

    @RequestMapping(value = "/my-reports", method = RequestMethod.GET)
    public ModelAndView getReportsForUser() {
        ModelAndView modelAndView = new ModelAndView("user-reports");
        User user = controllerHelper.getUser();

        if(user == null) {
            return new ModelAndView("error");
        }

        Referee referee = user.getRefereeId();

        List<Report> reports = formService.getAllReportsByReferee(referee);
        modelAndView.addObject("reports", reports);
        modelAndView.addObject("user", user);
        modelAndView.addObject("admin", controllerHelper.isAdmin());

        return modelAndView;
    }

    @RequestMapping(value = {"/my-account", "/account", "/user-account"}, method = RequestMethod.GET)
    public ModelAndView getMyAccountPage() {
        ModelAndView mav = new ModelAndView("user-account");
        mav.addObject("admin", controllerHelper.isAdmin());

        User user = controllerHelper.getUser();
        // Overriding validation code so user can't grab it from the object in javascript and validate a fake email
        mav.addObject("user", user);
        mav.addObject("accountUpdateDto", getAccountUpdateDtoForUser(user));

        return mav;
    }

    @RequestMapping(value = {"/account/change-password"}, method = RequestMethod.GET)
    public ModelAndView getChangePasswordPage() {
        ModelAndView mav = new ModelAndView("change-password");
        mav.addObject("admin", controllerHelper.isAdmin());
        mav.addObject("passwordUpdateDto", new PasswordUpdateDto());
        return mav;
    }

    @RequestMapping(value = "/account/resend", method = RequestMethod.GET)
    public ModelAndView resendValidationEmail() {
        mailService.sendValidationEmail(controllerHelper.getUser());
        ModelAndView mav = new ModelAndView("validation-email-resent");
        mav.addObject("admin", controllerHelper.isAdmin());
        return mav;
    }

    @RequestMapping(value = {"/account/change-password"}, method = RequestMethod.POST)
    public ModelAndView getChangePasswordPage(@ModelAttribute("passwordUpdateDto") @Valid PasswordUpdateDto passwordUpdateDto,
                                              BindingResult result) {
        if(result.hasErrors()) {
            ModelAndView mav = new ModelAndView("change-password");
            mav.addObject("admin", controllerHelper.isAdmin());
            mav.addObject("passwordUpdateDto", passwordUpdateDto);

            return mav;
        } else {
            accountService.updatePassword(controllerHelper.getUser(), passwordUpdateDto);

            return new ModelAndView("redirect:/account");
        }
    }

    @RequestMapping(value = {"/account/update", "/my-account/update", "/user-account/update"}, method = RequestMethod.POST)
    public ModelAndView updateUserAccount(@ModelAttribute("accountUpdateDto") @Valid AccountUpdateDto accountUpdateDto,
                                          BindingResult result) {
        if (result.hasErrors()) {
            ModelAndView mav = new ModelAndView("/user-account");
            mav.addObject("admin", controllerHelper.isAdmin());

            User user = controllerHelper.getUser();
            // Overriding validation code so user can't grab it from the object in javascript and validate a fake email
            mav.addObject("accountUpdateDto", accountUpdateDto);
            mav.addObject("user", user);

            return mav;
        } else {
            if(accountUpdateDto.getRemind() == null) {
                accountUpdateDto.setRemind(false);
            }

            try {
                accountService.update(accountUpdateDto, controllerHelper.getUser());
            } catch (InvalidParameterException e) {
                ObjectError error = new ObjectError("accountUpdateDto", e.getMessage());
                result.addError(error);

                ModelAndView mav = new ModelAndView("/user-account");
                mav.addObject("admin", controllerHelper.isAdmin());

                controllerHelper.reloadUserFromDb();

                User user = controllerHelper.getUser();
                // Overriding validation code so user can't grab it from the object in javascript and validate a fake email
                mav.addObject("accountUpdateDto", accountUpdateDto);
                mav.addObject("user", user);

                return mav;
            }

            return new ModelAndView("redirect:/account");
        }
    }

    private AccountUpdateDto getAccountUpdateDtoForUser(User user) {
        AccountUpdateDto accountUpdateDto = new AccountUpdateDto();
        accountUpdateDto.setRemind(user.getRemind());
        accountUpdateDto.setEmail(user.getEmail());
        accountUpdateDto.setRefereeLevel(user.getRefereeId().getLevel());

        return accountUpdateDto;
    }
}

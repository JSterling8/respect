package com.jms.respect.controller;

import com.jms.respect.config.security.RespectUserDetails;
import com.jms.respect.dao.Referee;
import com.jms.respect.dao.Report;
import com.jms.respect.dao.User;
import com.jms.respect.dto.PasswordUpdateDto;
import com.jms.respect.service.AccountService;
import com.jms.respect.service.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 09/03/2016.
 */
@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
public class AdminAccountController {
    private final AccountService accountService;
    private final ControllerHelper controllerHelper;
    private final FormService formService;

    @Autowired
    public AdminAccountController(AccountService accountService,
                                  ControllerHelper controllerHelper,
                                  FormService formService) {
        this.accountService = accountService;
        this.controllerHelper = controllerHelper;
        this.formService = formService;
    }

    @RequestMapping(value = "/respect/admin/users", method = RequestMethod.GET)
    public ModelAndView getUsersPage() {
        ModelAndView modelAndView = new ModelAndView("admin-users");
        List<User> users = accountService.getAllUsers();
        modelAndView.addObject("users", users); 
        modelAndView.addObject("admin", controllerHelper.isAdmin());

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/{id}", method = RequestMethod.GET)
    public ModelAndView getUserPage(@PathVariable("id") Integer userId) {
        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);

        modelAndView.addObject("user", user);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("passwordUpdateDto", new PasswordUpdateDto());

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/reports/user/{id}", method = RequestMethod.GET)
    public ModelAndView getReportsForUser(@PathVariable("id") Integer userId) {
        ModelAndView modelAndView = new ModelAndView("user-reports");
        User user = accountService.getUserById(userId);
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

    @RequestMapping(value = "/respect/admin/user/approve/{id}", method = RequestMethod.GET)
    public ModelAndView approve(@PathVariable("id") Integer userId) {
        accountService.approve(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("passwordUpdateDto", new PasswordUpdateDto());

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/disapprove/{id}", method = RequestMethod.GET)
    public ModelAndView disapprove(@PathVariable("id") Integer userId) {
        accountService.disapprove(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("passwordUpdateDto", new PasswordUpdateDto());

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/validate/{id}", method = RequestMethod.GET)
    public ModelAndView validate(@PathVariable("id") Integer userId) {
        accountService.validate(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("passwordUpdateDto", new PasswordUpdateDto());

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/invalidate/{id}", method = RequestMethod.GET)
    public ModelAndView invalidate(@PathVariable("id") Integer userId) {
        accountService.invalidate(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("passwordUpdateDto", new PasswordUpdateDto());

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/make-admin/{userId}", method = RequestMethod.GET)
    public ModelAndView makeAdmin(@PathVariable("userId") Integer userId) {
        accountService.makeAdmin(userId);

        ModelAndView modelAndView = new ModelAndView("admin-user");
        User user = accountService.getUserById(userId);
        modelAndView.addObject("user", user);
        modelAndView.addObject("admin", controllerHelper.isAdmin());
        modelAndView.addObject("passwordUpdateDto", new PasswordUpdateDto());

        return modelAndView;
    }

    @RequestMapping(value = "/respect/admin/user/change-password/{userId}", method = RequestMethod.POST)
    public ModelAndView changePassword(@PathVariable("userId") Integer userId,
                                       @ModelAttribute("passwordUpdateDto") @Valid PasswordUpdateDto passwordUpdateDto,
                                       BindingResult result) {
        User user = accountService.getUserById(userId);

        if(result.hasErrors()) {
            ModelAndView modelAndView = new ModelAndView("admin-user");

            modelAndView.addObject("user", user);
            modelAndView.addObject("admin", controllerHelper.isAdmin());

            return modelAndView;
        }

        accountService.updatePassword(user, passwordUpdateDto);
        return new ModelAndView("redirect:/respect/admin/user/" + userId);
    }

    @RequestMapping(value = "/respect/admin/user/delete/{id}", method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") Integer userId) {
        RespectUserDetails currentUserDetails = (RespectUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User currentUser = currentUserDetails.getUser();

        if(currentUser.getId() == userId) {
            return new ModelAndView("forbidden");
        }

        accountService.delete(userId);

        return getUsersPage();
    }
}

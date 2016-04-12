package com.jms.respect.service;

import com.jms.respect.dao.User;
import com.jms.respect.repository.UserRepository;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.api.client.filter.HTTPBasicAuthFilter;
import com.sun.jersey.core.util.MultivaluedMapImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

/**
 * Created by Jonathan Sterling <Jon@thanCodes.com> on 06/04/2016.
 */
@Service
public class MailService {
    private final UserRepository userRepository;

    private final Resource resource = new ClassPathResource("/application.properties");
    private final Properties props;
    private final String apiKey;
    private final String url;

    @Autowired
    public MailService(UserRepository userRepository) {
        this.userRepository = userRepository;
        props = loadProperties();
        apiKey = props.getProperty("mailgun.api.key");
        url = "https://api.mailgun.net/v3/mg.huddersfieldrespect.co.uk/messages";
    }

    public ClientResponse sendValidationEmail(User user) {
        Client client = Client.create();
        client.addFilter(new HTTPBasicAuthFilter("api", apiKey));
        WebResource webResource = client.resource(url);
        MultivaluedMapImpl formData = new MultivaluedMapImpl();
        formData.add("subject", "Validate Your Email");
        formData.add("from", "Admin <admin@huddersfieldrespect.co.uk>");
        formData.add("to", user.getEmail());
        formData.add("html", generateMessage(user));

        return webResource.type(MediaType.APPLICATION_FORM_URLENCODED).post(ClientResponse.class, formData);
    }

    private String generateMessage(User user) {
        return "Please <a href=\"https://huddersfieldrespect.co.uk/validate/" + user.getValidationCode() + "\">" +
                "click here to validate your account on huddersfieldrespect.co.uk</a>.";
    }

    @Scheduled(cron="0 0 17 * * SUN")
    public void sendReminders() {
        List<User> usersToEmail = userRepository.findAllByRemindAndValidated(true, true);

        Client client = Client.create();
        client.addFilter(new HTTPBasicAuthFilter("api", apiKey));
        WebResource webResource = client.resource(url);
        MultivaluedMapImpl formData = new MultivaluedMapImpl();
        formData.add("subject", "Reminder: Respect Report(s)");
        formData.add("from", "Admin <admin@huddersfieldrespect.co.uk>");
        for(User user : usersToEmail) {
            formData.add("to", user.getEmail());
        }

        formData.add("html", "Don't forget to submit your respect report(s) for this weekend if you have not done so already.  " +
                "You can do so at: <a href=\"https://huddersfieldrespect.co.uk\">huddersfieldrespect.co.uk</a>.<br /><br /><b>You " +
                "can turn these reminders off in the 'My Account' section of the website.</b>  Simply untick the 'Remind' " +
                "checkbox and click 'Update Account Info'.");

        webResource.type(MediaType.APPLICATION_FORM_URLENCODED).post(ClientResponse.class, formData);
    }

    private Properties loadProperties() {
        try {
            Properties properties = PropertiesLoaderUtils.loadProperties(resource);
            return properties;
        } catch (IOException e) {
            return new Properties();
        }
    }
}

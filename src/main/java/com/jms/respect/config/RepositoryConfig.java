package com.jms.respect.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.orm.jpa.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * Created by anon on 30/01/2016.
 */
@Configuration
@EnableJpaRepositories(basePackages = "com.jms.rater.repository")
@EnableAutoConfiguration
@EntityScan(basePackages = {"com.jms.rater.model", "org.goochjs.glicko2"})
public class RepositoryConfig {
}
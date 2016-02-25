package com.jms.respect.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.orm.jpa.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

/**
 * Created by anon on 30/01/2016.
 */
@Configuration
@EnableJpaRepositories(basePackages = "com.jms.respect.repository")
@EnableAutoConfiguration
@EntityScan(basePackages = {"com.jms.respect.model"})
public class RepositoryConfig {
}
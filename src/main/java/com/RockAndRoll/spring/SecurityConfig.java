package com.RockAndRoll.spring;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
//@EnableTransactionManagement
@ImportResource({ "classpath:security.xml" })
public class SecurityConfig {
    public SecurityConfig() {
        super();
    }
}

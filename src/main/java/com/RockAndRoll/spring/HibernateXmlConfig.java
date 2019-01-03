package com.RockAndRoll.spring;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@ImportResource({ "classpath:hibernate.xml" })
public class HibernateXmlConfig {

}

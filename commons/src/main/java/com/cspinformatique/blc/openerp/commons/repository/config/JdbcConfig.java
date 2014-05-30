package com.cspinformatique.blc.openerp.commons.repository.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@Configuration
@ImportResource("classpath:commons/spring/applicationContext-datasource.xml")
public class JdbcConfig {}
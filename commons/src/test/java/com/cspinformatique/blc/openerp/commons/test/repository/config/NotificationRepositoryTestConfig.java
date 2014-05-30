package com.cspinformatique.blc.openerp.commons.test.repository.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import com.cspinformatique.blc.openerp.test.schema.NotifierSchemaUtil;
import com.cspinformatique.blc.openerp.test.util.DataSourceUtils;

@Configuration
public class NotificationRepositoryTestConfig {
	public @Bean JdbcTemplate notifierJdbcTemplate(){
		return new JdbcTemplate(DataSourceUtils.getDatasource(NotifierSchemaUtil.DS_NAME));
	}
}

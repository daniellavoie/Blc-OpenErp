package com.cspinformatique.blc.openerp.notifier.test.repository.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

import com.cspinformatique.blc.openerp.test.schema.BlcSchemaUtil;
import com.cspinformatique.blc.openerp.test.util.DataSourceUtils;

@Configuration
public class PartnerRepositoryTestConfig {
	public @Bean JdbcTemplate blcJdbcTemplate(){
		return new JdbcTemplate(DataSourceUtils.getDatasource(BlcSchemaUtil.DS_NAME));
	}
}

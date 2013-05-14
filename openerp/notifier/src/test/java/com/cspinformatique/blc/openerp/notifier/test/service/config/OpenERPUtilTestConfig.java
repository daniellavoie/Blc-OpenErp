package com.cspinformatique.blc.openerp.notifier.test.service.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.cspinformatique.blc.openerp.adapter.OpenERPUtil;
import com.cspinformatique.blc.openerp.test.adapter.OpenERPPropsUtil;
import com.cspinformatique.blc.openerp.test.schema.OpenERPSchemaUtil;

@Configuration
public class OpenERPUtilTestConfig {
	public @Bean OpenERPUtil openERPUtil(){
		return new OpenERPPropsUtil(OpenERPSchemaUtil.TEST_CONFIG_FILE);
	}
}

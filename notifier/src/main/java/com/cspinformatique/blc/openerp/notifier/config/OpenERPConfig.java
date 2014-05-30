package com.cspinformatique.blc.openerp.notifier.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.cspinformatique.blc.openerp.adapter.OpenERPServletUtil;
import com.cspinformatique.blc.openerp.adapter.OpenERPUtil;

@Configuration
public class OpenERPConfig {
	public @Bean OpenERPUtil openERPUtil(){
		return new OpenERPServletUtil();
	}
}

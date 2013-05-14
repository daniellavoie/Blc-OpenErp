package com.cspinformatique.blc.openerp.aspects.config;

import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.service.CustomerService;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;

import com.cspinformatique.blc.openerp.commons.repository.NotificationRepository;
import com.cspinformatique.blc.openerp.commons.repository.impl.NotificationJdbcRepository;
import com.cspinformatique.blc.openerp.commons.service.NotificationService;
import com.cspinformatique.blc.openerp.commons.service.impl.NotificationServiceImpl;
import com.cspinformatique.blc.openerp.test.data.CustomerTestData;
import com.cspinformatique.blc.openerp.test.schema.BlcSchemaUtil;
import com.cspinformatique.blc.openerp.test.schema.NotifierSchemaUtil;
import com.cspinformatique.blc.openerp.test.util.DataSourceUtils;

@Configurable
public class CustomerServiceAspectTestConfig {
	public @Bean JdbcTemplate blcJdbcTemplate(){
		return new JdbcTemplate(DataSourceUtils.getDatasource(BlcSchemaUtil.DS_NAME));
	}
	
	public @Bean CustomerService customerService(){
		CustomerService customerService = Mockito.mock(CustomerService.class);
		
		Customer customer = CustomerTestData.getCustomer();
		
		Mockito.when(
			customerService.registerCustomer(customer, customer.getPassword(), customer.getPassword()
		)).thenReturn(customer);
		
		return customerService;
	}
	
	public @Bean NotificationRepository notificationRepository(){
		return new NotificationJdbcRepository();
	}
	
	public @Bean NotificationService notificationService(){
		return new NotificationServiceImpl();
	}
	
	public @Bean JdbcTemplate notifierJdbcTemplate(){
		return new JdbcTemplate(DataSourceUtils.getDatasource(NotifierSchemaUtil.DS_NAME));
	}
}

package com.cspinformatique.blc.openerp.aspects;

import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.service.CustomerService;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.cspinformatique.blc.openerp.aspects.CustomerServiceAspect;
import com.cspinformatique.blc.openerp.aspects.config.AspectsConfig;
import com.cspinformatique.blc.openerp.aspects.config.CustomerServiceAspectTestConfig;
import com.cspinformatique.blc.openerp.commons.service.NotificationService;
import com.cspinformatique.blc.openerp.test.data.CustomerTestData;
import com.cspinformatique.blc.openerp.test.schema.BlcSchemaUtil;
import com.cspinformatique.blc.openerp.test.schema.NotifierSchemaUtil;

public class CustomerServiceAspectTest {
	@Test
	public void registerCustomerTest(){
		ApplicationContext context =	new AnnotationConfigApplicationContext(
											CustomerServiceAspectTestConfig.class,
											AspectsConfig.class,
											CustomerServiceAspect.class
										);
		
		CustomerService customerService = context.getBean(CustomerService.class);
		NotificationService notificationSerivce = context.getBean(NotificationService.class);
		
		// Reloading notifer schema.
		NotifierSchemaUtil.recreateSchema((JdbcTemplate)context.getBean("notifierJdbcTemplate"));
		BlcSchemaUtil.recreateSchema((JdbcTemplate)context.getBean("blcJdbcTemplate"));
		
		// Validating the notification table is empty.
		Assert.assertNull(notificationSerivce.getOldestNotification());
		
		// Registering the test customer.
		Customer customer = CustomerTestData.getCustomer();
		customerService.registerCustomer(customer, customer.getPassword(), customer.getPassword());
		
		// Check that the notification service was properly called through the aspect. 
		// The customer notification should be present in the test database.
		Assert.assertNotNull(notificationSerivce.getOldestNotification());
	}
}

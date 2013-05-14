package com.cspinformatique.blc.openerp.notifier.test.service.impl;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.cspinformatique.blc.openerp.commons.repository.impl.NotificationJdbcRepository;
import com.cspinformatique.blc.openerp.commons.service.NotificationService;
import com.cspinformatique.blc.openerp.commons.service.impl.NotificationServiceImpl;
import com.cspinformatique.blc.openerp.models.Notification;
import com.cspinformatique.blc.openerp.notifier.repository.impl.PartnerJdbcRepository;
import com.cspinformatique.blc.openerp.notifier.service.PartnerService;
import com.cspinformatique.blc.openerp.notifier.service.impl.NotificationsServiceImpl;
import com.cspinformatique.blc.openerp.notifier.service.impl.PartnerServiceImpl;
import com.cspinformatique.blc.openerp.notifier.test.repository.config.JdbcTemplateTestConfig;
import com.cspinformatique.blc.openerp.notifier.test.service.config.OpenERPUtilTestConfig;
import com.cspinformatique.blc.openerp.test.data.NotificationTestData;
import com.cspinformatique.blc.openerp.test.schema.NotifierSchemaUtil;
import com.cspinformatique.blc.openerp.test.schema.OpenERPSchemaUtil;

import org.junit.Assert;
import org.junit.Test;

public class PartnerServiceImplTest {
	@Test
	public void notifyPartnerToOpenERP(){		
		// Build the ApplicationContext for testing.
		AnnotationConfigApplicationContext 
			context =	new AnnotationConfigApplicationContext(
							JdbcTemplateTestConfig.class,
							PartnerJdbcRepository.class,
							PartnerServiceImpl.class,
							OpenERPUtilTestConfig.class,
							NotificationJdbcRepository.class,
							NotificationServiceImpl.class,
							NotificationsServiceImpl.class
						);
		
		OpenERPSchemaUtil.recreateTestDatabase();
		NotifierSchemaUtil.recreateSchema((JdbcTemplate)context.getBean("notifierJdbcTemplate"));

		// Create a new partner notification.
		Notification notification = NotificationTestData.getNotification();
		
		context.getBean(NotificationService.class).saveNotification(notification);
		
		// Notify the partner to OpenERP.
		context.getBean(NotificationsServiceImpl.class).processNotifications();
		
		// Validate the partner is available in OpenERP.
		Assert.assertTrue(context.getBean(PartnerService.class).partnerExists(notification.getEntityId()));
		
		context.close();
	}
}

package com.dimensionfantastique.commons.test.repository;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Spy;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.jdbc.core.JdbcTemplate;

import com.cspinformatique.blc.openerp.models.Notification;
import com.cspinformatique.blc.openerp.commons.repository.NotificationRepository;
import com.cspinformatique.blc.openerp.commons.repository.impl.NotificationJdbcRepository;
import com.cspinformatique.blc.openerp.test.data.NotificationTestData;
import com.cspinformatique.blc.openerp.test.schema.NotifierSchemaUtil;
import com.cspinformatique.blc.openerp.test.util.DataSourceUtils;

import java.util.Date;
import java.util.List;

@RunWith(MockitoJUnitRunner.class)
public class NotificationJdbcRepositoryTest {
	@Spy
	private JdbcTemplate notifierJdbcTemplate = new JdbcTemplate(DataSourceUtils.getDatasource(NotifierSchemaUtil.DS_NAME));
	
	@InjectMocks
	private NotificationRepository notificationRepository = new NotificationJdbcRepository();
	
	@Test
	public void testSaveNotification(){		
		NotifierSchemaUtil.recreateSchema(notifierJdbcTemplate);
		
		Notification notification = NotificationTestData.getNotification();
		
		// Insert the notification.
		this.notificationRepository.saveNotification(notification);
		
		// Validating it can be retreived.
		Assert.assertEquals(
			notification, 
			this.notificationRepository.getNotification(
				this.notificationRepository.getOldestNotification().getId()
			)
		);
	}
	
	@Test
	public void testGetOldesttNotification(){
		// Test in case  there is no notification. Expecting null.
		NotifierSchemaUtil.recreateSchema(notifierJdbcTemplate);
		
		// Validating that NULL is returned when no notification are present.
		Assert.assertNull(this.notificationRepository.getOldestNotification());
		
		// Creating a series of false notification.
		List<Notification> 
			notifications = NotificationTestData.getRandomNotifications(10, false);
		
		for(Notification notification : notifications){
			this.notificationRepository.saveNotification(notification);
		}
		
		// Oldest notification should be the first one of the list.
		Assert.assertEquals(
			notifications.get(0), 
			this.notificationRepository.getOldestNotification()
		);
	}
	
	@Test
	public void updateNotificationTest(){
		NotifierSchemaUtil.recreateSchema(notifierJdbcTemplate);
		
		// Create a first notification.
		Notification notification = NotificationTestData.getNotification();
		
		// Creating the notification.
		this.notificationRepository.saveNotification(notification);
		
		// Modifying the timestamp.
		notification.setProcessedTimestamp(new Date());
		
		// Persisting the modification.
		this.notificationRepository.updateNotification(notification);
		
		// Validating that the noficiation has been persisted.
		Assert.assertEquals(
			notification, 
			this.notificationRepository.getNotification(notification.getId())
		);
	}
}

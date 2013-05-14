package com.dimensionfantastique.commons.test.service;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import com.cspinformatique.blc.openerp.models.Notification;
import com.cspinformatique.blc.openerp.commons.repository.NotificationRepository;
import com.cspinformatique.blc.openerp.commons.repository.impl.NotificationJdbcRepository;
import com.cspinformatique.blc.openerp.commons.service.NotificationService;
import com.cspinformatique.blc.openerp.commons.service.impl.NotificationServiceImpl;
import com.cspinformatique.blc.openerp.commons.test.repository.config.NotificationRepositoryTestConfig;
import com.cspinformatique.blc.openerp.test.data.NotificationTestData;
import com.cspinformatique.blc.openerp.test.schema.NotifierSchemaUtil;

import java.util.Date;
import java.util.List;

@RunWith(MockitoJUnitRunner.class)
public class NotificationServiceTest {
	@Mock 
	private NotificationRepository mockNotificationRepository;
	
	@InjectMocks 
	private NotificationService notificationService = new NotificationServiceImpl();
	
	private ApplicationContext getApplicationContext(){
		return new AnnotationConfigApplicationContext(
			NotificationServiceImpl.class,
			NotificationJdbcRepository.class,
			NotificationRepositoryTestConfig.class
		);
	}
	
	@Test
	public final void getOldestNotificationTest(){
		// Validating that null is returned when no notification is available.
		Assert.assertNull(this.notificationService.getOldestNotification());
		
		Notification 
			oldestNotification = NotificationTestData.getRandomNotifications(10, false).get(0);
		
		Mockito.when(mockNotificationRepository.getOldestNotification()).thenReturn(
			oldestNotification
		);
		
		// Validating that the service retreive the oldest notification from the repository.
		Assert.assertEquals(
			oldestNotification, 
			this.notificationService.getOldestNotification()
		);
	}
	
	@Test
	public final void saveNotificationTest(){
		Notification notification = NotificationTestData.getNotification();
		
		Mockito.doThrow(
			new RuntimeException("Repository called")
		).when(mockNotificationRepository).saveNotification(notification);
		
		try{
			this.notificationService.saveNotification(notification);
			
			throw new RuntimeException("Repository not called");
		}catch(RuntimeException runtimeEx){
			if(runtimeEx.getMessage().equals("Repository called")){
				assert(true);
			}else{
				throw runtimeEx;
			}
		}
	}
	
	@Test
	public void saveNotificationIntegrationTest(){
		ApplicationContext context = this.getApplicationContext();
		
		// Initializing the database.
		NotifierSchemaUtil.recreateSchema(context.getBean(JdbcTemplate.class));
		
		// Retreiving notificationService.
		NotificationService 
			notificationService = context.getBean(NotificationService.class);
		
		// Generating ramdom notifications
		int NOTIF_COUNT = 50;
		List<Notification> 
			notifications = NotificationTestData.getRandomNotifications(NOTIF_COUNT, false);
		
		// Persisting the notifications.
		for(Notification notification : notifications){
			notificationService.saveNotification(notification);
		};
			
		// Validating the notifications.
		Assert.assertEquals(notificationService.countNotificationsToProcess(), NOTIF_COUNT);
		
		Notification notification = notifications.get(0);
		
		notification.setProcessedTimestamp(new Date());
		
		notificationService.updateNotification(notification);
		
		Assert.assertEquals(
			notification, 
			notificationService.getNotification(notification.getId())
		);
	}
	
	@Test
	public void updateNotificationTest(){
		Notification notification = NotificationTestData.getNotification();
		
		Mockito.doThrow(
			new RuntimeException("Repository called")
		).when(this.mockNotificationRepository).updateNotification(notification);
		
		try{
			this.notificationService.updateNotification(notification);
			
			throw new RuntimeException("Repository not called");
		}catch(RuntimeException runtimeEx){
			if(runtimeEx.getMessage().equals("Repository called")){
				assert(true);
			}else{
				throw runtimeEx;
			}
		}
	}
}

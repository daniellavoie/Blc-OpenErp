package com.cspinformatique.blc.openerp.notifier.job;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cspinformatique.blc.openerp.notifier.service.NotificationsService;

@Component
public class NotificationJob {
	@Autowired private NotificationsService notificationsService;
	
	@Scheduled(fixedDelay=1000)
	public void processNotifications(){
		this.notificationsService.processNotifications();
	}
}
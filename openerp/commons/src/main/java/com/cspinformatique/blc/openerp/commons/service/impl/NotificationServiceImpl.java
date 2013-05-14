package com.cspinformatique.blc.openerp.commons.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cspinformatique.blc.openerp.commons.repository.NotificationRepository;
import com.cspinformatique.blc.openerp.commons.service.NotificationService;
import com.cspinformatique.blc.openerp.models.Notification;

@Service
public class NotificationServiceImpl implements NotificationService {
	@Autowired private NotificationRepository notificationRepository;
	
	@Override
	public int countNotificationsToProcess(){
		return this.notificationRepository.countNotificationsToProcess();
	}
	
	@Override
	public Notification getNotification(long id){
		return this.notificationRepository.getNotification(id);
	}
	
	@Override 
	public Notification getOldestNotification(){
		return this.notificationRepository.getOldestNotification();
	}
	
	@Override 
	public void saveNotification(Notification notification) {
		this.notificationRepository.saveNotification(notification);
	}
	
	@Override
	public void updateNotification(Notification notification){
		this.notificationRepository.updateNotification(notification);
	}
}

package com.cspinformatique.blc.openerp.commons.service;

import com.cspinformatique.blc.openerp.models.Notification;

public interface NotificationService {
	public int countNotificationsToProcess();
	
	public Notification getNotification(long id);
	
	public Notification getOldestNotification();
	
	public void saveNotification(Notification notification);
	
	public void updateNotification(Notification notification);
}

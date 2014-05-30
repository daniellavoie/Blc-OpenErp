package com.cspinformatique.blc.openerp.notifier.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cspinformatique.blc.openerp.commons.service.NotificationService;
import com.cspinformatique.blc.openerp.models.Notification;
import com.cspinformatique.blc.openerp.models.Notification.EntityType;
import com.cspinformatique.blc.openerp.notifier.service.NotificationsService;
import com.cspinformatique.blc.openerp.notifier.service.PartnerService;

import java.util.Date;

@Service
public class NotificationsServiceImpl implements NotificationsService {
	@Autowired
	private NotificationService notificationService;
	
	@Autowired
	private PartnerService partnerService;
	
	@Override
	public void processNotifications(){
		Notification notification = null;
		do{
			notification = this.notificationService.getOldestNotification();
			
			if(notification != null){
				if(notification.getEntityType().equals(EntityType.CUSTOMER)){					
					this.partnerService.notifyPartnerToOpenERP(notification.getEntityId());
				}else{
					throw new RuntimeException("Unsupported notification");
				}
				
				notification.setProcessedTimestamp(new Date());
				
				this.notificationService.updateNotification(notification);
			}
		}while(notification != null);
	}

}

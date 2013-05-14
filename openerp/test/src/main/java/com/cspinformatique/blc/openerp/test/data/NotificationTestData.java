package com.cspinformatique.blc.openerp.test.data;

import com.cspinformatique.blc.openerp.models.Notification;
import com.cspinformatique.blc.openerp.models.Notification.EntityType;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public abstract class NotificationTestData {
	public static Notification getNotification(){
		return new Notification(
			0l,
			"dlavoie@live.ca",
			EntityType.CUSTOMER,
			new Date(),
			null
		);
	}
	
	public static List<Notification> getRandomNotifications(int count, boolean proccessed){
		List<Notification> notifications = new ArrayList<Notification>();
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.DAY_OF_MONTH, -1 * count);
		
		for(int i = 0; i < count; i++){
			EntityType entityType = null;
			if(i % EntityType.values().length == 0){
				entityType = EntityType.CUSTOMER;
			}
			
			calendar.add(Calendar.DAY_OF_MONTH, 1);
			
			notifications.add(
				new Notification(
					0l,
					String.valueOf(i * 100), 
					entityType,
					calendar.getTime(), 
					null
				)
			);
		}
		
		return notifications;
	}
}

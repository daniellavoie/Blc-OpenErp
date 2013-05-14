package com.cspinformatique.blc.openerp.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.broadleafcommerce.profile.core.domain.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cspinformatique.blc.openerp.models.Notification;
import com.cspinformatique.blc.openerp.commons.service.NotificationService;

import javax.annotation.PostConstruct;

import java.util.Date;

@Aspect
@Component
public class CustomerServiceAspect {
	@Autowired
	private NotificationService notificationService;
	
	@PostConstruct
	public void init(){
		System.out.println("Init criss");
	}
	
	@Around("execution(" +
			"* " +
			"org.broadleafcommerce.profile.core.service.CustomerService.registerCustomer(..))")
	public Object notifyCustomerCreation(ProceedingJoinPoint joinPoint){
		System.out.println("A customer will be registered.");
		
		try {
			Customer newCustomer = (Customer)joinPoint.proceed();
			
			if(newCustomer != null){
				// User has been created, proceed with notification 
				// to the synchronizer database.
				this.notificationService.saveNotification(
					new Notification(
						0l,
						newCustomer.getEmailAddress(),
						Notification.EntityType.CUSTOMER,
						new Date(), 
						null
					)
				);
			}
			
			return newCustomer;
		} catch (Throwable ex) {
			throw new RuntimeException(ex);
		}
	}
}

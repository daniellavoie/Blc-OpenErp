package com.cspinformatique.blc.openerp.test.data;

import org.broadleafcommerce.profile.core.domain.Customer;
import org.broadleafcommerce.profile.core.domain.CustomerImpl;

public class CustomerTestData {
	public static Customer getCustomer(){
		Customer customer = new CustomerImpl();
		
		customer.setEmailAddress("johnnyfarago@cspinformatique.com");
		customer.setPassword("testing");
		customer.setFirstName("Johnny");
		customer.setLastName("Farago");
		customer.setUsername("johnnyfarago@cspinformatique.com");
		
		return customer;
	}
}

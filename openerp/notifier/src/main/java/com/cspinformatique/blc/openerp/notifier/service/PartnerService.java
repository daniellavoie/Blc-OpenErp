package com.cspinformatique.blc.openerp.notifier.service;

import com.cspinformatique.blc.openerp.notifier.model.Partner;

public interface PartnerService {	
	public Partner getPartnerFromBlc(String email);
	
	public void notifyPartnerToOpenERP(String email);
	
	public boolean partnerExists(String email);
}

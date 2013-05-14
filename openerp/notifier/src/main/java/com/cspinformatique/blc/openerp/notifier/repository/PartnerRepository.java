package com.cspinformatique.blc.openerp.notifier.repository;

import com.cspinformatique.blc.openerp.notifier.model.Partner;

public interface PartnerRepository {
	public Partner getPartner(String email);
}

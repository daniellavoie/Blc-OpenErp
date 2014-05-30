package com.cspinformatique.blc.openerp.notifier.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cspinformatique.blc.openerp.adapter.OpenERPUtil;
import com.cspinformatique.blc.openerp.notifier.model.Partner;
import com.cspinformatique.blc.openerp.notifier.repository.PartnerRepository;
import com.cspinformatique.blc.openerp.notifier.service.PartnerService;
import com.debortoliwines.openerp.api.FilterCollection;

import java.util.HashMap;

@Component
public class PartnerServiceImpl implements PartnerService {
	@Autowired private PartnerRepository partnerRepository;
	@Autowired private OpenERPUtil openERPUtil;	
	
	@Override
	public Partner getPartnerFromBlc(String email){
		return this.partnerRepository.getPartner(email);
	}
	
	@Override
	public void notifyPartnerToOpenERP(String email) {		
		Partner partner = this.partnerRepository.getPartner(email);
		
		HashMap<String, Object> partnerMap = new HashMap<String, Object>();
		
		partnerMap.put("email", partner.getEmail());
		partnerMap.put("name", partner.getName());
		
		this.openERPUtil.createObject(partnerMap, Partner.OPENERP_KEY);
	}

	@Override
	public boolean partnerExists(String email){
		FilterCollection filters = new FilterCollection();
		filters.add("email","=",email);
		
		if(this.openERPUtil.searchObject(filters, new String[]{"name"}, Partner.OPENERP_KEY).size() > 0){
			return true;
		}else{
			return false;
		}
	}
}

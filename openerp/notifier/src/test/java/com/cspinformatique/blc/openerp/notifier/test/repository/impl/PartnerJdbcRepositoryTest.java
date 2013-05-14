package com.cspinformatique.blc.openerp.notifier.test.repository.impl;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Spy;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.jdbc.core.JdbcTemplate;

import com.cspinformatique.blc.openerp.notifier.repository.PartnerRepository;
import com.cspinformatique.blc.openerp.notifier.repository.impl.PartnerJdbcRepository;
import com.cspinformatique.blc.openerp.test.schema.BlcSchemaUtil;
import com.cspinformatique.blc.openerp.test.util.DataSourceUtils;

@RunWith(MockitoJUnitRunner.class)
public class PartnerJdbcRepositoryTest {
	@Spy
	private JdbcTemplate blcJdbcTemplate = new JdbcTemplate(DataSourceUtils.getDatasource(BlcSchemaUtil.DS_NAME));
	
	@InjectMocks
	private PartnerRepository partnerRepository = new PartnerJdbcRepository();
	
	@Test
	public void getPartnerTest(){
		BlcSchemaUtil.recreateSchema(blcJdbcTemplate);
		
		Assert.assertEquals(
			partnerRepository.getPartner("dlavoie@live.ca").getName(), 
			"Daniel Lavoie"
		);
	}
}

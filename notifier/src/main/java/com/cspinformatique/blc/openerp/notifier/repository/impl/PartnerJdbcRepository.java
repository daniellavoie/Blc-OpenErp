package com.cspinformatique.blc.openerp.notifier.repository.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.cspinformatique.blc.openerp.notifier.model.Partner;
import com.cspinformatique.blc.openerp.notifier.repository.PartnerRepository;

import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class PartnerJdbcRepository implements PartnerRepository {
	private static final String SQL_SELECT_PARTNER = 
		"SELECT " +
		"	EMAIL_ADDRESS, " +
		"	FIRST_NAME, " +
		"	LAST_NAME " +
		"FROM " +
		"	BLC_CUSTOMER " +
		"WHERE " +
		"	USER_NAME = ? ";
	
	@Autowired
	private JdbcTemplate blcJdbcTemplate;
	
	@Override
	public Partner getPartner(String userName) { 
		try{
			return this.blcJdbcTemplate.queryForObject(
				SQL_SELECT_PARTNER, 
				new RowMapper<Partner>(){
					@Override
					public Partner mapRow(ResultSet rs, int rowNum) throws SQLException {
						return new Partner(
							rs.getString("EMAIL_ADDRESS"), 
							rs.getString("FIRST_NAME") + " " + rs.getString("LAST_NAME")
						);
					}
				},
				userName
			);
		}catch(EmptyResultDataAccessException emptyResultDataAccessEx){
			return null;
		}
	}
}

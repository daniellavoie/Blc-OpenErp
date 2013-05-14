package com.cspinformatique.blc.openerp.commons.repository.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.cspinformatique.blc.openerp.commons.repository.NotificationRepository;
import com.cspinformatique.blc.openerp.models.Notification;
import com.cspinformatique.blc.openerp.models.Notification.EntityType;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

@Repository
public class NotificationJdbcRepository implements NotificationRepository {
	private static final String SQL_COUNT_NOTIFICATIONS_TO_PROCESS =
		"SELECT " +
		"	count(*) as count " +
		"FROM " +
		"	notifications " +
		"WHERE " +
		"	processedTs IS NULL";
	
	private static final String SQL_INSERT_NOTIFICATION =
		"INSERT INTO notifications ( " +
		"	entityId, " +
		"	entityType, " +
		"	timestamp, " +
		"	processedTs " +
		") VALUES ( " +
		"	?,?,?,? " +
		") ";
	
	private static final String SQL_UPDATE_NOTIFICATION =
		"UPDATE " +
		"	notifications " +
		"SET " +
		"	processedTs = ? " +
		"WHERE " +
		"	id = ?";
	
	private static final String SQL_SELECT_NOTIFICATION_TO_PROCESS =
		"SELECT " +
		"	min(id) as id " +
		"FROM " +
		"	notifications " +
		"WHERE " +
		"	processedTs IS NULL";
	
	private static final String SQL_SELECT_NOTIFICATION = 
		"SELECT " +
		"	entityId, " +
		"	processedTs, " +
		"	entityType, " +
		"	timestamp " +
		"FROM " +
		"	notifications " +
		"WHERE " +
		"	id = ?";
	
	private static final String SQL_SELECT_NOTIFICATION_BY_KEY = 
		"SELECT " +
		"	id " +
		"FROM " +
		"	notifications " +
		"WHERE " +
		"	entityId = ? AND" +
		"	entityType = ? AND " +
		"	timestamp = ?";
	
	@Autowired
	private JdbcTemplate notifierJdbcTemplate;
	
	public int countNotificationsToProcess(){
		return this.notifierJdbcTemplate.queryForInt(SQL_COUNT_NOTIFICATIONS_TO_PROCESS);
	}
	
	@Override
	public Notification getNotification(
		final long id
	){
		try{
			return this.notifierJdbcTemplate.queryForObject(
				SQL_SELECT_NOTIFICATION, 
				new RowMapper<Notification>(){
					@Override
					public Notification mapRow(
						ResultSet rs, 
						int rowNum
					) throws SQLException {
						Timestamp timestampTs = rs.getTimestamp("timestamp");
						Timestamp processedTimestampTs = rs.getTimestamp("processedTs");
						
						Date timestamp = null;
						Date processedTimestamp = null;
						
						if(timestampTs != null){
							timestamp = new Date(timestampTs.getTime());
						}
						
						if(processedTimestampTs != null){
							processedTimestamp = new Date(processedTimestampTs.getTime());
						}
						
						return new Notification(
							id,
							rs.getString("entityId"), 
							EntityType.valueOf(rs.getString("entityType")),
							timestamp,
							processedTimestamp
						);
					}
				},
				id
			);
		}catch(EmptyResultDataAccessException emptyResultDataAccessEx){
			return null;
		}
	}
	
	@Override
	public Notification getOldestNotification(){
		return this.notifierJdbcTemplate.queryForObject(
			SQL_SELECT_NOTIFICATION_TO_PROCESS, 
			new RowMapper<Notification>(){
				@Override
				public Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
					long id = rs.getLong("id");
					
					if(id != 0l){
						return getNotification(id);
					}else{
						return null;
					}
				}
			}
		);
	}
	
	@Override
	public void saveNotification(Notification notification) {
		this.notifierJdbcTemplate.update(
			SQL_INSERT_NOTIFICATION, 
			notification.getEntityId(),
			notification.getEntityType().toString(),
			notification.getTimestamp(),
			notification.getProcessedTimestamp()
		);
		
		notification.setId(
			this.notifierJdbcTemplate.queryForLong(
				SQL_SELECT_NOTIFICATION_BY_KEY, 
				notification.getEntityId(), 
				notification.getEntityType().toString(), 
				notification.getTimestamp()
			)
		);
	}
	
	public void setNotifierJdbcTemplate(JdbcTemplate jdbcTemplate){
		this.notifierJdbcTemplate = jdbcTemplate;
	}
	
	
	@Override
	public void updateNotification(Notification notification){
		this.notifierJdbcTemplate.update(
			SQL_UPDATE_NOTIFICATION, 
			notification.getProcessedTimestamp(), 
			notification.getId()
		);
	}
}

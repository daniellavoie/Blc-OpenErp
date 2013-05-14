package com.cspinformatique.blc.openerp.models;

import java.util.Date;

public class Notification {
	public enum EntityType {CUSTOMER};
	
	private long id;
	private String entityId;
	private EntityType entityType;
	private Date timestamp;
	private Date processedTimestamp;
	
	public Notification(){
		
	}
	
	public Notification(
		long id, 
		String entityId, 
		EntityType entityType,
		Date timestamp, 
		Date processedTimestamp
	){
		this.id = id;
		this.entityId = entityId;
		this.entityType = entityType;
		this.timestamp = timestamp;
		this.processedTimestamp = processedTimestamp;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getEntityId() {
		return entityId;
	}

	public void setEntityId(String entityId) {
		this.entityId = entityId;
	}

	public EntityType getEntityType() {
		return entityType;
	}

	public void setEntityType(EntityType entityType) {
		this.entityType = entityType;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public Date getProcessedTimestamp() {
		return processedTimestamp;
	}

	public void setProcessedTimestamp(Date processedTimestamp) {
		this.processedTimestamp = processedTimestamp;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((entityId == null) ? 0 : entityId.hashCode());
		result = prime * result
				+ ((entityType == null) ? 0 : entityType.hashCode());
		result = prime * result + (int) (id ^ (id >>> 32));
		result = prime
				* result
				+ ((processedTimestamp == null) ? 0 : processedTimestamp
						.hashCode());
		result = prime * result
				+ ((timestamp == null) ? 0 : timestamp.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Notification other = (Notification) obj;
		if (entityId == null) {
			if (other.entityId != null)
				return false;
		} else if (!entityId.equals(other.entityId))
			return false;
		if (entityType != other.entityType)
			return false;
		if (id != other.id)
			return false;
		if (processedTimestamp == null) {
			if (other.processedTimestamp != null)
				return false;
		} else if (processedTimestamp.getTime() / 1000 != other.getProcessedTimestamp().getTime() / 1000)
			return false;
		if (timestamp == null) {
			if (other.timestamp != null)
				return false;
		} else if (timestamp .getTime() / 1000 != other.getTimestamp().getTime() / 1000)
			return false;
		return true;
	}
}

package com.cspinformatique.blc.openerp.adapter;

import org.apache.xmlrpc.XmlRpcException;

import com.debortoliwines.openerp.api.FilterCollection;
import com.debortoliwines.openerp.api.ObjectAdapter;
import com.debortoliwines.openerp.api.Row;
import com.debortoliwines.openerp.api.RowCollection;
import com.debortoliwines.openerp.api.Session;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class OpenERPAdapter {
	private Session openERPSession;
	private OpenERPConfig openERPConfig;
	
	private boolean sessionStarted = false;
	
	public OpenERPAdapter(
		OpenERPConfig openERPConfig
	){
		this.openERPConfig = openERPConfig;
		
		this.openERPSession =	new Session(
									this.openERPConfig.getHost(), 
									this.openERPConfig.getPort(), 
									this.openERPConfig.getDatabase(),
									this.openERPConfig.getUser(), 
									this.openERPConfig.getPassword()
								);
	}
	
	public void dropDatabase(String database, String password){
		this.openERPSession.dropDatabase(database, password);
	}
	
	public void duplicateDatabase(String sourceDatabase, String newDatabase){
		this.openERPSession.duplicateDatabase(sourceDatabase, newDatabase);
	}
	
	public void createDatabase(String lang, String password){
		this.openERPSession.createDatabase(
			this.openERPConfig.getDatabase(), 
			"false", 
			lang, 
			password
		);
	}
	
	public int createObject(Map<String, Object> parameters, String objectType){
		this.startSession();
		
		ObjectAdapter objectAdapter = openERPSession.getObjectAdapter(objectType);
		
		Row row = this.getRowForCreation(objectAdapter, parameters);
		
		this.loadParams(parameters, row);
		
		objectAdapter.createObject(row);
		
		return row.getID();	
	}
	
	public List<String> listDatabases(){
		return this.openERPSession.listDatabases();
	}
	
	private void loadParams(Map<String, Object> parameters, Row row){
		for(Entry<String, Object> entry : parameters.entrySet()){
			row.put(entry.getKey(), entry.getValue());
		}		
	}
	
	private Row getRowForCreation(ObjectAdapter objectAdapter, Map<String, Object> parameters){
		int i = 0;
		String[] fields = new String[parameters.size()];
		for(String key : parameters.keySet()){
			fields[i] = key;
			++i;
		}
		
		return objectAdapter.getNewRow(fields);
	}
	
	public RowCollection searchAndReadObject(FilterCollection filters, String[] fields, String objectType){
		try{
			this.startSession();
		
			ObjectAdapter objectAdapter = this.openERPSession.getObjectAdapter(objectType);
			
			return objectAdapter.searchAndReadObject(filters, fields);
		}catch(XmlRpcException xmlRpcEx){
			throw new RuntimeException(xmlRpcEx);
		}
	}
	
	private void startSession(){
		if(!this.sessionStarted){
			this.sessionStarted = true;
			this.openERPSession.startSession();
		}
	}
}

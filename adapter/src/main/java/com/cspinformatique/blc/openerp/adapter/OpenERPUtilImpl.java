package com.cspinformatique.blc.openerp.adapter;

import org.springframework.stereotype.Component;

import com.cspinformatique.blc.openerp.adapter.OpenERPAdapter;
import com.debortoliwines.openerp.api.FilterCollection;
import com.debortoliwines.openerp.api.RowCollection;

import java.util.List;
import java.util.Map;

@Component
public abstract class OpenERPUtilImpl implements OpenERPUtil {
	public abstract OpenERPAdapter getAdapter();
	
	public void createObject(Map<String, Object> parameters, String entityKey){
		this.getAdapter().createObject(parameters, entityKey);
	}
	
	public List<String> listDatabase(){
		return this.getAdapter().listDatabases();
	}
	
	public RowCollection searchObject(FilterCollection filters, String[] fields, String objectType){
		return this.getAdapter().searchAndReadObject(filters, fields, objectType);
	}
}

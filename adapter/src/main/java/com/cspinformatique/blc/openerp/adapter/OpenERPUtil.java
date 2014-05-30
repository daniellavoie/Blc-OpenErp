package com.cspinformatique.blc.openerp.adapter;

import com.cspinformatique.blc.openerp.adapter.OpenERPAdapter;
import com.debortoliwines.openerp.api.FilterCollection;
import com.debortoliwines.openerp.api.RowCollection;

import java.util.List;
import java.util.Map;

public interface OpenERPUtil{
	public OpenERPAdapter getAdapter();
	
	public void createObject(Map<String, Object> parameters, String entityKey);
	
	public OpenERPConfig getConfig();
	
	public List<String> listDatabase();
	
	public RowCollection searchObject(FilterCollection filters, String[] fields, String objectType);
}
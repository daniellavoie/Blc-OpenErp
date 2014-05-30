package com.cspinformatique.blc.openerp.test.adapter;

import com.cspinformatique.blc.openerp.adapter.OpenERPAdapter;
import com.cspinformatique.blc.openerp.adapter.OpenERPConfig;
import com.cspinformatique.blc.openerp.adapter.OpenERPUtilImpl;
import com.cspinformatique.blc.openerp.test.util.PropertiesUtil;

import java.util.Properties;

public class OpenERPPropsUtil extends OpenERPUtilImpl {	
	private OpenERPConfig openERPConfig;
	
	public OpenERPPropsUtil(String configFile){
		Properties properties = PropertiesUtil.getPropertiesFromClasspath(configFile);
		
		this.openERPConfig = new OpenERPConfig(
			properties.getProperty("openerp.xmlrpc.host"),
			Integer.valueOf(properties.getProperty("openerp.xmlrpc.port")),
			properties.getProperty("openerp.xmlrpc.db.database"),
			properties.getProperty("openerp.xmlrpc.db.user"),
			properties.getProperty("openerp.xmlrpc.db.password"),
			properties.getProperty("openerp.xmlrpc.masterPassword")
		);
	}

	@Override
	public OpenERPAdapter getAdapter() {
		return new OpenERPAdapter(this.openERPConfig);
	}
	
	public OpenERPConfig getConfig(){
		return this.openERPConfig;
	}
}

package com.cspinformatique.blc.openerp.test.schema;

import com.cspinformatique.blc.openerp.adapter.OpenERPAdapter;
import com.cspinformatique.blc.openerp.adapter.OpenERPConfig;
import com.cspinformatique.blc.openerp.adapter.OpenERPUtil;
import com.cspinformatique.blc.openerp.test.adapter.OpenERPPropsUtil;

public abstract class OpenERPSchemaUtil {
	public static final String TEST_CONFIG_FILE = "openerp/config.properties";
	
	public static OpenERPAdapter getAdapter(){
		return new OpenERPPropsUtil(TEST_CONFIG_FILE).getAdapter();
	}
	
	public static void recreateTestDatabase(){
		OpenERPUtil openERPUtil = new OpenERPPropsUtil(TEST_CONFIG_FILE);
		
		OpenERPConfig config = openERPUtil.getConfig();
		OpenERPAdapter adapter = openERPUtil.getAdapter();
		
		try{
			adapter.dropDatabase(config.getDatabase(), config.getMasterPassword());
		}catch(Exception ex){
		}finally{
			adapter.duplicateDatabase(config.getDatabase() + "_model", config.getDatabase());
		}
	}
}

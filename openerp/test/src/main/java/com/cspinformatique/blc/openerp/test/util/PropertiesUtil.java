package com.cspinformatique.blc.openerp.test.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public abstract class PropertiesUtil {
	public static Properties getPropertiesFromClasspath(String propFileName) {
	    try{
			// loading xmlProfileGen.properties from the classpath
		    Properties props = new Properties();
		    InputStream inputStream = DataSourceUtils.class.getClassLoader()
		        .getResourceAsStream(propFileName);
	
		    if (inputStream == null) {
		        throw new FileNotFoundException("property file '" + propFileName
		            + "' not found in the classpath");
		    }
	
		    props.load(inputStream);
		    
		    return props;
	    }catch(IOException ioEx){
	    	throw new RuntimeException(ioEx);
	    }	    
	}
}

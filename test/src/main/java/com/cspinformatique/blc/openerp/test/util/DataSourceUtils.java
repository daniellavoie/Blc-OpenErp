package com.cspinformatique.blc.openerp.test.util;

import org.apache.commons.dbcp.BasicDataSource;

import javax.sql.DataSource;

import java.util.Properties;

public abstract class DataSourceUtils {
	private static final String JDBC_PROPERTIES_FILE = "jdbc/datasource.properties";
	
	public static DataSource getDatasource(String db){
		Properties properties = PropertiesUtil.getPropertiesFromClasspath(JDBC_PROPERTIES_FILE);
		
		BasicDataSource datasource = new BasicDataSource();
		datasource.setDriverClassName(properties.getProperty(db + ".jdbc.driver"));
		datasource.setPassword(properties.getProperty(db + ".jdbc.password"));
		datasource.setUrl(properties.getProperty(db + ".jdbc.url"));
		datasource.setUsername(properties.getProperty(db + ".jdbc.username"));
		
		return datasource;
	}
}

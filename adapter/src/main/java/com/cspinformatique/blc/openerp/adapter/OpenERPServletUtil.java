package com.cspinformatique.blc.openerp.adapter;

import org.springframework.beans.factory.annotation.Autowired;

import com.cspinformatique.blc.openerp.adapter.OpenERPAdapter;
import com.cspinformatique.blc.openerp.adapter.OpenERPConfig;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

public class OpenERPServletUtil extends OpenERPUtilImpl {
	@Autowired ServletContext servletContext;
	
	private OpenERPConfig openERPConfig;
	
	@PostConstruct
	public void init(){
		this.openERPConfig = new OpenERPConfig(
			servletContext.getInitParameter("com.cspinformatique.blc.openerp.notifier.openerp.host"),
			Integer.valueOf(
				servletContext.getInitParameter(
											"com.cspinformatique.blc.openerp.notifier.openerp.port"
				)
			),
			servletContext.getInitParameter("com.cspinformatique.blc.openerp.notifier.openerp.db.database"),
			servletContext.getInitParameter("com.cspinformatique.blc.openerp.notifier.openerp.db.user"),
			servletContext.getInitParameter("com.cspinformatique.blc.openerp.notifier.openerp.db.password"),
			servletContext.getInitParameter("com.cspinformatique.blc.openerp.notifier.openerp.masterPassword")
		);
	}

	@Override
	public OpenERPAdapter getAdapter() {
		return new OpenERPAdapter(this.openERPConfig);
	}

	@Override
	public OpenERPConfig getConfig() {
		return this.openERPConfig;
	}
}

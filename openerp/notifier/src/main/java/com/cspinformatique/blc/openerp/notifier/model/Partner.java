package com.cspinformatique.blc.openerp.notifier.model;

public class Partner {
	public static final String OPENERP_KEY = "res.partner";
	
	private String email;
	private String name;
	
	public Partner(String email, String name){
		this.email = email;
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}

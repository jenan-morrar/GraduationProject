package com.test.GraduationProject.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "websiteRate")
public class WebsiteRate {
	
	@Id
	@GeneratedValue
	private Long id;
	
	private String senderName;
	private String message;
	
	public WebsiteRate() {
		
	}
	public WebsiteRate(Long id, String senderName, String message) {
		super();
		this.id = id;
		this.senderName = senderName;
		this.message = message;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

}

package com.test.GraduationProject.models;

public class Contact {

	private String emailSender;
	private String emailReciver;
	private String message;
	private String subject;
	
	public Contact() {
		
	}

	public Contact(String emailSender, String emailReciver, String masseg, String subject) {
		super();
		this.emailSender = emailSender;
		this.emailReciver = emailReciver;
		this.message = masseg;
		this.subject = subject;
	}

	public String getEmailSender() {
		return emailSender;
	}

	public void setEmailSender(String emailSender) {
		this.emailSender = emailSender;
	}

	public String getEmailReciver() {
		return emailReciver;
	}

	public void setEmailReciver(String emailReciver) {
		this.emailReciver = emailReciver;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
}

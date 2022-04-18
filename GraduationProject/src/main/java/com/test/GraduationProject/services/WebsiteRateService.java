package com.test.GraduationProject.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.WebsiteRate;
import com.test.GraduationProject.repositories.WebsiteRateRepository;

@Service
public class WebsiteRateService {

	private final WebsiteRateRepository websiteRateRepositorye;

	public WebsiteRateService(WebsiteRateRepository websiteRateRepositorye) {
		this.websiteRateRepositorye = websiteRateRepositorye;
	}

	// returns all the website rates
	public List<WebsiteRate> allWebsiteRates() {
		return websiteRateRepositorye.findAll();
	}

	// creates a website rate
	public WebsiteRate createWebsiteRate(WebsiteRate websiteRate) {
		return websiteRateRepositorye.save(websiteRate);
	}

}

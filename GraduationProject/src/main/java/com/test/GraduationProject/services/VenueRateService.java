package com.test.GraduationProject.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.VenueRate;
import com.test.GraduationProject.repositories.VenueRateRepository;

@Service

public class VenueRateService {

	private final VenueRateRepository venueRateRepository;

	public VenueRateService(VenueRateRepository venueRateRepository) {
		this.venueRateRepository = venueRateRepository;
	}

	// returns all the Venue rates
	public List<VenueRate> allVenueRates() {
		return venueRateRepository.findAll();
	}

	// creates a venue rate
	public VenueRate createVenueRate(VenueRate VenueRate) {
		return venueRateRepository.save(VenueRate);
	}
}

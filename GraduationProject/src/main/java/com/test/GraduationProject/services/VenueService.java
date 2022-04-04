package com.test.GraduationProject.services;

import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

import com.test.GraduationProject.models.ServiceOfVenue;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.repositories.VenueRepository;

@Service
public class VenueService {

	private final VenueRepository venueRepository;

	public VenueService(VenueRepository venueRepository) {
		this.venueRepository = venueRepository;
	}

	// returns all the venues
	public List<Venue> allVenues() {
		return venueRepository.findAll();
	}

	// creates a venue
	public Venue createVenue(Venue venue) {
		return venueRepository.save(venue);
	}

	// retrieves a venue
	public Venue findVenue(Long id) {
		Optional<Venue> optionalVenue = venueRepository.findById(id);
		if (optionalVenue.isPresent()) {
			return optionalVenue.get();
		} else {
			return null;
		}
	}

	// edit a venue
	public Venue updateVenue(Long id, String name, String description, String location, float price,
			List<ServiceOfVenue> services) {
		Venue venue = findVenue(id);
		venue.setId(id);
		venue.setName(name);
		venue.setDescription(description);
		venue.setLocation(location);
		venue.setPrice(price);
		venue.setServices(services);
		return venueRepository.save(venue);
	}

	// delete a venue
	public void deleteVenue(Long id) {
		venueRepository.deleteById(id);
	}
}

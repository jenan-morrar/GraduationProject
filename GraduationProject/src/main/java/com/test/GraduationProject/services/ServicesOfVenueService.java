package com.test.GraduationProject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.ServiceOfVenue;
import com.test.GraduationProject.repositories.ServiceRepository;

@Service
public class ServicesOfVenueService {
	
	private ServiceRepository serviceReposiotry;
	
	public ServicesOfVenueService(ServiceRepository serviceReposiotry) {
		this.serviceReposiotry = serviceReposiotry;
	}
	
	// returns all the venues
	public List<ServiceOfVenue> allVenuesServices() {
		return serviceReposiotry.findAll();
	}

	// creates a venue
	public ServiceOfVenue createService(ServiceOfVenue service) {
		return serviceReposiotry.save(service);
	}

	// retrieves a venue
	public ServiceOfVenue findService(Long id) {
		Optional<ServiceOfVenue> optionalService = serviceReposiotry.findById(id);
		if (optionalService.isPresent()) {
			return optionalService.get();
		} else {
			return null;
		}
	}
	
    // edit a venue 
    public ServiceOfVenue updateService(Long id, String name,float price) {
    	ServiceOfVenue service = findService(id);
    	service.setId(id);
    	service.setName(name);
    	service.setPrice(price);
    	return serviceReposiotry.save(service);
    }
    
    // delete a venue 
    public void deleteService(Long id) {
    	serviceReposiotry.deleteById(id);
    }

}

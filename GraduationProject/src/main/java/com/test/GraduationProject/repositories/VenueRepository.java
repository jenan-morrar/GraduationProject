package com.test.GraduationProject.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.test.GraduationProject.models.Venue;

@Repository
public interface VenueRepository extends CrudRepository<Venue, Long> {

	List<Venue>findAll();
	Optional<Venue> findById(Long id);
	void delete(Venue venue);
	
}

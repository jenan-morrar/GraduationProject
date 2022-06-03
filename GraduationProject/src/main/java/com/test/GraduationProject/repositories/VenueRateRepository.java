package com.test.GraduationProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.test.GraduationProject.models.VenueRate;

@Repository
public interface VenueRateRepository extends CrudRepository<VenueRate, Long> {
	List<VenueRate> findAll();
}

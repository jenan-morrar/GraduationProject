package com.test.GraduationProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.test.GraduationProject.models.ServiceOfVenue;

@Repository
public interface ServiceRepository extends CrudRepository<ServiceOfVenue, Long> {

	List<ServiceOfVenue>findAll();
	void delete(ServiceOfVenue serviceOfVenue);
}

package com.test.GraduationProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.test.GraduationProject.models.WebsiteRate;

@Repository
public interface WebsiteRateRepository extends CrudRepository<WebsiteRate, Long>  {
	List<WebsiteRate>findAll();
}

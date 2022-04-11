package com.test.GraduationProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.test.GraduationProject.models.Images;

public interface ImageRepository extends CrudRepository<Images, Long> {

	List<Images>findAll();
	void delete(Images iamge);
}

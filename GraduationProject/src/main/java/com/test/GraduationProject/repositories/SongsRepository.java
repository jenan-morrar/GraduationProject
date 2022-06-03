package com.test.GraduationProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.test.GraduationProject.models.UserSongs;

@Repository

public interface SongsRepository extends CrudRepository<UserSongs, Long> {

	List<UserSongs>findAll();
}

package com.test.GraduationProject.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.test.GraduationProject.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {
	User findByUsername(String username);

	User findByEmail(String email);

	List<User> findAll();

	@Query("SELECT u FROM User u JOIN u.roles r WHERE r.name LIKE %?1% OR u.username LIKE %?1% OR u.email LIKE %?1% OR u.mobileNumber LIKE %?1%")
	List<User> getSearchedUser(String username);
}
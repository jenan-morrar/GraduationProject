package com.test.GraduationProject.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.GraduationProject.models.User;
import com.test.GraduationProject.repositories.UserRepository;

@Service
public class SuperAdminService {

	private final UserRepository userRepo;

	public SuperAdminService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}

	public List<User> allUsers() {
		return userRepo.findAll();
	}

	public List<User> getUser(String txt) {
		return userRepo.getSearchedUser(txt);
	}

}

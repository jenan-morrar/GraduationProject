package com.test.GraduationProject.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.test.GraduationProject.models.User;
import com.test.GraduationProject.repositories.RoleRepository;
import com.test.GraduationProject.repositories.UserRepository;

@Service
public class UserService {
	private UserRepository userRepository;
	private RoleRepository roleRepository;
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	public UserService(UserRepository userRepository, RoleRepository roleRepository,
			BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	// 1
	public boolean saveWithUserRole(User user) {
		User userByEmail = findByEmail(user.getEmail());
		if (userByEmail == null) {
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
			user.setRoles(roleRepository.findByName("ROLE_USER"));
			userRepository.save(user);
			return true;
		}
		return false;
	}

	// 2
	public boolean saveUserWithAdminRole(User user) {
		User userByEmail = findByEmail(user.getEmail());
		// User userByName = findByEmail(user.getEmail());
		if (userByEmail == null) {
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
			user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
			userRepository.save(user);
			return true;
		}
		return false;
	}
	

	// 3
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}

	// 4
	public User findByEmail(String email) {
		return userRepository.findByEmail(email);
	}
}
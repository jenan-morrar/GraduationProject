package com.test.GraduationProject.services;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	@Autowired
	private JavaMailSender emailSender;

	public UserService(UserRepository userRepository, RoleRepository roleRepository,
			BCryptPasswordEncoder bCryptPasswordEncoder) {
		this.userRepository = userRepository;
		this.roleRepository = roleRepository;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
	}

	// 1
	public boolean saveWithUserRole(User user) throws MessagingException {
		User userByEmail = findByEmail(user.getEmail());
		if (userByEmail == null) {
			user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
			user.setRoles(roleRepository.findByName("ROLE_USER"));

			String from = "palvenues@gmail.com";
			String to = user.getEmail();

			MimeMessage message = emailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true);

			helper.setSubject("Welcome to PalVenues");
			helper.setFrom(from);
			helper.setTo(to);

			String content = "        <h1>\r\n" + "            PalVenues\r\n" + "        </h1>\r\n"
					+ "        <h1>Welcome to PalVenues!.</h1>\r\n" + "        <h3>\r\n"
					+ "            Now that you’re here, it’s time to search and reserv your suitable Venues in Ramallah</h3>\r\n"
					+ "        <img src='cid:welcomImage'>";
			helper.setText(content, true);

			// FileSystemResource resource = new FileSystemResource(new
			// File("picture.png"));
			ClassPathResource resource = new ClassPathResource("/static/images/welcom.jpg");
			helper.addInline("welcomImage", resource);

			emailSender.send(message);

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

//	// returns all the venues
//	public List<Venue> allVenues() {
//		return venueRepository.findAll();
//	}
//
//	// creates a venue
//	public Venue createVenue(Venue venue) {
//		return venueRepository.save(venue);
//	}
//
//	// retrieves a venue
//	public Venue findVenue(Long id) {
//		Optional<Venue> optionalVenue = venueRepository.findById(id);
//		if (optionalVenue.isPresent()) {
//			return optionalVenue.get();
//		} else {
//			return null;
//		}
//	}
//	
//    // edit a venue 
//    public Venue updateVenue(Long id, String name, String description, String location, float price, Set<ServiceOfVenue> services) {
//    	Venue venue = findVenue(id);
//    	venue.setId(id);
//    	venue.setName(name);
//    	venue.setDescription(description);
//    	venue.setLocation(location);
//		venue.setPrice(price);
//		venue.setServices(services);
//    	return venueRepository.save(venue);
//    }
//    
//    // delete a venue 
//    public void deleteVenue(Long id) {
//    	venueRepository.deleteById(id);
//    }
}
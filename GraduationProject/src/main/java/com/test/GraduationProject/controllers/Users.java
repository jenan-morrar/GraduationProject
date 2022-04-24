package com.test.GraduationProject.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.aspectj.weaver.NewConstructorTypeMunger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.GraduationProject.models.Contact;
import com.test.GraduationProject.models.FilterSearch;
import com.test.GraduationProject.models.Reservation;
import com.test.GraduationProject.models.ServiceOfVenue;
import com.test.GraduationProject.models.User;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.models.WebsiteRate;
import com.test.GraduationProject.services.ReservationService;
import com.test.GraduationProject.services.ServicesOfVenueService;
import com.test.GraduationProject.services.UserService;
import com.test.GraduationProject.services.VenueService;
import com.test.GraduationProject.services.WebsiteRateService;
import com.test.GraduationProject.validator.UserValidator;

@Controller
public class Users {
	private UserService userService;
	private UserValidator userValidator;
	private VenueService venueService;
	private WebsiteRateService websiteRateService;
	private ReservationService reservationService;
	private ServicesOfVenueService ServicesOfVenueService;
	public List<Venue> filterSearchResult1 = new ArrayList<>();
	@Autowired
	private JavaMailSender emailSender;

	public Users(UserService userService, UserValidator userValidator, VenueService venueService,
			WebsiteRateService websiteRateService, ReservationService reservationService,
			ServicesOfVenueService servicesOfVenueService) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.venueService = venueService;
		this.websiteRateService = websiteRateService;
		this.reservationService = reservationService;
		this.ServicesOfVenueService = servicesOfVenueService;
	}

	@RequestMapping("/registration")
	public String registerForm(@Valid @ModelAttribute("user") User user) {
		return "registrationPage.jsp";
	}

	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model,
			HttpSession session) throws MessagingException {
		userValidator.validate(user, result);
		if (result.hasErrors()) {
			return "registrationPage.jsp";
		}
		boolean registration = userService.saveWithUserRole(user);
		// boolean registration = userService.saveUserWithAdminRole(user);
		if (registration == false) {

			model.addAttribute("alreadyExist", "هذا المستخدم موجود! استخدم ايميل آخر");
			return "registrationPage.jsp";
		}
		return "redirect:/login";
	}

	@RequestMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("errorMessage", "كلمة المرور أو الايميل خطأ ! الرجاء إعادة المحاولة");
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful!");
		}
		return "loginPage.jsp";
	}

	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByEmail(username));
		return "adminVenuePage.jsp";
	}

	@RequestMapping("/superAdmin")
	public String superAdminPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userService.findByEmail(username));
		return "superAdminPage.jsp";
	}

	@RequestMapping(value = { "/", "/index" })
	public String home(Principal principal, Model model) {
		model.addAttribute("userWebsiteRate", new WebsiteRate());
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}
		return "index.jsp";
	}

	@PostMapping("/index")
	public String creatUserRate(@Valid @ModelAttribute("userWebsiteRate") WebsiteRate userWebsiteRate,
			BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "index.jsp";
		} else {
			websiteRateService.createWebsiteRate(userWebsiteRate);
			return "redirect:/index";
		}
	}

	@RequestMapping("/aboutPage")
	public String aboutPage(Principal principal, Model model) {
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}
		return "aboutPage.jsp";
	}

	@RequestMapping("/cartPage")
	public String cartPage(Principal principal, Model model) {
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}
		return "cartPage.jsp";
	}

	@RequestMapping("/contactPage")
	public String contactForm(Principal principal, Model model) {
		model.addAttribute("contact", new Contact());
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}
		return "contactPage.jsp";
	}

	// Still there is some issues !!!!!!
	@RequestMapping(value = "/contactPage", method = RequestMethod.POST)
	public String contactPage(Model model, @Valid @ModelAttribute("contact") Contact contact, BindingResult result)
			throws MessagingException {

		if (result.hasErrors()) {
			return "contactPage.jsp";
		} else {

			contact.setEmailReciver("palvenues@gmail.com");
			SimpleMailMessage message = new SimpleMailMessage();
			message.setFrom(contact.getEmailSender());
			message.setTo(contact.getEmailReciver());
			message.setSubject(contact.getSubject());
			message.setText(contact.getMessage());
			emailSender.send(message);

			return "redirect:/contactPage";
		}
	}

	@RequestMapping("/songsPage")
	public String songsPage(Principal principal, Model model) {
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}
		return "songsPage.jsp";
	}

	@RequestMapping("/venuePage/{id}")
	public String venuePage(@PathVariable("id") long id, Principal principal, Model model,
			RedirectAttributes redirectAttrs) {
		Venue venuePage = venueService.findVenue(id);
		model.addAttribute("reservation", new Reservation());
		model.addAttribute("venuePage", venuePage);
		redirectAttrs.addAttribute("venuePage", venuePage);
		List<Reservation> reservations = reservationService.allReservation();
		List<Reservation> reservationsForVenue = new ArrayList<>();
		
		for(int i=0;i<reservations.size();i++) {
			if(reservations.get(i).getVenue().getId()==id) {
				reservationsForVenue.add(reservations.get(i));
			}
		}
		
		model.addAttribute("reservationResult", reservationsForVenue);
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}
		return "venuePage.jsp";
	}

	@RequestMapping(value = "/venuePage/{id}", method = RequestMethod.POST)
	public String reserveVenue(Model model, @PathVariable("id") long id, Principal principal,
			@Valid @ModelAttribute("reservation") Reservation reservation, BindingResult result)
			throws MessagingException {
//		if (result.hasErrors()) {
//			return "venuePage.jsp";
//		} else {
		long sid = 2;
		ServiceOfVenue service = ServicesOfVenueService.findService(sid);
		List<ServiceOfVenue> servicesList = new ArrayList<>();
		servicesList.add(service);
		String username = principal.getName();
		User user = userService.findByEmail(username);
		Venue venue = venueService.findVenue(id);
		reservation.setUser(user);
		reservation.setVenue(venue);
		reservation.setStatus("pending");
		reservation.setServices(servicesList);
//		System.out.println(reservation.getStartTime());
//		System.out.println(reservation.getEndTime());
		reservation.setFromTime(java.sql.Time.valueOf(reservation.getStartTime() + ":00"));
		reservation.setToTime(java.sql.Time.valueOf(reservation.getEndTime() + ":00"));
		reservation.setId(null);
//		System.out.println(reservation.getFromTime());
//		System.out.println(reservation.getToTime());
//		System.out.println(reservation.getReservationDate());
		reservationService.createReservation(reservation);

		// Create the Expiration Date
		Calendar calExpirationDate = Calendar.getInstance();
		calExpirationDate.setTime(reservation.getCreatedAt());
		calExpirationDate.add(Calendar.DAY_OF_MONTH, 2);
		reservation.setExpirationDate(calExpirationDate.getTime());

		reservationService.updatereservation(reservation.getId(), reservation.getReservationDate(),
				reservation.getFromTime(), reservation.getToTime(), reservation.getStatus(),
				reservation.getExpirationDate(), reservation.getVenue(), reservation.getUser());

		return "redirect:/venuePage/{id}";
//		}
	}

	@RequestMapping("/venues")
	public String venues(Principal principal, Model model) {
		List<Venue> venues = venueService.allVenues();
		model.addAttribute("filterSearch", new FilterSearch());
//		System.out.println(filterSearchResult1.size() + "heloo");
		model.addAttribute("filterSearchResult1", filterSearchResult1);
		model.addAttribute("venues", venues);
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}
		return "venues.jsp";
	}

	// Still it needs an updates
	@RequestMapping(value = "/venues", method = RequestMethod.POST)
	public String venuesFilterSearch(Model model, @Valid @ModelAttribute("filterSearch") FilterSearch filterSearch,
			BindingResult result) throws MessagingException {
		if (result.hasErrors()) {
			return "venues.jsp";
		} else {

			List<Venue> filterSarchResult = venueService.filterSearch(filterSearch.getLocation(),
					filterSearch.getMinPrice(), filterSearch.getMaxPrice(), filterSearch.getMinNumOfGuests(),
					filterSearch.getMaxNumOfGuests());
			filterSearchResult1 = venueService.filterSearch(filterSearch.getLocation(), filterSearch.getMinPrice(),
					filterSearch.getMaxPrice(), filterSearch.getMinNumOfGuests(), filterSearch.getMaxNumOfGuests());
//			System.out.println(filterSearchResult1.size());
			model.addAttribute("filterSearchResult1", filterSearchResult1);
			model.addAttribute("filterSarchResult", filterSarchResult);
//			for (int i = 0; i < filterSarchResult.size(); i++) {
//				System.out.println(filterSarchResult.get(i).getId());
//			}
			return "redirect:/venues";
		}
	}

	@RequestMapping("/adminVenuePage/{id}")
	public String adminVenuePage(Principal principal, Model model) {
		List<Reservation> reservations = reservationService.allReservation();
		model.addAttribute("reservationResult", reservations);
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);

			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}

		} else {
			model.addAttribute("currentUser", "noUser");
		}
		return "adminVenuePage.jsp";
	}
}
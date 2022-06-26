package com.test.GraduationProject.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
import com.test.GraduationProject.models.Search;
import com.test.GraduationProject.models.ServiceOfVenue;
import com.test.GraduationProject.models.User;
import com.test.GraduationProject.models.UserSongs;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.models.VenueRate;
import com.test.GraduationProject.models.WebsiteRate;
import com.test.GraduationProject.services.ReservationService;
import com.test.GraduationProject.services.ServicesOfVenueService;
import com.test.GraduationProject.services.SongsService;
import com.test.GraduationProject.services.UserService;
import com.test.GraduationProject.services.VenueRateService;
import com.test.GraduationProject.services.VenueService;
import com.test.GraduationProject.services.WebsiteRateService;
import com.test.GraduationProject.validator.UserValidator;

@Controller
public class Users {
	private UserService userService;
	private UserValidator userValidator;
	private VenueService venueService;
	private WebsiteRateService websiteRateService;
	private VenueRateService venueRateService;
	private ReservationService reservationService;
	private ServicesOfVenueService ServicesOfVenueService;
	private SongsService songsService;
	public List<WebsiteRate> websiteRateResult = new ArrayList<>();
	public List<Venue> filterSearchResult = new ArrayList<>();

	@Autowired
	private JavaMailSender emailSender;

	public Users(UserService userService, UserValidator userValidator, VenueService venueService,
			WebsiteRateService websiteRateService, ReservationService reservationService,
			ServicesOfVenueService servicesOfVenueService, VenueRateService venueRateService,
			SongsService songsService) {
		this.userService = userService;
		this.userValidator = userValidator;
		this.venueService = venueService;
		this.websiteRateService = websiteRateService;
		this.reservationService = reservationService;
		this.ServicesOfVenueService = servicesOfVenueService;
		this.venueRateService = venueRateService;
		this.songsService = songsService;
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
		model.addAttribute("search", new Search());
		model.addAttribute("userWebsiteRate", new WebsiteRate());
		List<WebsiteRate> allwebsiteRate = websiteRateService.allWebsiteRates();
		List<WebsiteRate> firstWebsiteRate = new ArrayList<>();

		if (allwebsiteRate.size() >= 3) {
			for (int i = 0; i < 3; i++) {
				firstWebsiteRate.add(allwebsiteRate.get(i));
			}
			websiteRateResult = firstWebsiteRate;
			model.addAttribute("websiteRateResult", websiteRateResult);

		} else {
			model.addAttribute("websiteRateResult", allwebsiteRate);
		}
		List<Venue> mostReservedVenues = venueService.mostReservedVenues();
		model.addAttribute("mostReservedVenues", mostReservedVenues);

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

	@PostMapping("/index/search/")
	public String indexSearch(@Valid @ModelAttribute("search") Search search, BindingResult result, Model model,
			RedirectAttributes redirectAttrs) {
		if (result.hasErrors()) {
			return "index.jsp";
		} else {
			filterSearchResult = venueService.venueSearch(search.getVenueName());
			model.addAttribute("filterSearchResult", filterSearchResult);
			// redirectAttrs.addAttribute("filterSearchResult", filterSearchResult);
			return "redirect:/venues";
		}
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

	// show cart page for logged in user
	@RequestMapping("/cartPage")
	public String cart(Model model, Principal principal, @ModelAttribute("reservation") Reservation reservation) {
		if (principal != null) {
			String username = principal.getName();
			long userId = userService.findByEmail(username).getId();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			// User user = userService.finduserById(userId);
			List<Reservation> reservations = reservationService.getUserReservation(userId);
			model.addAttribute("reservations", reservations);
			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}

		return "/cart/cartPage.jsp";
	}

	// edit reservation on edit page
	@RequestMapping(value = "/reservation/{id}/{venueId}", method = RequestMethod.PUT)
	public String update(@PathVariable("id") Long id,@PathVariable("venueId") Long venueId, @Valid @ModelAttribute("reservation") Reservation reservation,
			BindingResult result, Principal principal, RedirectAttributes rattrs) {
		/*
		 * if (result.hasErrors()) { return "editReservationPage.jsp"; } else {
		 * reservationService.update(reservation); return
		 * "redirect:/reservation/{id}/edit"; }
		 */

		// reservation.setServices(servicesList);
		Reservation currentReservation = reservationService.findReservation(id);

		reservation.setFromTime(java.sql.Time.valueOf(reservation.getStartTime() + ":00"));
		reservation.setToTime(java.sql.Time.valueOf(reservation.getEndTime() + ":00"));

		// Check Conflicts
		List<Reservation> allReseravtions = reservationService.allReservation();
		List<Reservation> reservationForVenue = new ArrayList<>();

		if (allReseravtions.size() != 0) {
			for (int i = 0; i < allReseravtions.size(); i++) {
				if (allReseravtions.get(i).getVenue().getId() == currentReservation.getVenue().getId()) {
					reservationForVenue.add(allReseravtions.get(i));
				}
			}
		}

		if (reservationForVenue.size() != 0) {

			boolean hasTheSameDate = false;
			boolean hasTheSameTime = false;

			for (int i = 0; i < reservationForVenue.size(); i++) {
				int resultOfConflictDay = reservation.getReservationDate()
						.compareTo(reservationForVenue.get(i).getReservationDate());
				if (resultOfConflictDay == 0) {
					hasTheSameDate = true;
					break;
				} else {
					hasTheSameDate = false;
				}
			}

			if (hasTheSameDate) {
				System.out.println("same Date");
				for (int i = 0; i < reservationForVenue.size(); i++) {
					int resultOfConflictDay = reservation.getReservationDate()
							.compareTo(reservationForVenue.get(i).getReservationDate());
					if (resultOfConflictDay == 0) {
						System.out.println(reservation.getToTime());
						System.out.println(reservationForVenue.get(i).getFromTime());
						System.out.println(reservation.getFromTime());
						System.out.println(reservationForVenue.get(i).getToTime());
						if (reservation.getToTime().after(reservationForVenue.get(i).getFromTime())
								&& reservation.getFromTime().before(reservationForVenue.get(i).getToTime())) {
							System.out.println("same time, Try again!");
							rattrs.addAttribute("conflictTime", "conflictTime");
							hasTheSameTime = true;
							break;
						} else {
						}
					}
				}
				if (!hasTheSameTime) {
					hasTheSameTime = false;
					System.out.println("you can reserve!");

					if (!reservation.getToTime().before(reservation.getFromTime())
							&& !(reservation.getToTime().compareTo(reservation.getFromTime()) == 0)) {

						rattrs.addAttribute("conflictTime", "noConflictTime");
						rattrs.addAttribute("toTimeAfterFromTime", "toTimeAfterFromTime");

						// reservationService.update(currentReservation);

						reservationService.editReservation(currentReservation.getId(), reservation.getReservationDate(),
								reservation.getFromTime(), reservation.getToTime(), currentReservation.getStatus(),
								currentReservation.getExpirationDate(), currentReservation.getVenue(),
								currentReservation.getUser(), reservation.getServices());
					} else {
						System.out.println("to time should be after from time");
						rattrs.addAttribute("toTimeAfterFromTime", "noToTimeAfterFromTime");
					}
				}

			} else {
				if (!reservation.getToTime().before(reservation.getFromTime())
						&& !(reservation.getToTime().compareTo(reservation.getFromTime()) == 0)) {

					System.out.println("created correctly not same date!");
					rattrs.addAttribute("conflictTime", "noConflictTime");
					rattrs.addAttribute("toTimeAfterFromTime", "toTimeAfterFromTime");

					// reservationService.update(currentReservation);
					reservationService.editReservation(currentReservation.getId(), reservation.getReservationDate(),
							reservation.getFromTime(), reservation.getToTime(), currentReservation.getStatus(),
							currentReservation.getExpirationDate(), currentReservation.getVenue(),
							currentReservation.getUser(), reservation.getServices());
				} else {
					System.out.println("to time should be after from time");
					rattrs.addAttribute("toTimeAfterFromTime", "noToTimeAfterFromTime");
				}
			}
		} else {
			if (!reservation.getToTime().before(reservation.getFromTime())
					&& !(reservation.getToTime().compareTo(reservation.getFromTime()) == 0)) {

				System.out.println("created correctly there is no reservation!");
				rattrs.addAttribute("conflictTime", "noConflictTime");
				rattrs.addAttribute("toTimeAfterFromTime", "toTimeAfterFromTime");
				currentReservation.setToTime(reservation.getToTime());
				currentReservation.setFromTime(reservation.getFromTime());
				currentReservation.setServices(reservation.getServices());

				// reservationService.update(currentReservation);

				reservationService.editReservation(currentReservation.getId(), reservation.getReservationDate(),
						reservation.getFromTime(), reservation.getToTime(), currentReservation.getStatus(),
						currentReservation.getExpirationDate(), currentReservation.getVenue(),
						currentReservation.getUser(), reservation.getServices());

			} else {
				System.out.println("to time should be after from time");
				rattrs.addAttribute("toTimeAfterFromTime", "noToTimeAfterFromTime");
			}
		}
		

		return "redirect:/venuePage/{venueId}/#VenueReservatio";
	}

	// get edit page
	@RequestMapping("/reservation/{id}/edit/{venueId}")
	public String editReservation(@PathVariable("id") Long id,@PathVariable("venueId") Long venueId, Principal principal, Model model,
			RedirectAttributes redirectAttrs, @ModelAttribute("toTimeAfterFromTime") String toTimeAfterFromTime,
			@ModelAttribute("conflictTime") String conflictTime) {
		Reservation reservation = reservationService.findReservation(id);
		model.addAttribute("reservation", reservation);
		model.addAttribute("toTimeAfterFromTime", toTimeAfterFromTime);
		model.addAttribute("conflictTime", conflictTime);

		Venue venuePage = reservation.getVenue(); 
		model.addAttribute("reservation", new Reservation());
		model.addAttribute("venuePage", venuePage);
		model.addAttribute("venueRate", new VenueRate());
		redirectAttrs.addAttribute("venuePage", venuePage);
		
	
		
		// Venue Services
		List<Reservation> reservations = reservationService.allReservation();
		List<Reservation> reservationsForVenue = new ArrayList<>();

		for (int i = 0; i < reservations.size(); i++) {
			if (reservations.get(i).getVenue().getId() == venuePage.getId()) {
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
		model.addAttribute("reservationId", id);

		return "editReservationPage.jsp";
	}

	// send cancel email
	@RequestMapping("/sendEmail/{id}")
	public void sendEmail(@PathVariable("id") Long id, Principal principal,
			@ModelAttribute("reservation") Reservation reservation, HttpServletResponse response)
			throws MessagingException {
		try {
			if (principal != null) {
				String username = principal.getName();
				long userId = userService.findByEmail(username).getId();
				User user = userService.finduserById(userId);
				Reservation reservationRequestedDelete = reservationService.findReservation(id);
				String sentCode = reservationRequestedDelete.getDeleteCode();
				reservationService.sendCode(user, sentCode);
			}

			response.setContentType("text/plain");
			// String json = "{\"Name\": 50}";
			PrintWriter out = response.getWriter();
			out.print("Hello");
		} catch (IOException e) {

		}

		// return "redirect:/cartPage";
	}

	// compare between the sent code and input code
	@PostMapping("/reservation/delete")
	public ResponseEntity deleteReservation(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("text/plain;charset=UTF-8");
		String code = request.getParameter("code_input");

		if (code.isEmpty()) {
			return ResponseEntity.status(HttpServletResponse.SC_BAD_REQUEST).body("الكود اجباري");
		} else {
			long reservationId = Long.parseLong(request.getParameter("reservation_id"));
			Reservation reservation = reservationService.findReservation(reservationId);
			if (reservation.getDeleteCode().equals(code)) {
				reservationService.deleteReservation(reservationId);
				return ResponseEntity.status(HttpServletResponse.SC_ACCEPTED).body("تم حذف الحجز بنجاح");
			} else {
				return ResponseEntity.status(HttpServletResponse.SC_BAD_REQUEST).body("الكود خاطىء");
			}

		}
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

			contact.setEmailReciver("palvenues@outlook.com");
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
	public String songsPage(Principal principal, Model model, @ModelAttribute("userSongs") UserSongs userSongs) {
		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);
			List<Reservation> userReservations = userService.findByEmail(username).getReservations();
			model.addAttribute("userReservations", userReservations);

			if (userRole.equals("ROLE_ADMIN")) {
				Venue venue = userService.findByEmail(username).getVenue();
				model.addAttribute("venue", venue);
				model.addAttribute("venueId", venue.getId());
				model.addAttribute("serviceExist", "no");
			}

		} else {
			model.addAttribute("currentUser", "noUser");
		}
		// System.out.println(userSongs.getSongs());
		return "songsPage.jsp";
	}

	@RequestMapping(value = "/songsPage", method = RequestMethod.POST)
	public String createUserSongs(Principal principal, Model model, @ModelAttribute("userSongs") UserSongs userSongs) {
		if (principal != null) {
			String username = principal.getName();
			User user = userService.findByEmail(username);
			List<Reservation> userReservations = user.getReservations();
			model.addAttribute("userReservations", userReservations);
//			if(userSongs.getReservation() != null) {
//				System.out.println(userSongs.getReservation().getId());
//				System.out.println(userSongs);
//			//reservationService.findReservation(userSongs.getReservation().getId()).setUserSongs(userSongs);
//			//userSongs.setReservation(userSongs.getReservation());
//			}
			userSongs.setUserSongs(user);
			songsService.createUserSongs(userSongs);
			reservationService.updatereservation2(userSongs.getReservation().getId(), userSongs);
		}
		return "redirect:/songsPage";
	}

	@RequestMapping("/venuePage/{id}")
	public String venuePage(@PathVariable("id") long id, Principal principal, Model model,
			RedirectAttributes redirectAttrs, @ModelAttribute("toTimeAfterFromTime") String toTimeAfterFromTime,
			@ModelAttribute("conflictTime") String conflictTime) {

		model.addAttribute("toTimeAfterFromTime", toTimeAfterFromTime);
		model.addAttribute("conflictTime", conflictTime);

		Venue venuePage = venueService.findVenue(id);
		model.addAttribute("reservation", new Reservation());
		model.addAttribute("venuePage", venuePage);
		model.addAttribute("venueRate", new VenueRate());
		redirectAttrs.addAttribute("venuePage", venuePage);

		// get recommended venues
		List<Venue> recommendedVenues = venueService.getRecommendedVenues(id);
		model.addAttribute("recommendedVenues", recommendedVenues);
		System.out.println(recommendedVenues);

		// Venue Services
		List<Reservation> reservations = reservationService.allReservation();
		List<Reservation> reservationsForVenue = new ArrayList<>();

		for (int i = 0; i < reservations.size(); i++) {
			if (reservations.get(i).getVenue().getId() == id) {
				reservationsForVenue.add(reservations.get(i));
			}
		}

		model.addAttribute("reservationResult", reservationsForVenue);

		// Venue Rating Data
		List<VenueRate> ratings = venueRateService.allVenueRates();
		List<VenueRate> ratingsForVenue = new ArrayList<>();

		// to calculate venue rating
		int venueRating = 0;
		int count = 0;
		int ratingSum = 0;

		for (int i = 0; i < ratings.size(); i++) {
			if (ratings.get(i).getVenue().getId() == id) {
				ratingsForVenue.add(ratings.get(i));
				ratingSum += ratings.get(i).getRating();
				count++;
			}
		}

		if (ratingsForVenue.size() > 0) {
			venueRating = ratingSum / count;
		}
		model.addAttribute("venueRatingsResult", ratingsForVenue);
		model.addAttribute("venueRatingValue", venueRating);

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
			@Valid @ModelAttribute("reservation") Reservation reservation, BindingResult result,
			RedirectAttributes rattrs) throws MessagingException {
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
		// reservation.setServices(servicesList);

		reservation.setFromTime(java.sql.Time.valueOf(reservation.getStartTime() + ":00"));
		reservation.setToTime(java.sql.Time.valueOf(reservation.getEndTime() + ":00"));
		reservation.setId(null);

		// Check Conflicts
		List<Reservation> allReseravtions = reservationService.allReservation();
		List<Reservation> reservationForVenue = new ArrayList<>();

		if (allReseravtions.size() != 0) {
			for (int i = 0; i < allReseravtions.size(); i++) {
				if (allReseravtions.get(i).getVenue().getId() == id) {
					reservationForVenue.add(allReseravtions.get(i));
				}
			}
		}

		if (reservationForVenue.size() != 0) {

			boolean hasTheSameDate = false;
			boolean hasTheSameTime = false;

			for (int i = 0; i < reservationForVenue.size(); i++) {
				int resultOfConflictDay = reservation.getReservationDate()
						.compareTo(reservationForVenue.get(i).getReservationDate());
				if (resultOfConflictDay == 0) {
					hasTheSameDate = true;
					break;
				} else {
					hasTheSameDate = false;
				}
			}

			if (hasTheSameDate) {
				System.out.println("same Date");
				for (int i = 0; i < reservationForVenue.size(); i++) {
					int resultOfConflictDay = reservation.getReservationDate()
							.compareTo(reservationForVenue.get(i).getReservationDate());
					if (resultOfConflictDay == 0) {
						System.out.println(reservation.getToTime());
						System.out.println(reservationForVenue.get(i).getFromTime());
						System.out.println(reservation.getFromTime());
						System.out.println(reservationForVenue.get(i).getToTime());
						if (reservation.getToTime().after(reservationForVenue.get(i).getFromTime())
								&& reservation.getFromTime().before(reservationForVenue.get(i).getToTime())) {
							System.out.println("same time, Try again!");
							rattrs.addAttribute("conflictTime", "conflictTime");
							hasTheSameTime = true;
							break;
						} else {
						}
					}
				}
				if (!hasTheSameTime) {
					hasTheSameTime = false;
					System.out.println("you can reserve!");

					if (!reservation.getToTime().before(reservation.getFromTime())
							&& !(reservation.getToTime().compareTo(reservation.getFromTime()) == 0)) {

						rattrs.addAttribute("conflictTime", "noConflictTime");
						rattrs.addAttribute("toTimeAfterFromTime", "toTimeAfterFromTime");

						// set code
						String code = reservationService.getAlphaNumericString(6);
						if (code == null) {
							code = "wK99ke";
						}
						reservation.setDeleteCode(code);

						reservationService.createReservation(reservation);
						// Create the Expiration Date
						Calendar calExpirationDate = Calendar.getInstance();
						calExpirationDate.setTime(reservation.getCreatedAt());
						calExpirationDate.add(Calendar.DAY_OF_MONTH, 2);
						reservation.setExpirationDate(calExpirationDate.getTime());

						reservationService.updatereservation(reservation.getId(), reservation.getReservationDate(),
								reservation.getFromTime(), reservation.getToTime(), reservation.getStatus(),
								reservation.getExpirationDate(), reservation.getVenue(), reservation.getUser());
					} else {
						System.out.println("to time should be after from time");
						rattrs.addAttribute("toTimeAfterFromTime", "noToTimeAfterFromTime");
					}
				}

			} else {
				if (!reservation.getToTime().before(reservation.getFromTime())
						&& !(reservation.getToTime().compareTo(reservation.getFromTime()) == 0)) {

					System.out.println("created correctly not same date!");
					rattrs.addAttribute("conflictTime", "noConflictTime");
					rattrs.addAttribute("toTimeAfterFromTime", "toTimeAfterFromTime");

					// set code
					String code = reservationService.getAlphaNumericString(6);
					if (code == null) {
						code = "wK99ke";
					}
					reservation.setDeleteCode(code);

					reservationService.createReservation(reservation);
					// Create the Expiration Date
					Calendar calExpirationDate = Calendar.getInstance();
					calExpirationDate.setTime(reservation.getCreatedAt());
					calExpirationDate.add(Calendar.DAY_OF_MONTH, 2);
					reservation.setExpirationDate(calExpirationDate.getTime());

					reservationService.updatereservation(reservation.getId(), reservation.getReservationDate(),
							reservation.getFromTime(), reservation.getToTime(), reservation.getStatus(),
							reservation.getExpirationDate(), reservation.getVenue(), reservation.getUser());
				} else {
					System.out.println("to time should be after from time");
					rattrs.addAttribute("toTimeAfterFromTime", "noToTimeAfterFromTime");
				}
			}
		} else {
			if (!reservation.getToTime().before(reservation.getFromTime())
					&& !(reservation.getToTime().compareTo(reservation.getFromTime()) == 0)) {

				System.out.println("created correctly there is no reservation!");
				rattrs.addAttribute("conflictTime", "noConflictTime");
				rattrs.addAttribute("toTimeAfterFromTime", "toTimeAfterFromTime");

				// set code
				String code = reservationService.getAlphaNumericString(6);
				if (code == null) {
					code = "wK99ke";
				}
				reservation.setDeleteCode(code);

				reservationService.createReservation(reservation);
				// Create the Expiration Date
				Calendar calExpirationDate = Calendar.getInstance();
				calExpirationDate.setTime(reservation.getCreatedAt());
				calExpirationDate.add(Calendar.DAY_OF_MONTH, 2);
				reservation.setExpirationDate(calExpirationDate.getTime());

				reservationService.updatereservation(reservation.getId(), reservation.getReservationDate(),
						reservation.getFromTime(), reservation.getToTime(), reservation.getStatus(),
						reservation.getExpirationDate(), reservation.getVenue(), reservation.getUser());
			} else {
				System.out.println("to time should be after from time");
				rattrs.addAttribute("toTimeAfterFromTime", "noToTimeAfterFromTime");
			}
		}

		return "redirect:/venuePage/{id}/#VenueReservatio";
	}

	@RequestMapping(value = "/venuePage/{id}/rating", method = RequestMethod.POST)
	public String venueRating(@PathVariable("id") long id, @ModelAttribute("venueRate") VenueRate venueRate,
			Model model) {
		Venue venue = venueService.findVenue(id);
		venueRate.setVenue(venue);
		// venueRate.setRating(5);
		venueRateService.createVenueRate(venueRate);
		return "redirect:/venuePage/{id}";
	}

	@RequestMapping("/venuePage/{id}/error")
	public String venuePageError(@PathVariable("id") long id, Principal principal, Model model,
			RedirectAttributes redirectAttrs) {
		Venue venuePage = venueService.findVenue(id);
		model.addAttribute("reservation", new Reservation());
		model.addAttribute("venuePage", venuePage);
		redirectAttrs.addAttribute("venuePage", venuePage);
		List<Reservation> reservations = reservationService.allReservation();
		List<Reservation> reservationsForVenue = new ArrayList<>();

		for (int i = 0; i < reservations.size(); i++) {
			if (reservations.get(i).getVenue().getId() == id) {
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

	@RequestMapping("/venues")
	public String venues(Principal principal, Model model) {

		List<Venue> venues = venueService.allVenues();
		model.addAttribute("filterSearch", new FilterSearch());
		model.addAttribute("filterSearchResult", filterSearchResult);

		// model.addAttribute("filterSearchResult", filterSearchResult);

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

	@RequestMapping("/venues/allVenues")
	public String allVenues(Principal principal, Model model) {
		// for form model attribute
		model.addAttribute("filterSearch", new FilterSearch());
		List<Venue> venues = venueService.allVenues();
		model.addAttribute("filterSearchResult", new ArrayList<>());
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
			BindingResult result, RedirectAttributes redirectAttrs) throws MessagingException {
		if (result.hasErrors()) {
			return "venues.jsp";
		} else {

			filterSearchResult = venueService.filterSearch(filterSearch.getLocation(), filterSearch.getMinPrice(),
					filterSearch.getMaxPrice(), filterSearch.getMinNumOfGuests(), filterSearch.getMaxNumOfGuests());
//			redirectAttrs.addAttribute("filterSearchResult", filterSearchResult);
			model.addAttribute("filterSearchResult", filterSearchResult);

			return "redirect:/venues";
		}
	}

	@RequestMapping("/adminVenuePage/{id}")
	public String adminVenuePage(@PathVariable("id") long id, Principal principal, Model model) {
//		List<Reservation> reservations = reservationService.allReservation();
//		model.addAttribute("reservationResult", reservations);
		// Reservations data
		List<Reservation> reservations = reservationService.allReservation();
		List<Reservation> reservationsForVenue = new ArrayList<>();

		for (int i = 0; i < reservations.size(); i++) {
			if (reservations.get(i).getVenue().getId() == id) {
				reservationsForVenue.add(reservations.get(i));
			}
		}
		model.addAttribute("reservationResult", reservationsForVenue);

		// Venue Rating Data
		List<VenueRate> ratings = venueRateService.allVenueRates();
		List<VenueRate> ratingsForVenue = new ArrayList<>();

		// to calculate venue rating
		int venueRating = 0;
		int count = 0;
		int ratingSum = 0;

		for (int i = 0; i < ratings.size(); i++) {
			if (ratings.get(i).getVenue().getId() == id) {
				ratingsForVenue.add(ratings.get(i));
				ratingSum += ratings.get(i).getRating();
				count++;
			}
		}

		if (ratingsForVenue.size() > 0) {
			venueRating = ratingSum / count;
		}
		model.addAttribute("venueRatingsResult", ratingsForVenue);
		model.addAttribute("venueRatingValue", venueRating);

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

	@RequestMapping("/adminVenuePage/{id}/requests")
	public String adminVenuePageRequests(@PathVariable("id") long id, Principal principal, Model model) {

		List<Reservation> reservations = reservationService.allReservation();
		List<Reservation> reservationsForVenue = new ArrayList<>();

		for (int i = 0; i < reservations.size(); i++) {
			if (reservations.get(i).getVenue().getId() == id && reservations.get(i).getStatus().equals("pending")) {
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
		return "reservationsRequests.jsp";
	}

}

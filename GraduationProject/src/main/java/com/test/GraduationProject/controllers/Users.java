package com.test.GraduationProject.controllers;

import java.security.Principal;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.GraduationProject.models.User;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.services.UserService;
import com.test.GraduationProject.validator.UserValidator;

@Controller
public class Users {
	private UserService userService;
	private UserValidator userValidator;

	public Users(UserService userService, UserValidator userValidator) {
		this.userService = userService;
		this.userValidator = userValidator;
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
			model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
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
	public String contactPage(Principal principal, Model model) {
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

	@RequestMapping("/venuePage")
	public String venuePage(Principal principal, Model model) {
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

	@RequestMapping("/adminVenuePage/{id}")
	public String adminVenuePage(Principal principal, Model model) {
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
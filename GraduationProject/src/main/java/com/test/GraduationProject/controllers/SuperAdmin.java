package com.test.GraduationProject.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.test.GraduationProject.models.User;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.services.SuperAdminService;
import com.test.GraduationProject.services.UserService;
import com.test.GraduationProject.services.VenueService;

@Controller
@RequestMapping("/superAdmin")
public class SuperAdmin {

	private VenueService venueService;
	private SuperAdminService superAdminService;
	private UserService userService;

	public SuperAdmin(VenueService venueService, SuperAdminService superAdminService, UserService userService) {
		this.venueService = venueService;
		this.superAdminService = superAdminService;
		this.userService = userService;

	}

	// Show All the Venues
	@RequestMapping("/venues")
	public String index(Model model) {
		List<Venue> venues = venueService.allVenues();
		model.addAttribute("venues", venues);
		return "/venues/index.jsp";
	}

	// Create Venue
//	@RequestMapping(value = "/venues", method = RequestMethod.POST)
//	public String create(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
//		if (result.hasErrors()) {
//			return "/venues/new.jsp";
//		} else {
//			venueService.createVenue(venue);
//			return "redirect:/venues";
//		}
//	}

	/*
	 * @RequestMapping("/venues/new") public String
	 * newVenue(@ModelAttribute("venue") Venue venue) { return "/venues/new.jsp"; }
	 */

	// Retrieve specific venue
	@RequestMapping("/venues/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		return "/venues/show.jsp";
	}

	// Delete venue
	@RequestMapping(value = "/venues/{id}", method = RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		venueService.deleteVenue(id);
		return "redirect:/venues";
	}

	// return all users to superAdmin
	@RequestMapping("/users")
	public String getAllUsers(@ModelAttribute("venue") Venue venue, Model model) {
		List<User> allUsers = superAdminService.allUsers();
		model.addAttribute("allUsers", allUsers);
		return "/superAdmin/allUsersTable.jsp";
	}

	// filterSearch for users
	@RequestMapping("/users/search")
	public String userSearch(@RequestParam(value = "freeText", required = false) String freeText, Model model,
			@ModelAttribute("venue") Venue venue) {
		List<User> allUsers = superAdminService.getUser(freeText);
		model.addAttribute("allUsers", allUsers);
		return "/superAdmin/allUsersTable.jsp";
	}

	@GetMapping("/venues/add")
	public String assignedVenue(@ModelAttribute("venue") Venue venue) {
		return "/superAdmin/allUsersTable.jsp";
	}

	// add new venue to be assigned for the user
	@PostMapping(value = "/venues/add")
	public String createVenue(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
		if (result.hasErrors()) {
			return "/superAdmin/allUsersTable.jsp";
		} else {
			venueService.createVenue(venue);
			for (Venue v : venueService.allVenues()) {
				User user = v.getUser();

				userService.updateUser(user);
			}
			return "redirect:/superAdmin/users";
		}
	}
	// delete a user 
	 @RequestMapping(value="/{id}/delete", method=RequestMethod.DELETE)
	    public String deleteUser(@PathVariable("id") Long id) {
	        superAdminService.deleteUser(id); 
	        return "redirect:/superAdmin/users";
	    }

}

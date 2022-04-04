package com.test.GraduationProject.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.services.VenueService;

@Controller
public class SuperAdmin {

	private VenueService venueService;

	public SuperAdmin(VenueService venueService) {
		this.venueService = venueService;
	}
	
	// Show All the Venues
	@RequestMapping("/superAdmin/venues")
	public String index(Model model) {
		List<Venue> venues = venueService.allVenues();
		model.addAttribute("venues", venues);
		return "/venues/index.jsp";
	}
	
	// Create Venue
	@RequestMapping(value = "/superAdmin/venues", method = RequestMethod.POST)
	public String create(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
		if (result.hasErrors()) {
			return "/venues/new.jsp";
		} else {
			venueService.createVenue(venue);
			return "redirect:/superAdmin/venues";
		}
	}
	
	@RequestMapping("/superAdmin/venues/new")
	public String newVenue(@ModelAttribute("venue") Venue venue) {
		return "/venues/new.jsp";
	}
	
	// Retrieve specific venue
	@RequestMapping("/superAdmin/venues/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		return "/venues/show.jsp";
	}
	
	// Delete venue
	@RequestMapping(value = "/superAdmin/venues/{id}", method = RequestMethod.DELETE)
	public String destroy(@PathVariable("id") Long id) {
		venueService.deleteVenue(id);
		return "redirect:/superAdmin/venues";
	}
}

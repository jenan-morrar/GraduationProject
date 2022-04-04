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
public class Admins {

	private VenueService venueService;

	public Admins(VenueService venueService) {
		this.venueService = venueService;
	}

//	@RequestMapping("/admin/venues")
//	public String index(Model model) {
//		List<Venue> venues = venueService.allVenues();
//		model.addAttribute("venues", venues);
//		return "/venues/index.jsp";
//	}
	
//	@RequestMapping("/admin/venues/new")
//	public String newVenue(@ModelAttribute("venue") Venue venue) {
//		return "/venues/new.jsp";
//	}

//	@RequestMapping(value = "/admin/venues", method = RequestMethod.POST)
//	public String create(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
//		if (result.hasErrors()) {
//			return "/venues/new.jsp";
//		} else {
//			venueService.createVenue(venue);
//			return "redirect:/admin/venues";
//		}
//	}

	@RequestMapping("/admin/venues/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		return "/venues/show.jsp";
	}

	@RequestMapping("/admin/venues/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		return "/venues/edit.jsp";
	}

	@RequestMapping(value = "/admin/venues/{id}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
		if (result.hasErrors()) {
			return "/venues/edit.jsp";
		} else {
			venueService.updateVenue(venue.getId(), venue.getName(), venue.getDescription(), venue.getLocation(),
					venue.getPrice(), venue.getServices());
			return "redirect:/admin/venues/{id}";
		}
	}

}

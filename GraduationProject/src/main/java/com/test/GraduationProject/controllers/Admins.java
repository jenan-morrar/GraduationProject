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
import org.springframework.web.bind.annotation.RequestParam;

import com.test.GraduationProject.models.ServiceOfVenue;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.services.ServicesOfVenueService;
import com.test.GraduationProject.services.VenueService;

@Controller
public class Admins {

	private VenueService venueService;
	private ServicesOfVenueService servicesOfVenueService;

	public Admins(VenueService venueService, ServicesOfVenueService servicesOfVenueService) {
		this.venueService = venueService;
		this.servicesOfVenueService = servicesOfVenueService;
	}

//	@RequestMapping("/admin/venues/{id}/services")
//	public String index(Model model,@PathVariable("id") Long id) {
//		List<ServiceOfVenue> services = servicesOfVenueService.allVenuesServices();
//		model.addAttribute("services", services);
//		return "redirect:/admin/venues/{id}/services";
//	}
//
//	@RequestMapping(value = "/admin/venues/{id}/services", method = RequestMethod.POST)
//	public String create(@Valid @ModelAttribute("service") ServiceOfVenue service, BindingResult result) {
//		if (result.hasErrors()) {
//			return "redirect:/admin/venues/{id}/services";
//		} else {
//			
////			List<ServiceOfVenue> services = servicesOfVenueService.allVenuesServices();
////			for(int i=0;i<services.size();i++) {
////			if(!services.contains(service)) {
////				servicesOfVenueService.createService(service);
////			}
////		}
//			servicesOfVenueService.createService(service);
//			return "redirect:/admin/venues/{id}/services";
//		}
//	}

//************************************************
	@RequestMapping("/admin/venues/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		model.addAttribute("serviceExist", "no");

		return "/venues/show.jsp";
	}

//	@RequestMapping("/save")
//	public String save() {
//		long id = 9l;
//		ServiceOfVenue service = new ServiceOfVenue(id,"drinkkks",10,null);
//		servicesOfVenueService.createService(service);
//		return "index.jsp";
//	}

	@RequestMapping("/admin/venues/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		model.addAttribute("serviceExist", "no");
		return "/venues/edit.jsp";
	}

	@RequestMapping(value = "/admin/venues/{id}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
		if (result.hasErrors()) {
			return "/venues/edit.jsp";
		} else {

			List<ServiceOfVenue> services = servicesOfVenueService.allVenuesServices();

			if (venue.getServices() != null) {
				for (int i = 0; i < venue.getServices().size(); i++) {
					servicesOfVenueService.updateService(venue.getServices().get(i).getId(),
							venue.getServices().get(i).getName(), venue.getServices().get(i).getPrice());
					if (!services.contains(venue.getServices().get(i))) {
						servicesOfVenueService.createService(venue.getServices().get(i));
					}
				}
			}
			venueService.updateVenue(venue.getId(), venue.getName(), venue.getDescription(), venue.getLocation(),
					venue.getPrice(), venue.getServices());
			return "redirect:/admin/venues/{id}";
		}
	}

	// Delete Service
	@RequestMapping(value = "/admin/venues/{id1}/services/delete/{id2}", method = RequestMethod.GET)
	public String deleteService(@PathVariable("id1") long id1, @PathVariable("id2") long id2, Model model) {
		Venue venue = venueService.findVenue(id1);
		model.addAttribute("venue", venue);
		for (int i = 0; i < venue.getServices().size(); i++) {
			if (venue.getServices().get(i).getId() == id2) {
				venue.getServices().remove(venue.getServices().get(i));
				venueService.updateVenue(venue.getId(), venue.getName(), venue.getDescription(), venue.getLocation(),
						venue.getPrice(), venue.getServices());
			}
		}
		return "/venues/edit.jsp";
	}

//	@RequestMapping("/admin/venues/{id}/services/add")
//	public String index(Model model,@PathVariable("id") Long id) {
//		List<ServiceOfVenue> services = servicesOfVenueService.allVenuesServices();
//		model.addAttribute("services", services);
//		return "redirect:/admin/venues/{id}/services";
//	}
	// Edit this
	@RequestMapping(value = "/admin/venues/{id}/services/add", method = RequestMethod.POST)
	public String addService(@PathVariable("id") long id, @RequestParam("serviceName") String name,
			@RequestParam("servicePrice") float price, Model model) {
		boolean flag = true;
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		model.addAttribute("serviceExist", "no");

		if (venue.getServices() != null) {

			for (int i = 0; i < venue.getServices().size(); i++) {
				if (venue.getServices().get(i).getName().equalsIgnoreCase(name)) {
					model.addAttribute("serviceExist", "yes");
					flag = false;
				}
			}
		}
		if (flag) {
			
			model.addAttribute("serviceExist", "no");
			ServiceOfVenue service = new ServiceOfVenue(null, name, price, null);
			servicesOfVenueService.createService(service);
			venue.getServices().add(service);
			venueService.updateVenue(venue.getId(), venue.getName(), venue.getDescription(), venue.getLocation(),
					venue.getPrice(), venue.getServices());
		}

		return "/venues/edit.jsp";
	}

}

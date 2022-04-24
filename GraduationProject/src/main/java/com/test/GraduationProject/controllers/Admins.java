package com.test.GraduationProject.controllers;

import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.GraduationProject.models.Images;
import com.test.GraduationProject.models.Reservation;
import com.test.GraduationProject.models.ServiceOfVenue;
import com.test.GraduationProject.models.Venue;
import com.test.GraduationProject.services.ServicesOfVenueService;
import com.test.GraduationProject.services.UserService;
import com.test.GraduationProject.services.VenueService;
import com.test.GraduationProject.services.ImagesService;
import com.test.GraduationProject.services.ReservationService;

@Controller
public class Admins {

	private VenueService venueService;
	private ServicesOfVenueService servicesOfVenueService;
	private ImagesService imagesService;
	private UserService userService;
	private ReservationService reservationService;

	public Admins(VenueService venueService, ServicesOfVenueService servicesOfVenueService, ImagesService imagesService,
			UserService userService, ReservationService reservationService) {
		this.venueService = venueService;
		this.servicesOfVenueService = servicesOfVenueService;
		this.imagesService = imagesService;
		this.userService = userService;
		this.reservationService = reservationService;
	}

//	@RequestMapping("/admin/venues/{id}")
//	public String show(@PathVariable("id") Long id, Model model) {
//		Venue venue = venueService.findVenue(id);
//		model.addAttribute("venue", venue);
//		model.addAttribute("serviceExist", "no");
//
//		return "/venues/show.jsp";
//	}

	@RequestMapping("/adminVenuePage/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model, Principal principal) {
		Venue venue = venueService.findVenue(id);
		List<Reservation> reservations = reservationService.allReservation();
		model.addAttribute("reservationResult", reservations);

		if (principal != null) {
			String username = principal.getName();
			String userRole = userService.findByEmail(username).getRoles().get(0).getName();
			long userId = userService.findByEmail(username).getId();
			model.addAttribute("currentUser", "user").addAttribute("userRole", userRole);

			if (userRole.equals("ROLE_ADMIN")) {
				model.addAttribute("serviceExist", "no");

				if (venue.getUser() != null) {
					if (venue.getUser().getId() == userId) {
						model.addAttribute("venue", venue);
						model.addAttribute("serviceExist", "no");
					} else {
						return "errorPage.jsp";
					}
				}
			}
		} else {
			model.addAttribute("currentUser", "noUser");
		}

		return "editAdminVenuePage.jsp";
	}

	@RequestMapping(value = "/adminVenuePage/{id}", method = RequestMethod.PUT)
	public String update(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
		if (result.hasErrors()) {
			return "editAdminVenuePage.jsp";
		} else {

//			List<ServiceOfVenue> services = servicesOfVenueService.allVenuesServices();

//			if (venue.getServices() != null) {
//				List<ServiceOfVenue> serviceList;
//				serviceList = venue.getServices().stream().collect(Collectors.toList());
//				for (int i = 0; i < serviceList.size(); i++) {
//					servicesOfVenueService.updateService(serviceList.get(i).getId(), serviceList.get(i).getName(),
//							serviceList.get(i).getPrice());
//					if (!services.contains(serviceList.get(i))) {
//						servicesOfVenueService.createService(serviceList.get(i));
//					}
//				}
//			}
			venueService.updateVenue1(venue.getId(), venue.getName(), venue.getDescription(), venue.getLocation(),
					venue.getPrice(), venue.getNumOfGuests(), venue.getVenuePark(), venue.getVenueContact());
			return "redirect:/adminVenuePage/{id}/edit";
		}
	}

	// Delete Service
	@RequestMapping(value = "/adminVenuePage/{id1}/services/delete/{id2}", method = RequestMethod.GET)
	public String deleteService(@PathVariable("id1") long id1, @PathVariable("id2") long id2, Model model,
			RedirectAttributes redirectAttrs) {
		Venue venue = venueService.findVenue(id1);
		model.addAttribute("venue", venue);
		redirectAttrs.addAttribute("id", venue.getId());
		if (venue.getServices() != null) {
			List<ServiceOfVenue> serviceList;
			serviceList = venue.getServices().stream().collect(Collectors.toList());
			for (int i = 0; i < serviceList.size(); i++) {
				if (serviceList.get(i).getId() == id2) {
					venue.getServices().remove(serviceList.get(i));
					servicesOfVenueService.deleteService(id2);
					venueService.updateVenue2(venue.getId(), venue.getName(), venue.getDescription(),
							venue.getLocation(), venue.getPrice(), venue.getNumOfGuests(), venue.getVenuePark(),
							venue.getVenueContact(), venue.getServices(), venue.getImages());
				}
			}
		}
		return "redirect:/adminVenuePage/{id}/edit";
	}

	// Delete Image
	@RequestMapping(value = "/adminVenuePage/{id1}/images/delete/{id2}", method = RequestMethod.GET)
	public String deleteImage(@PathVariable("id1") long id1, @PathVariable("id2") long id2, Model model,
			RedirectAttributes redirectAttrs) {
		Venue venue = venueService.findVenue(id1);
		model.addAttribute("venue", venue);
		redirectAttrs.addAttribute("id", venue.getId());

		if (venue.getImages() != null) {
			List<Images> imagesList;
			imagesList = venue.getImages().stream().collect(Collectors.toList());
			for (int i = 0; i < imagesList.size(); i++) {
				if (imagesList.get(i).getId() == id2) {
					venue.getImages().remove(imagesList.get(i));
					imagesService.deleteImage(id2);
					venueService.updateVenue2(venue.getId(), venue.getName(), venue.getDescription(),
							venue.getLocation(), venue.getPrice(), venue.getNumOfGuests(), venue.getVenuePark(),
							venue.getVenueContact(), venue.getServices(), venue.getImages());
				}
			}
		}
		return "redirect:/adminVenuePage/{id}/edit";
	}

	// Add Service
	@RequestMapping(value = "/adminVenuePage/{id}/services/add", method = RequestMethod.POST)
	public String addService(@PathVariable("id") long id, @RequestParam("serviceName") String name,
			@RequestParam("servicePrice") float price, Model model) {
		boolean flag = true;
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		model.addAttribute("serviceExist", "no");

		if (venue.getServices() != null) {
			List<ServiceOfVenue> serviceList;
			serviceList = venue.getServices().stream().collect(Collectors.toList());
			for (int i = 0; i < serviceList.size(); i++) {
				if (serviceList.get(i).getName().equalsIgnoreCase(name)) {
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
			venueService.updateVenue2(venue.getId(), venue.getName(), venue.getDescription(), venue.getLocation(),
					venue.getPrice(), venue.getNumOfGuests(), venue.getVenuePark(), venue.getVenueContact(),
					venue.getServices(), venue.getImages());
		}

		return "redirect:/adminVenuePage/{id}/edit";
	}

	// Add Image
	@RequestMapping(value = "/adminVenuePage/{id}/images/add", method = RequestMethod.POST)
	public String addImages(@PathVariable("id") long id, @RequestParam("image") MultipartFile multipartFile,
			Model model) throws IOException {
		Venue venue = venueService.findVenue(id);
		model.addAttribute("venue", venue);
		model.addAttribute("serviceExist", "no");
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		// Set<Images> imagesList = new HashSet<Images>();
		Images image = new Images(null, fileName, null);
		// imagesList.add(image);
		// venue.setImages(imagesList);
		venue.getImages().add(image);
		imagesService.createImage(image);
		venueService.updateVenue2(venue.getId(), venue.getName(), venue.getDescription(), venue.getLocation(),
				venue.getPrice(), venue.getNumOfGuests(), venue.getVenuePark(), venue.getVenueContact(),
				venue.getServices(), venue.getImages());
		String uploadDir = "user-photos/" + id;
		FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);

		return "redirect:/adminVenuePage/{id}/edit";
	}

}
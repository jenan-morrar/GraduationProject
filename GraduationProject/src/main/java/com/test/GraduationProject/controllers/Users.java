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
import com.test.GraduationProject.services.UserService;
import com.test.GraduationProject.validator.UserValidator;

@Controller
public class Users {
    private UserService userService;
    private UserValidator userValidator;
    
    public Users(UserService userService,UserValidator userValidator) {
        this.userService = userService;
        this.userValidator = userValidator;
    }
    
    
    @RequestMapping("/registration")
    public String registerForm(@Valid @ModelAttribute("user") User user) {
        return "registrationPage.jsp";
    }
    
    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model, HttpSession session) throws MessagingException {
    	userValidator.validate(user, result);
    	if (result.hasErrors()) {
            return "registrationPage.jsp";
        }
       boolean registration = userService.saveWithUserRole(user);
    	//boolean registration = userService.saveUserWithAdminRole(user);
    	if (registration == false) {
    		
            model.addAttribute("alreadyExist", "هذا المستخدم موجود! استخدم ايميل آخر");
    		return "registrationPage.jsp";
    	}
        return "redirect:/login";
    }
    
    @RequestMapping("/login")
    public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
        if(error != null) {
            model.addAttribute("errorMessage", "Invalid Credentials, Please try again.");
        }
        if(logout != null) {
            model.addAttribute("logoutMessage", "Logout Successful!");
        }
        return "loginPage.jsp";
    }
    
    @RequestMapping("/admin")
    public String adminPage(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByEmail(username));
        return "adminPage.jsp";
    }
    
//    @RequestMapping(value="/admin/adminForm/", method=RequestMethod.POST)
//    public String create(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
//        if (result.hasErrors()) {
//            return "adminForm.jsp";
//        } else {
//            userService.createVenue(venue);
//            return "redirect:/adminForm";
//        }
//    }
//    
//    @RequestMapping("/admin/adminForm/{id}/edit")
//    public String edit(@PathVariable("id") Long id, Model model) {
//        Venue venue = userService.findVenue(id);
//        model.addAttribute("venue", venue);
//        return "adminForm.jsp";
//    }
//    
//    @RequestMapping(value="/admin/adminForm/{id}", method=RequestMethod.POST)
//    public String update(@Valid @ModelAttribute("venue") Venue venue, BindingResult result) {
//        if (result.hasErrors()) {
//            return "adminForm.jsp";
//        } else {
//        	userService.updateVenue(venue.getId(), venue.getName(), venue.getDescription(), venue.getLocation(), venue.getPrice(), venue.getServiceOfVenue());
//            return "redirect:/admin/adminForm/";
//        }
//    }
//    
//    @RequestMapping(value="/admin/adminForm/{id}", method=RequestMethod.DELETE)
//    public String destroy(@PathVariable("id") Long id) {
//        userService.deleteVenue(id);
//        return "redirect:/admin/adminForm";
//    }
//    
    @RequestMapping("/superAdmin")
    public String superAdminPage(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByEmail(username));
        return "superAdminPage.jsp";
    }
    
    @RequestMapping(value = {"/", "/home"})
    public String home(Principal principal, Model model) {
        String username = principal.getName();
        model.addAttribute("currentUser", userService.findByEmail(username));
        return "homePage.jsp";
    }
    
}
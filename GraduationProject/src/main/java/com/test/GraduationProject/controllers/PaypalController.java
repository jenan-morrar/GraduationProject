package com.test.GraduationProject.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.test.GraduationProject.models.Order;
import com.test.GraduationProject.services.PaypalService;

@Controller
public class PaypalController {

	@Autowired
	PaypalService service;

	public static final String SUCCESS_URL = "/success";
	public static final String CANCEL_URL = "/cancel";

	public PaypalController(PaypalService service) {
		super();
		this.service = service;
	}

	@GetMapping("/pay")
	public String home(@ModelAttribute("reservationObject") String reservationObject) {
		//System.out.println("Hi Reservation"+reservationObject);
		return "paymentPage.jsp";
	}

	@PostMapping("/pay")
	public String payment(@ModelAttribute("order") Order order) {
		try {
			Payment payment = service.createPayment(order.getPrice(), order.getCurrency(), order.getMethod(),
					order.getIntent(), order.getDescription(), "http://localhost:8080" + CANCEL_URL,
					"http://localhost:8080" + SUCCESS_URL);
			for (Links link : payment.getLinks()) {
				if (link.getRel().equals("approval_url")) {
					return "redirect:" + link.getHref();
				}
			}

		} catch (PayPalRESTException e) {

			e.printStackTrace();
		}
		return "redirect:/pay";
	}

	@GetMapping(value = CANCEL_URL)
	public String cancelPay() {
		return "cancel.jsp";
	}

//	@GetMapping(value = SUCCESS_URL)
//	public String successPay(@RequestParam(value = "paymentId", required = false) String paymentId,
//			@RequestParam(value = "PayerID", required = false) String payerId) {
//		try {
//			Payment payment = service.executePayment(paymentId, payerId);
//			//System.out.println(payment.toJSON());
//			if (payment.getState().equals("approved")) {
//				return "success.jsp";
//			}
//		} catch (PayPalRESTException e) {
//			System.out.println(e.getMessage());
//		}
//		return "success.jsp";
//	}

}
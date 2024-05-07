package com.mycompany.Tget_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/payment")
public class sooController {
	
	@GetMapping("/paymentdetail")
	public String paymentdetail() {
		return "payment/payment";
	}
	
	@GetMapping("/payment_cancel")
	public String payment_cancel() {
		return "payment/payment_cancel";
	}
	
	@GetMapping("/payment_completed")
	public String payment_complement() {
		return "payment/payment_completed";
	}

}

package com.mycompany.Tget_mini_web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.mycompany.Tget_mini_web.dto.ReviewDto;

import com.mycompany.Tget_mini_web.service.ReviewService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ReviewService service;

	@RequestMapping("")
	public String detail() {
		log.info("detail()실행");
		return "item/detail";
	}
	//마이페이지 구매내역 상세페이지
	@RequestMapping("/status_page")
	public String status_page() {
		log.info("item.status_page()실행");
		return "item/status_page";
	}
	@RequestMapping("writeReviewForm")
	public String writeReviewForm() {
		log.info("item.writeReviewForm() 실행");
		return "item/writeReviewForm";
	}
	
	
	@PostMapping("/writeReview")
	public String writeReview(ReviewDto reviewDto) {
		
		reviewDto.setMid("admin");
		reviewDto.setPno(20);
		service.writeReview(reviewDto);

		return "item/detail";
	}
		
}

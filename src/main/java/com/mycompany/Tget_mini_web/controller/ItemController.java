package com.mycompany.Tget_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
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

	
}

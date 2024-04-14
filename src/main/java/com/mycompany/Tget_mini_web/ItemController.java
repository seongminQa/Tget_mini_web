package com.mycompany.Tget_mini_web;

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

}

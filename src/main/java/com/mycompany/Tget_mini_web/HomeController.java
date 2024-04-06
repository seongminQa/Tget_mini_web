package com.mycompany.Tget_mini_web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class HomeController {
	@RequestMapping("")
	public String index() {
		Log.info("index() ½ÇÇà"); 
		return "home";
	}
}

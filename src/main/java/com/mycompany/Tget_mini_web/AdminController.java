package com.mycompany.Tget_mini_web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/*
	관리자 컨트롤러
	백엔드 부분,, 아직 미정

*/

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@RequestMapping("")
	public String index() {
		log.info("admin.index() 실행");
		return "admin/index";
	}
}

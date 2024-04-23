package com.mycompany.Tget_mini_web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		return "/admin/index";
	}
	
	@RequestMapping("/product")
	public String p_Read(Model model) {
		log.info("admin.p_Read() 실행");
		model.addAttribute("admin", "product");
		return "/admin/product/p_read";
	}
	
	@RequestMapping("/member")
	public String m_Read(Model model) {
		log.info("admin.m_Read() 실행");
		model.addAttribute("admin", "member");
		return "/admin/member/m_read";
	}
	
	@RequestMapping("/board")
	public String b_Read(Model model) {
		log.info("admin.index() 실행");
		model.addAttribute("admin", "board");
		return "/admin/board/b_read";
	}
	
}

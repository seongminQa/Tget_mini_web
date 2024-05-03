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
	
	@RequestMapping("/productReader")
	public String productReader(Model model) {
		log.info("admin.productReader() 실행");
		model.addAttribute("admin", "product");
		return "/admin/product/p_read";
	}
	
	@RequestMapping("/productSignup")
	public String productSignup(Model model) {
		log.info("admin.productSignup() 실행");
		model.addAttribute("admin", "product");
		return "/admin/product/p_sign";
	}
	
	@RequestMapping("/productModify")
	public String productModify(Model model) {
		log.info("admin.productModify() 실행");
		model.addAttribute("admin", "product");
		return "/admin/product/p_modify";
	}
	
	@RequestMapping("/memberReader")
	public String memberReader(Model model) {
		log.info("admin.memberReader() 실행");
		model.addAttribute("admin", "member");
		return "/admin/member/m_read";
	}
	
	@RequestMapping("/memberSignup")
	public String memberSignup(Model model) {
		log.info("admin.memberSignup() 실행");
		model.addAttribute("admin", "member");
		return "/admin/member/m_signup";
	}
	
	@RequestMapping("/memberModify")
	public String memberModify(Model model) {
		log.info("admin.memberModify() 실행");
		model.addAttribute("admin", "member");
		return "/admin/member/m_modify";
	}
	
	@RequestMapping("/boardReader")
	public String boardReader(Model model) {
		log.info("admin.boardReader() 실행");
		model.addAttribute("admin", "board");
		return "/admin/board/b_read";
	}
	
	@RequestMapping("/boardSignup")
	public String boardSignup(Model model) {
		log.info("admin.boardSignup() 실행");
		model.addAttribute("admin", "board");
		return "/admin/board/b_signup";
	}
	
	@RequestMapping("/boardModify")
	public String boardModify(Model model) {
		log.info("admin.boardModify() 실행");
		model.addAttribute("admin", "board");
		return "/admin/board/b_modify";
	}
	
}

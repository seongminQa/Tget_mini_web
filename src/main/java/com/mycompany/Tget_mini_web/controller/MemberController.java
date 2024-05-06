package com.mycompany.Tget_mini_web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/*
	로그인 / 로그아웃 / 회원가입
	마이페이지 --> 탈퇴 / 수정 / 주문목록 --> 취소/반품/수정 등등 
	찜 리스트(장바구니) --> 좋아요한 목록(찜리스트)
 */

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	// member 기본 인덱스 페이지 매핑
	@RequestMapping("")
	public String index() {
		log.info("member.index() 실행");
		return "member/index";
	}

	// member 로그인 페이지 매핑
	@RequestMapping("/login")
	public String login() {
		log.info("member.login() 실행");
		return "member/loginForm";
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/admin/page")
	public String adminpage() {
		return "ch17/admin/page";
	}
	
	@Secured("ROLE_MANAGER")
	@GetMapping("/manager/page")
	public String managerpage() {
		return "ch17/manager/page";
	}
	
	@Secured("ROLE_USER")
	@GetMapping("/user/page")
	public String userpage() {
		return "ch17/user/page";
	}
	
	@RequestMapping("/error403")
	public String error403() {
		return "ch17/error403";
	}
	
	// member 회원가입 페이지
	@RequestMapping("/sign_up")
	public String sign_up() {
		log.info("member.sign_up() 실행");
		return "member/sign_up";
	}
	
	@Autowired
	private MemberService mservice;
	
	// member 회원가입 form DB저장 후 로그인 페이지로 redirect
	@PostMapping("/join")
	public String joinForm(@ModelAttribute MemberDto member) {
		log.info("회원가입 form controller 도착");
		//mservice.join(member);
		log.info(member.toString());
		return "redirect:/";
	}
	
	 

	// member 회원정보수정 페이지 매핑
	@RequestMapping("/memberInfoModify")
	public String memberInfoModify() {
		log.info("member.shopping_cart() 실행");
		return "member/memberInfoModify";
	}

	// member 회원정보수정 페이지 매핑
	@RequestMapping("/memberInfoWithdrawal")
	public String memberInfoWithdrawal() {
		log.info("member.shopping_cart() 실행");
		return "member/memberInfoWithdrawal";
	}

	// 리뷰
	@RequestMapping("/review_ing")
	public String review_ing() {
		log.info("member.review_ing() 실행");
		return "member/review_ing";
	}

	// 구매내역
	@RequestMapping("/purchase")
	public String purchase() {
		log.info("member.purchase() 실행");
		return "member/purchase";
	}

	// 아이디 찾기
	@RequestMapping("/lost_id")
	public String lost_id() {
		log.info("member.lost_id() 실행");
		return "member/lost_id";
	}

	// 비밀번호 찾기
	@RequestMapping("/lost_pw")
	public String lost_pw() {
		log.info("member.lost_pw() 실행");
		return "member/lost_pw";
	}

}

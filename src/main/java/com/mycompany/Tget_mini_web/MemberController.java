package com.mycompany.Tget_mini_web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
		return "member/log_in";
	}
	// member 회원가입 페이지 매핑
	@RequestMapping("/sign_up")
	public String sign_up() {
		log.info("member.sign_up() 실행");
		return "member/sign_up";
	}
	// member 장바구니 페이지 매핑
	@RequestMapping("/shoppingcart")
	public String shoppingCart() {
		log.info("member.shopping_cart() 실행");
		return "member/shopping_cart";
	}
}

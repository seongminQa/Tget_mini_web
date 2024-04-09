package com.mycompany.Tget_mini_web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/*
	로그인 / 로그아웃 / 회원가입
	마이페이지 --> 탈퇴 / 수정 / 주문목록 --> 취소/반품/수정 등등 
	주문확인 --> 장바구니
	좋아요 --> 좋아요한 목록(찜리스트)
 */

@Slf4j
@Controller
@RequestMapping("/member")
public class MemberController {
	@RequestMapping("")
	public String index() {
		log.info("member.index() 실행");
		return "member/index";
	}
}

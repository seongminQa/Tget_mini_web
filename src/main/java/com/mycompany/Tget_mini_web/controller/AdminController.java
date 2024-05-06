package com.mycompany.Tget_mini_web.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.Tget_mini_web.dao.MemberDao;
import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;
import com.mycompany.Tget_mini_web.service.MemberService;

import lombok.extern.slf4j.Slf4j;

/*
	관리자 컨트롤러
	백엔드 부분,, 아직 미정

*/

@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MemberService service;
	
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
	
	// 회원 조회 화면 // 회원들의 리스트 보여주기
	// paging 처리
	@GetMapping("/memberReader")
	public String memberReader(Model model, String pageNo, HttpSession session) {
		log.info("admin.memberReader() 실행");
		model.addAttribute("admin", "member");
		
		// pageNo를 받지 못했을 경우
		if(pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
			if(pageNo == null) {
				pageNo = "1";
			}
		}
		
		// 세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);
		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);
		
		// Pager 객체 생성
		// 사용자가 제일 처음에는 페이지의 번호를 입력하지 않는다. --> 사용자에 의해 요청한 페이지가 아닌 것을 보여주어야 한다(초기화면)
		int rowsPagingTarget = service.getTotalRows();
		PagerDto pager = new PagerDto(10, 10, rowsPagingTarget, intPageNo); // 페이지 객체 만들기
		
		// 페이징 정보를 얻어서 서비스쪽으로 넘기고  Service에서 게시물 목록 요청
		List<MemberDto> memberList = service.getMemberList(pager);
		
		// jsp에서 사용할 수 있도록 설정.
		model.addAttribute("pager", pager);
		model.addAttribute("memberList", memberList);	
		
		return "/admin/member/m_read";
	}
	
	// 회원 등록 더미 집어넣기
	/*@GetMapping("/signupMemberTest")
	public String signupMember() throws Exception {

		Date now = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String nowStr = formatter.format(now);
		Date nowDate = formatter.parse(nowStr);

		for(int i=25; i<45; i++) {
			MemberDto memberDto = new MemberDto();
			memberDto.setMid("user" + Integer.toString(i));
			memberDto.setMpassword("{noop}" + Integer.toString(12345));
			memberDto.setMname("유저" + i);
			memberDto.setMssn(Integer.toString(123456)); // mssn char(30)으로 변경하기
			memberDto.setMemail("seongmin@gmail.com");
			memberDto.setMaddress("서울시 강동구");
			memberDto.setMphone("010-1234-1234");
			memberDto.setMnickname("line8");
			memberDto.setMsince(nowDate);
			memberDto.setMprefergenre("코믹");
			memberDto.setMgrade("Gold");
			//memberDto.setMprofileImg(null); // 프로필 이미지 생략
			memberDto.setMtotalpay(i*10000);
			memberDto.setMrole("유저");
			memberDto.setMno(i);
			memberDao.insert(memberDto);

			memberDao.insertmember(memberDto);
		}
		return "redirect:/";
	}*/
	
	
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

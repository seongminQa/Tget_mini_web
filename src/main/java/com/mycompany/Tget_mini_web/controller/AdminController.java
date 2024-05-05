package com.mycompany.Tget_mini_web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.Tget_mini_web.dao.MemberDao;
import com.mycompany.Tget_mini_web.dto.MemberDto;

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
	
	// 회원 등록 해보기
	@GetMapping("/signupMemberTest")
	public String signupMember() throws Exception {
		/*LocalDate now = LocalDate.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String formatedNow = now.format(dtf);
		
        // 문자열        
		String dateStr = formatedNow;         
		// 포맷터        
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초");         
		// 문자열 -> Date        
		Date date = formatter.parse(dateStr);*/
		
		String date="20240503";
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");

		for(int i=2; i<25; i++) {
			MemberDto memberDto = new MemberDto();
			memberDto.setMid("user" + Integer.toString(i));
			memberDto.setMpassword("{noop}" + Integer.toString(12345));
			memberDto.setMname("유저" + i);
			memberDto.setMssn(Integer.toString(123456)); // mssn char(30)으로 변경하기
			memberDto.setMemail("seongmin@gmail.com");
			memberDto.setMaddress("서울시 강동구");
			memberDto.setMphone("010-1234-1234");
			memberDto.setMnickname("line8");
			memberDto.setMsince(format.parse(date));
			memberDto.setMprefergenre("코믹");
			memberDto.setMgrade("Gold");
			//memberDto.setMprofileImg(null); // 프로필 이미지 생략
			memberDto.setMtotalpay(i*10000);
			memberDto.setMrole("유저");
			memberDao.insertmember(memberDto);
		}
		return "redirect:/";
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

package com.mycompany.Tget_mini_web.controller;

import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.Tget_mini_web.dao.BoardDao;
import com.mycompany.Tget_mini_web.dto.BoardDto;
import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.security.TgetUserDetails;
import com.mycompany.Tget_mini_web.service.BoardService;
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

	BoardService boardService;
	BoardDao boardDao;
	BoardDto boardDto;

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
		return "Secret/admin/page";
	}

	@Secured("ROLE_MANAGER")
	@GetMapping("/manager/page")
	public String managerpage() {
		return "Secret/manager/page";
	}

	@Secured("ROLE_USER")
	@GetMapping("/user/page")
	public String userpage() {
		return "Secret/user/page";
	}

	@RequestMapping("/error403")
	public String error403() {
		return "Secret/error403";
	}

	// member 회원가입 페이지
	@RequestMapping("/sign_up")
	public String sign_up() {
		log.info("member.sign_up() 실행");
		return "member/sign_up";
	}

	@Autowired
	private MemberService memberservice;

	// member 회원가입 form DB저장 후 로그인 페이지로 redirect
	@PostMapping("/join")
	public String joinForm(MemberDto member) {

		// 첨부 파일이 있는지 여부 조사
		if (member.getMprofileImg() != null && !member.getMprofileImg().isEmpty()) {// battach가 null이 아니거나 비어있지 않다면
			// DTO 추가 설정(첨부 파일이 넘어 왔을 경우)
			member.setMprofileImgType(member.getMprofileImg().getContentType());
			member.setMprofileImgName(member.getMprofileImg().getOriginalFilename());
			try {
				member.setMprofileImgData(member.getMprofileImg().getBytes()); // 예외 처리 하라고 나옴
			} catch (Exception e) {
				// 비즈니스 로직 때문에 생기는 예외는 아니라서 간단하게 처리 한다.
			}
			log.info("첨부파일 있음");
		} else {
			log.info("첨부파일 없음");
		}
		log.info("회원가입 form controller 도착");
		memberservice.join(member);
		log.info(member.toString());
		return "redirect:/member/login";
	}

	// id 중복 검사
	@PostMapping(value = "/uniqueid", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String idUniqueCheck(@RequestParam("mid") String mid) {
		log.info("아이디 중복체크 컨트롤러 진입");
		int count = memberservice.getMidCount(mid);

		JSONObject jsonObject = new JSONObject();
		// jsonObject.put("result", "success");
		jsonObject.put("mid", mid);
		jsonObject.put("count", count);
		return jsonObject.toString();
	}

	// ssn 중복 검사
	@PostMapping(value = "/uniquessn", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String ssnUniqueCheck(@RequestParam("mssn") String mssn) {
		log.info("주민번호 중복체크 컨트롤러 진입");

		// db에 들어가면서 하이픈이 빠지기 때문에 올바른 검사를 위해 하이픈이 빠진 데이터로 중복 검사를 해야 한다.
		mssn = mssn.replace("-", "");

		int count = memberservice.getMssnCount(mssn);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("mssn", mssn);
		jsonObject.put("count", count);
		return jsonObject.toString();
	}

	// phone 중복 검사
	@PostMapping(value = "/uniquephone", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String phoneUniqueCheck(@RequestParam("mphone") String mphone) {
		log.info("휴대폰 번호 중복체크 컨트롤러 진입");

		int count = memberservice.getMphoneCount(mphone);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("mphone", mphone);
		jsonObject.put("count", count);
		return jsonObject.toString();
	}

	// 닉네임 중복 검사
	@PostMapping(value = "/uniquenickname", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String nicknameUniqueCheck(@RequestParam("mnickname") String mnickname) {
		log.info("닉네임 중복체크 컨트롤러 진입");

		int count = memberservice.getMnicknameCount(mnickname);

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("mnickname", mnickname);
		jsonObject.put("count", count);
		return jsonObject.toString();
	}

// member 회원정보수정 페이지 매핑
	@GetMapping("/memberInfoModify")
	public String memberInfoModify(Authentication authentication, Model model) {
		if (authentication == null || !authentication.isAuthenticated()) {
			return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
		}
		TgetUserDetails userDetails = (TgetUserDetails) authentication.getPrincipal();
		MemberDto memberDto = userDetails.getMember();
		model.addAttribute(memberDto);

		return "member/memberInfoModify";
	}

	// 게시물 첨부파일 보기 메소드
	@GetMapping("/imgProfileDownload")
	public void imgProfileDownload(String mid, HttpServletResponse response) throws Exception {
		log.info("실행");
		// 다운로드할 데이터를 준비
		MemberDto memberDto = memberservice.getMember(mid);
		log.info(memberDto.toString());
		byte[] data = memberDto.getMprofileImgData();
		log.info(data.toString());
		// 응답 헤더 구성
		response.setContentType(memberDto.getMprofileImgType());
		String fileName = new String(memberDto.getMprofileImgName().getBytes("UTF-8"), "ISO-8859-1");

		response.setHeader("content-disposition", "attachment; fielname=\"" + fileName + "\"");
		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}

	// member 회원정보수정 페이지 매핑
	@Secured("ROLE_USER")
	@RequestMapping("/memberInfoWithdrawal")
	public String memberInfoWithdrawal() {
		log.info("member.shopping_cart() 실행");
		return "member/memberInfoWithdrawal";
	}

	// 리뷰
	@Secured("ROLE_USER")
	@RequestMapping("/review_ing")
	public String review_ing(Model model, String pageNo, HttpSession session) {
		log.info("member.review_ing() 실행");

		/*
		 * // pageNo를 받지 못했을 경우, 세션에 저장되어 있는지 확인 if (pageNo == null) { pageNo = (String)
		 * session.getAttribute("pageNo"); // 세션에 저장되어 있지 않을 경우"1"로 강제 세팅 if (pageNo ==
		 * null) { pageNo = "1"; } } // 세션에 pageNo 저장 session.setAttribute("pageNo",
		 * pageNo); // 문자열을 정수로 반환 int intPageNo = Integer.parseInt(pageNo);
		 * 
		 * // Pager 객체 생성 int rowsPagingTarget = boardService.getTotalRows(); PagerDto
		 * pager = new PagerDto(10, 10, rowsPagingTarget, intPageNo);
		 * 
		 * // Service에서 게시물 목록 요청 List<BoardDto> boardList =
		 * boardService.getBoardList(pager);
		 * 
		 * // JSP에서 사용할 수 있도록 설정 model.addAttribute("pager", pager);
		 * model.addAttribute("boardList", boardList);
		 */

		return "member/review_ing";
	}

	// 구매내역
	@Secured("ROLE_USER")
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

	// 아이디 찾기 기능
	@PostMapping("/findId")
	public String findId(MemberDto memberDto, Model model) {
		log.info("member.findId()실행");
		memberservice.findId(memberDto);
		/* log.info(memberservice.findId(memberDto)); */

		if (memberservice.findId(memberDto) == null || memberservice.findId(memberDto) == "") {
			return "member/lost_id"; // redirect:/
		}
		model.addAttribute("mid", memberservice.findId(memberDto));

		return "member/findId";
	}

	// 비밀번호 찾기
	@RequestMapping("/lost_pw")
	public String lost_pw() {
		log.info("member.lost_pw() 실행");
		return "member/lost_pw";
	}

	// 비밀번호 찾기 기능
	@PostMapping("/findPw")
	public String findPw(MemberDto memberDto, Model model) {
		log.info("member.findPw()실행");
		memberservice.findPw(memberDto);

		if (memberservice.findPw(memberDto) == null || memberservice.findPw(memberDto) == "") {
			return "member/lost_pw";
		}
		model.addAttribute("mpassword", memberservice.findPw(memberDto));

		return "member/findPw";
	}

}

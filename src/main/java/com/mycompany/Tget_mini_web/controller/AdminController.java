package com.mycompany.Tget_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.Tget_mini_web.dao.BoardDao;
import com.mycompany.Tget_mini_web.dao.MemberDao;
import com.mycompany.Tget_mini_web.dao.ProductDao;
import com.mycompany.Tget_mini_web.dto.BoardDto;
import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;
import com.mycompany.Tget_mini_web.dto.ProductDto;
import com.mycompany.Tget_mini_web.security.TgetUserDetails;
import com.mycompany.Tget_mini_web.service.BoardService;
import com.mycompany.Tget_mini_web.service.MemberService;
import com.mycompany.Tget_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

/*
	관리자 컨트롤러
	백엔드 부분,, 아직 미정

*/
@Secured({ "ROLE_ADMIN" })
@Slf4j
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private BoardDao boardDao;

	@Autowired
	private MemberService memberService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private BoardService boardService;


	@RequestMapping("")
	public String index() {
		log.info("admin.index() 실행");
		return "/admin/index";
	}

	// ==================================================================

	// 회원
	// 회원 조회 화면 (회원들의 리스트 보여주기)
	// paging 처리
	@GetMapping("/memberReader")
	public String memberReader(Model model, String pageNo, HttpSession session) {
		log.info("admin.memberReader() 실행");

		// pageNo를 받지 못했을 경우
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("memberPageNo");
			// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
			if (pageNo == null) {
				pageNo = "1";
			}
		}

		// 세션에 pageNo 저장
		session.setAttribute("memberPageNo", pageNo);
		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);

		// Pager 객체 생성
		// 사용자가 제일 처음에는 페이지의 번호를 입력하지 않는다. --> 사용자에 의해 요청한 페이지가 아닌 것을 보여주어야 한다(초기화면)
		int rowsPagingTarget = memberService.getTotalRows();
		PagerDto pager = new PagerDto(10, 10, rowsPagingTarget, intPageNo); // 페이지 객체 만들기

		// 페이징 정보를 얻어서 서비스쪽으로 넘기고 Service에서 게시물 목록 요청
		List<MemberDto> memberList = memberService.getMemberList(pager);

		// jsp에서 사용할 수 있도록 설정.
		model.addAttribute("pager", pager);
		model.addAttribute("memberList", memberList);

		return "/admin/member/m_read";
	}

	// 회원 등록 더미 집어넣기
	/*
	 * @GetMapping("/signupMemberTest") public String signupMember() throws
	 * Exception {
	 * 
	 * Date now = new Date(); SimpleDateFormat formatter = new
	 * SimpleDateFormat("yyyy-MM-dd"); String nowStr = formatter.format(now); Date
	 * nowDate = formatter.parse(nowStr);
	 * 
	 * for(int i=45; i<65; i++) { MemberDto memberDto = new MemberDto();
	 * memberDto.setMid("user" + Integer.toString(i));
	 * memberDto.setMpassword("{noop}" + Integer.toString(12345));
	 * memberDto.setMname("유저" + i); memberDto.setMssn(Integer.toString(123456)); //
	 * mssn char(30)으로 변경하기 memberDto.setMemail("seongmin@gmail.com");
	 * memberDto.setMaddress("서울시 강동구"); memberDto.setMphone("010-1234-1234");
	 * memberDto.setMnickname("line8"); memberDto.setMsince(nowDate);
	 * memberDto.setMprefergenre("코믹"); memberDto.setMgrade("Gold");
	 * //memberDto.setMprofileImg(null); // 프로필 이미지 생략
	 * memberDto.setMtotalpay(i*10000); memberDto.setMrole("유저");
	 * 
	 * memberDao.insertmember(memberDto); } return "redirect:/"; }
	 */

	// 회원 정보 수정
	@PostMapping("/memberModify")
	public String memberModify(Model model, MemberDto memberDto) {
		log.info("admin.memberModify() 실행");
		memberService.updateMember(memberDto);
		return "redirect:/admin/memberReader";
	}

	// 회원 정보 삭제
	@RequestMapping("/memberDelete")
	public String memberDelete(String mid) {
		log.info("삭제 실행");
		memberService.removeMember(mid);
		return "redirect:/admin/memberReader";
	}

	// ==================================================================

	// 상품
	// 상품 조회
	@GetMapping("/productReader")
	public String productReader(Model model, String pageNo, HttpSession session) {
		log.info("admin.productReader() 실행");

		// pageNo를 받지 못했을 경우
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("productPageNo");
			// 세션에 저장되어 있지 않을 경우 "1"로 강제 세팅
			if (pageNo == null) {
				pageNo = "1";
			}
		}

		// 세션에 pageNo 저장
		session.setAttribute("productPageNo", pageNo);
		// 문자열을 정수로 변환
		int intPageNo = Integer.parseInt(pageNo);

		// Pager 객체 생성
		// 사용자가 제일 처음에는 페이지의 번호를 입력하지 않는다. --> 사용자에 의해 요청한 페이지가 아닌 것을 보여주어야 한다(초기화면)
		int rowsPagingTarget = productService.getTotalRows();
		PagerDto pager = new PagerDto(10, 10, rowsPagingTarget, intPageNo); // 페이지 객체 만들기

		// 페이징 정보를 얻어서 서비스쪽으로 넘기고 Service에서 게시물 목록 요청
		List<ProductDto> productList = productService.getProductList(pager);
//		log.info("pkind : " + productList.get(0).getPkind());

		// jsp에서 사용할 수 있도록 설정.
		model.addAttribute("pager", pager);
		model.addAttribute("productList", productList);

		return "/admin/product/p_read";
	}

	// 상품 등록 더미 집어넣기
	/*
	 * @GetMapping("/signupProductTest") public String signupProductTest() throws
	 * Exception { Date now = new Date(); SimpleDateFormat formatter = new
	 * SimpleDateFormat("yyyy-MM-dd"); String nowStr = formatter.format(now); Date
	 * nowDate = formatter.parse(nowStr);
	 * 
	 * for(int i=45; i<65; i++) { ProductDto productDto = new ProductDto(); byte[]
	 * data = productService.getAttachData(bno); productDto.setPno(i);
	 * productDto.setPkind("연극"); productDto.setPtitle("제목" + i);
	 * productDto.setPplace("공연 "+i+"장"); productDto.setPprice(i*1000);
	 * productDto.setPcontent(); productDto.setPposter(); productDto.setPactors();
	 * productDto.setPdatestart(nowDate); productDto.setPdateend(nowDate);
	 * productDto.setPseatgrade("일반석"); productDto.setPseatcnt(165);
	 * productDto.setPaddress("대학로"+i);
	 * 
	 * productDao.insertProduct(productDto); } return
	 * "redirect:/admin/productReader"; }
	 */

	// 상품 등록
	@RequestMapping("/productSignUp")
	public String productSignUp(ProductDto productDto) {
		/*
		 * log.info("admin.productSignUp() 실행"); log.info(productDto.getPplace());
		 */

		// 상품 등록 폼에서 파일을 첨부하고, 그 첨부한 파일(attach data)을 바이트 형식으로 바꾸어
		// Dto 필드에 저장하고, DB 형식에 맞추어 저장한다.
		try {
			productDto.setPposter(productDto.getPposterattach().getBytes());
			productDto.setPcontent(productDto.getPcontentattach().getBytes());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		productService.productSignUp(productDto);

		return "redirect:/admin/productReader";
	}

	// 상품 리스트 포스터 이미지
	@GetMapping("/attachProduct")
	public void attachProduct(int pno, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		ProductDto productDto = productService.getProduct(pno);
		byte[] data = productService.getAttachProductData(pno);

		// 응답 헤더 구성
		response.setContentType(productDto.getPcontentattachtype()); // void메소드. 직접 응답을 생성해서 값을 반환
		response.setContentType(productDto.getPposterattachtype()); // void메소드. 직접 응답을 생성해서 값을 반환
//		String fileName = new String(productDto.getPattachname().getBytes("UTF-8"), "ISO-8859-1");
//		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}

	// 상품 정보 수정
	@PostMapping("/productModify")
	public String productModify(Model model, ProductDto productDto) {
		log.info("admin.productModify() 실행");
		// 첨부 파일이 있는지 여부 조사
		if ((productDto.getPcontentattach() != null && !productDto.getPcontentattach().isEmpty())
				&& (productDto.getPposterattach() != null && !productDto.getPposterattach().isEmpty())) {
			// 첨부파일 타입 저장
			productDto.setPcontentattachtype(productDto.getPcontentattach().getContentType());
			productDto.setPposterattachtype(productDto.getPposterattach().getContentType());
			try {
				// 바이트 형식으로 pposter, pcontent, pactors 필드값 저장
				productDto.setPposter(productDto.getPposterattach().getBytes());
				productDto.setPcontent(productDto.getPcontentattach().getBytes());
			} catch (Exception e) {
			}
		}

		// 비즈니스 로직 처리를 서비스로 위임
		productService.updateProduct(productDto);

		return "redirect:/admin/productReader"; // 수정한 상품이 있던 페이지로 이동해보자**
	}

	// 상품 정보 삭제
	@RequestMapping("/productDelete")
	public String productDelete(int pno) {
		log.info("삭제 실행");
		productService.removeProduct(pno);
		return "redirect:/admin/productReader";
	}

	// ========================================================================

	// 게시판 조회
	@GetMapping("/boardReader")
	public String boardList(String pageNo, Model model, HttpSession session) {
		if (pageNo == null) {
			pageNo = (String) session.getAttribute("boardPageNo");
			// 세션에 저장되어 있지 않을 경우"1"로 강제 세팅
			if (pageNo == null) {
				pageNo = "1";
			}
		}

		// 세션에 pageNo 저장
		session.setAttribute("boardPageNo", pageNo);

		// 문자열을 정수로 반환
		int intPageNo = Integer.parseInt(pageNo);

		// Pager 객체 생성
		int rowsPagingTarget = boardService.getTotalRows();
		PagerDto pagerDto = new PagerDto(10, 10, rowsPagingTarget, intPageNo);

		// Service에서 게시물 목록 요청
		List<BoardDto> boardList = boardService.getBoardList(pagerDto);

		model.addAttribute("pagerDto", pagerDto);
		model.addAttribute("boardList", boardList);
		
		
		return "admin/board/b_read";

	}

	// 게시글 등록
	@RequestMapping("/boardSignup")
	public String boardSignup(Model model) {
		log.info("admin.boardSignup() 실행");
		model.addAttribute("admin", "board");
		return "/admin/board/b_signup";
	}

	// 게시글 수정
	@RequestMapping("/boardModify")
	public String boardModify(Model model) {
		log.info("admin.boardModify() 실행");
		model.addAttribute("admin", "board");
		return "/admin/board/b_modify";
	}
}

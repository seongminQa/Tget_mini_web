package com.mycompany.Tget_mini_web.controller;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.Tget_mini_web.dao.CartDao;
import com.mycompany.Tget_mini_web.dao.ProductDao;
import com.mycompany.Tget_mini_web.dao.ReviewDao;
import com.mycompany.Tget_mini_web.dto.CartDto;
import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.dto.OrderInfoDto;
import com.mycompany.Tget_mini_web.dto.ProductDto;
import com.mycompany.Tget_mini_web.dto.ReviewDto;
import com.mycompany.Tget_mini_web.security.TgetUserDetails;
import com.mycompany.Tget_mini_web.service.CartService;
import com.mycompany.Tget_mini_web.service.ProductService;
import com.mycompany.Tget_mini_web.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductDao productDao;

	@Autowired
	ProductService productService;
	
	
	@Autowired
	ReviewDao ReviewDao;

	@Autowired
	ReviewService reviewService;

	

	// 상품 리스트
	@RequestMapping("")
	public String productList(Model model) {

		// 페이징 정보를 얻어서 서비스쪽으로 넘기고 Service에서 게시물 목록 요청
		List<ProductDto> productList = productService.getShoppingProductList();
		model.addAttribute("productList", productList);

		return "/item/productList";
	}

	// 상품 리스트에서 보일 포스터 이미지를 화면에 다운로드 형식으로 출력 구현
	@GetMapping("/attachProduct")
	public void attachProduct(int pno, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		ProductDto productDto = productService.getProduct(pno); // 선택한 pno에 해당하는 인스턴스의 정보를 가져와 productDto 필드에 저장
		byte[] data = productService.getAttachProductData(pno); // 선택한 pno에 해당하는 포스터 데이터를 가져와 byte[] 형식으로 저장

		// 응답 헤더 구성
		// 콘텐츠의 타입을 응답컨텐츠 타입으로 저장
		response.setContentType(productDto.getPcontentattachtype());
		response.setContentType(productDto.getPposterattachtype());

		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}

	@GetMapping("/attachProductContent")
	public void attachProductContent(int pno, HttpServletResponse response) throws Exception {
		// 다운로드할 데이터를 준비
		ProductDto productDto = productService.getProduct(pno); // 선택한 pno에 해당하는 인스턴스의 정보를 가져와 productDto 필드에 저장
		byte[] data = productService.getAttachProductContent(pno);// 선택한 pno에 해당하는 포스터 데이터를 가져와 byte[] 형식으로 저장

		// 응답 헤더 구성
		// 콘텐츠의 타입을 응답컨텐츠 타입으로 저장
		response.setContentType(productDto.getPcontentattachtype());
		response.setContentType(productDto.getPposterattachtype());

		// 응답 본문에 파일 데이터 출력
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}

	// 상품 상세 페이지
	@GetMapping("/detail")
	public String detail(Model model, int pno, Authentication authentication) {
		if (authentication == null || !authentication.isAuthenticated()) {
			return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
		}

		TgetUserDetails userDetails = (TgetUserDetails) authentication.getPrincipal();
		MemberDto memberDto = userDetails.getMember();
		String mid = memberDto.getMid();

		log.info("detail()실행");
		log.info(Integer.toString(pno));
		log.info("mid : " + mid);

		ProductDto productDto = productService.getProductDetail(pno);
		
		log.info(productDto.getPplace());
		log.info(Integer.toString(productDto.getPprice()));
		List<ReviewDto> reviewList = reviewService.getReviewList(pno);
		log.info(reviewList.toString());
		
		
		model.addAttribute("productDto", productDto);
		model.addAttribute("reviewList", reviewList);


		return "item/detail";
	}

	// ==================================================================

	// 장바구니 구성
	@Autowired
	CartDao cartDao;

	@Autowired
	CartService cartService;

	// 장바구니 리스트(cart)
	// @Secured("ROLE_USER")
	@RequestMapping("/cart")
	public String cart(HttpSession session, Model model, String pageNo, Authentication authentication) {

		log.info("cart 컨트롤러 실행");

		// 현재 로그인한 회원의 정보 얻기
		TgetUserDetails userDetails = (TgetUserDetails) authentication.getPrincipal();
		MemberDto memberDto = userDetails.getMember();

		List<CartDto> cartList = cartService.getCartItemList(memberDto.getMid());
		// 카트리스트에 넘기기전에 상품금액을 갱신하여 전달 (원래 상품의 가격 * 수량)
		for (CartDto cartDto : cartList) {
			cartDto.setResultprice(cartDto.getPprice() * cartDto.getOamount());
		}
		List<ProductDto> productList = productService.getShoppingProductList();
		model.addAttribute("productList", productList);
		model.addAttribute("cartList", cartList);

		return "/member/shopping_cart";
	}

	// 상품 상세페이지에서 '장바구니 추가' 버튼을 누르면 실행
	@PostMapping("/addCartItem")
	public String addCartItem(CartDto cartDto, Authentication authentication) {

		log.info("addCartItem 컨트롤러 실행");
		TgetUserDetails userDetails = (TgetUserDetails) authentication.getPrincipal();
		MemberDto memberDto = userDetails.getMember();

		cartDto.setMid(memberDto.getMid());

		log.info(cartDto.getOdate().toString());
		log.info(cartDto.getOseatgrade());

		// 만약 해당 상품이 장바구니에 추가 되어있다면, (옵션 : 좌석의 등급과 날짜가 같다면)
		// 해당하는 장바구니 품목에 수량을 변경해준다.
		List<CartDto> cartList = cartService.getCartItemList(memberDto.getMid());

		boolean isUpdate = false;
		for (CartDto item : cartList) {
			log.info("for문의 item, CartDto 확인1 : " + item.getOseatgrade().toString()
					+ cartDto.getOseatgrade().toString());
			log.info("for문의 item, CartDto 확인1 : " + item.getOdate().toString() + cartDto.getOdate().toString());
			if (item.getOseatgrade() == cartDto.getOseatgrade() && item.getOdate() == cartDto.getOdate()) {
				item.setOamount(cartDto.getOamount() + item.getOamount());
				cartService.updateCartItem(item);
				isUpdate = true;
				break;
			}
		}

		/*
		 * for(CartDto item : cartList) { log.info("for문의 item, CartDto 확인1 : " +
		 * item.getOseatgrade().toString() + cartDto.getOseatgrade().toString());
		 * log.info("for문의 item, CartDto 확인1 : " + item.getOdate().toString() +
		 * cartDto.getOdate().toString());
		 * if(item.getOseatgrade().equals(cartDto.getOseatgrade()) &&
		 * item.getOdate().equals(cartDto.getOdate())) {
		 * item.setOamount(cartDto.getOamount() + item.getOamount());
		 * cartService.updateCartItem(item); isUpdate = true; break; } }
		 */

		if (!isUpdate) {
			cartService.addCartItem(cartDto);
		}

		return "redirect:/product/cart";
	}

	// 업데이트 방법 // get을 사용한 경우에는 이렇게 가능하다. set을 사용한 경우는 못함!
	@RequestMapping(value = "/updateCartItem", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String updateCartItem(int pno, int amount, List<CartDto> cart) {
		// 카트안의 pno를 찾고 그 pno의 수량(amount)를 찾는다? 적용시킨다?

		// pno와 같은 CartItem 찾기
		for (CartDto item : cart) {
			if (item.getPno() == pno) {
				// CartItem의 amount를 수정
				item.setOamount(amount); // 세션의 정보를 set하는게 아니라 cart의 아이템을 set하는거라 쓸 수 있음
			}
		}

		// 수정 결과를 응답 생성
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");

		return jsonObject.toString();
	}

	// 장바구니 하나의 아이템 제거 (삭제)
	// cart 데이터테이블에서 하나의 인스턴스 삭제 (cno로 구분)
	@RequestMapping("/removeCartItem")
	public String removeCartItem(int cno) {
		log.info("removeCartItem 실행");
		// Cart 테이블에서 해당 인스턴스 삭제
		cartService.removeCartItem(cno);
		return "redirect:/product/cart";
	}

	// ==================================================================

	@PostMapping("/orderInfo")
	public String orderInfo(OrderInfoDto orderInfoDto, Authentication authentication) {

		return "redirect:/product/cart";
	}
	// ===============================================댓글=====================



	
	@PostMapping("/writeReview")
	public String writeReview(ReviewDto reviewDto, int pno ,Authentication authentication, Model model) {
		if (authentication == null || !authentication.isAuthenticated()) {
			return "redirect:/member/login"; // 로그인 페이지로 리다이렉트
		}
		
		TgetUserDetails userDetails = (TgetUserDetails) authentication.getPrincipal();
		MemberDto memberDto = userDetails.getMember();
		String mid = memberDto.getMid();
		int rno = reviewDto.getRno();
		reviewDto.setMid(mid);
		reviewDto.setPno(pno);
		reviewDto.setRtitle("review"+rno+"-"+pno);

		log.info("writeReview 실행");
		reviewService.writeReview(reviewDto);

		return "redirect:/product/detail?pno="+pno;
	}

	
	
}
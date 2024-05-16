package com.mycompany.Tget_mini_web.controller;

import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.Tget_mini_web.dao.CartDao;
import com.mycompany.Tget_mini_web.dao.ProductDao;
import com.mycompany.Tget_mini_web.dto.CartDto;
import com.mycompany.Tget_mini_web.dto.MemberDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;
import com.mycompany.Tget_mini_web.dto.ProductDto;
import com.mycompany.Tget_mini_web.security.TgetUserDetails;
import com.mycompany.Tget_mini_web.service.CartService;
import com.mycompany.Tget_mini_web.service.ProductService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/product")
public class ProductController {
	@Autowired
	ProductDao productDao;
	
	@Autowired
	ProductService productService;
	
	// 상품 리스트
	@RequestMapping("")
		public String productList(Model model) {
		 
		// 페이징 정보를 얻어서 서비스쪽으로 넘기고  Service에서 게시물 목록 요청
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
		
	   model.addAttribute("productDto", productDto);
		
	   return "item/detail";
   }
   
   // ==================================================================
   
   // 장바구니 구성
   @Autowired
   CartDao cartDao;
   
   @Autowired
   CartService cartService;

   // 장바구니 리스트(cart)
   //@Secured("ROLE_USER")
   @RequestMapping("/cart")
   public String cart(HttpSession session, Model model, String pageNo,
		   Authentication authentication) {
	   
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
       int rowsPagSingTarget = cartService.getTotalRows();
       PagerDto pager = new PagerDto(5, 5, rowsPagSingTarget, intPageNo); // 페이지 객체 만들기
      
       // 페이징 정보를 얻어서 서비스쪽으로 넘기고  Service에서 카트 디테일 목록 요청
       TgetUserDetails userDetails = (TgetUserDetails) authentication.getPrincipal();
       MemberDto memberDto = userDetails.getMember();
       model.addAttribute("memberDto", memberDto);
       
       //List<CartDetailDto> cart = cartService.getCartList(pager);
       
       // 현재 로그인한 Mid 콘솔로 확인하기
       log.info("authentication 테스트 : " + memberDto.getMid());
       
       // jsp에서 사용할 수 있도록 설정.
       model.addAttribute("pager", pager);
       //model.addAttribute("currentMid", currentMid);
       //log.info(currentMid);
       //model.addAttribute("cartList", cart);
       
       
       return "/member/shopping_cart";
	}
	
   
//   @RequestMapping(value="/addCartItem/${pno}", method=RequestMethod.GET)
   @PostMapping("/addCartItem")
   /*public String addCartItem(@RequestParam(defaultValue="0") Integer cno, int pno, int oamount, String oseatgrade, @DateTimeFormat(pattern="yyyy-MM-dd") Date odate,
		   Authentication authentication) {*/
   public String addCartItem(CartDto cartDto,
		   Authentication authentication) {

	  TgetUserDetails userDetails = (TgetUserDetails) authentication.getPrincipal();
	  MemberDto memberDto = userDetails.getMember();
	  String mid = memberDto.getMid();

	  cartDto.setMid(memberDto.getMid());
	  cartService.addCartItem(cartDto);
	  
      return "/member/shopping_cart";
   }
	
	// 업데이트 방법 2  // get을 사용한 경우에는 이렇게 가능하다. set을 사용한 경우는 못함!
	/*@RequestMapping(value="/updateCartItem", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateCartItem(int pno, int amount, @SessionAttribute("cart") List<Ch08CartItem> cart) {
		// 카트안의 pno를 찾고 그 pno의 수량(amount)를 찾는다? 적용시킨다?
		
		// pno와 같은 CartItem 찾기
		for(Ch08CartItem item : cart) {
			if(item.getProduct().getPno() == pno) {
				// CartItem의 amount를 수정
				item.setAmount(amount); // 세션의 정보를 set하는게 아니라 cart의 아이템을 set하는거라 쓸 수 있음
			}
		}
		
		// 수정 결과를 응답 생성
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		
		return jsonObject.toString();
	}*/
	
	// 제거 방법 2 // get을 사용한 경우에는 이렇게 가능하다. set을 사용한 경우는 못함!
	/*@RequestMapping("/removeCartItem")
	public String removeCartItem(int pno, @SessionAttribute("cart") List<Ch08CartItem> cart) {

		// 위의 방식처럼 for문을 돌리면 지웠는데, 길이는 남아있어서 에러가 난다.
		// 따라서 이터레이터를 사용해야한다.
		Iterator<Ch08CartItem> iterator = cart.iterator();
		while(iterator.hasNext()) {
			Ch08CartItem cartItem = iterator.next();
			if(cartItem.getProduct().getPno() == pno) {
				log.info(pno + "삭제완료");
				iterator.remove();
			}
		}
		return "redirect:/ch08/cartView";
	}*/
   
}

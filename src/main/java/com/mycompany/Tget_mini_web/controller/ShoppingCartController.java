package com.mycompany.Tget_mini_web.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.mycompany.Tget_mini_web.dto.CartItem;
import com.mycompany.Tget_mini_web.dto.Product1;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/shopping")
public class ShoppingCartController {
	
	@RequestMapping("/productList")
	public String productList(Model model) {
		// 상품의 갯수 세기 (현재는 이미지 파일의 갯수만큼)
		String path = "D:\\KosaCourse\\firstproject\\Tget_mini_web\\src\\main\\webapp\\resources\\image\\product_image";
		
		File dir = new File(path);
		File[] files = dir.listFiles();

		// 상품 데이터 생성
		List<Product1> productList = new ArrayList<>();
		
		// 날짜
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		

		for(int i=1; i<=files.length; i++) {
			// 가격 랜덤함수를 사용하여 각자 다르게 만들어 봄
			double randomValue = Math.random();
			int price = (int) (randomValue*10000) + 10000;
			productList.add(new Product1(i, "연극", "/Tget_mini_web/resources/image/product_image/image"+i+".jpg",
					"연극 제목"+i, "연극 장르"+i, "연극 장소"+i, formatedNow.toString(), price));
		}

		// request 범위에 저장
		model.addAttribute("productList", productList);
		
		return "/item/productList";
	}
	
	@RequestMapping("/cart")
	public String cart(HttpSession session, Model model) {
		// 상품의 갯수 세기 (현재는 이미지 파일의 갯수만큼 / 현재 32개)
		String path = "D:\\KosaCourse\\firstproject\\Tget_mini_web\\src\\main\\webapp\\resources\\image\\product_image";
		
		File dir = new File(path);
		File[] files = dir.listFiles();

		// 상품 데이터 생성
		List<Product1> productList = new ArrayList<>();
		
		// 날짜
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = now.format(formatter);
		

		for(int i=1; i<=files.length; i++) {
			// 가격 랜덤함수를 사용하여 각자 다르게 만들어 봄
			double randomValue = Math.random();
			int price = (int) (randomValue*10000) + 10000;
			productList.add(new Product1(i, "연극", "/Tget_mini_web/resources/image/product_image/image"+i+".jpg",
					"연극 제목"+i, "연극 장르"+i, "연극 장소"+i, formatedNow.toString(), price));
		}

		// request 범위에 저장
		model.addAttribute("productList", productList);
				
		log.info("cart 페이지");
		// 장바구니를 세션에서 가져오기	
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		// 가져온 장바구니가 없을 경우 새로 장바구니를 생성하여 session 범위에 저장
		if(cart == null) {
			cart = new ArrayList<CartItem>();
			session.setAttribute("cart", cart);
		}
		return "member/shopping_cart";
	}
	
	@RequestMapping("/addCartItem")
	public String addCartItem(int pno, String pkind, String pimg, String ptitle, 
			String pgenre, String pplace, String pperiod, int pprice, 
			int amount, HttpSession session) {
		// 장바구니에서 세션 가져오기
		List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
		
		// 가져온 장바구니가 없을 경우 새로 장바구니를 생성해서 session 범위에 저장
		if(cart == null) { // 가져왔는데 만약 없다면? 장바구니를 세션에 만들어야 함!
			cart = new ArrayList<CartItem>();
			session.setAttribute("cart", cart);
		}
		
		// pno가 같은 아이템이 있으면 장바구니의 수량을 수정함
		boolean isAmountUpdated = false;
		for(CartItem cartItem : cart) {
			if(cartItem.getProduct().getPno() == pno) {
				cartItem.setAmount(cartItem.getAmount() + amount);
				isAmountUpdated = true;
			}
		}
		
		if(isAmountUpdated == false) {
			// 상품 상세 정보 얻기
			Product1 product = new Product1(pno, pkind, pimg, ptitle, pgenre, pplace, 
					pperiod, pprice);
			// 장바구니 아이템 생성
			CartItem cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setAmount(amount);
			// 장바구니에 장바구니 아이템을 추가
			cart.add(cartItem);
		}
		return "redirect:/member/shoppingCart";
	}
	
	// 업데이트 방법
	@RequestMapping(value="/updateCartItem", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String updateCartItem(int pno, int amount, @SessionAttribute("cart") List<CartItem> cart) {
		// 카트안의 pno를 찾고 그 pno의 수량(amount)를 찾는다? 적용시킨다?
		
		// pno와 같은 CartItem 찾기
		for(CartItem item : cart) {
			if(item.getProduct().getPno() == pno) {
				// CartItem의 amount를 수정
				item.setAmount(amount); // 세션의 정보를 set하는게 아니라 cart의 아이템을 set하는거라 쓸 수 있음
			}
		}
		
		// 수정 결과를 응답 생성
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", "success");
		
		return jsonObject.toString();
	}
	
	// 제거 방법
	@RequestMapping("/removeCartItem")
	public String removeCartItem(int pno, @SessionAttribute("cart") List<CartItem> cart) {

		// 위의 방식처럼 for문을 돌리면 지웠는데, 길이는 남아있어서 에러가 난다.
		// 따라서 이터레이터를 사용해야한다.
		Iterator<CartItem> iterator = cart.iterator();
		while(iterator.hasNext()) {
			CartItem cartItem = iterator.next();
			if(cartItem.getProduct().getPno() == pno) {
				log.info(pno + "삭제완료");
				iterator.remove();
			}
		}
		return "redirect:/member/shoppingCart";
	}
}

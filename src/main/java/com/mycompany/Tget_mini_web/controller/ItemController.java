package com.mycompany.Tget_mini_web.controller;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.Tget_mini_web.dao.MemberDao;
import com.mycompany.Tget_mini_web.dao.ProductDao;
import com.mycompany.Tget_mini_web.dto.ProductDto;
import com.mycompany.Tget_mini_web.dto.ReviewDto;
import com.mycompany.Tget_mini_web.service.MemberService;
import com.mycompany.Tget_mini_web.service.ProductService;
import com.mycompany.Tget_mini_web.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReviewService service;

	
	
	@GetMapping("/detail")
	public String detail(Model model, int pno) {
		log.info("detail()실행");
		log.info(Integer.toString(pno));
		
		ProductDto productDto = productService.getProductDetail(pno);
		log.info(productDto.getPplace());
		log.info(Integer.toString(productDto.getPprice()));
		
		model.addAttribute("productDto", productDto);
		
		return "item/detail";
	}
	
	// 이미지 다운로드
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
	
	
	
	//마이페이지 구매내역 상세페이지
	@RequestMapping("/status_page")
	public String status_page() {
		log.info("item.status_page()실행");
		return "item/status_page";
	}
	@RequestMapping("writeReviewForm")
	public String writeReviewForm() {
		log.info("item.writeReviewForm() 실행");
		return "item/writeReviewForm";
	}
	
	
	
		
}

package com.mycompany.Tget_mini_web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.Tget_mini_web.dao.BoardDao;
import com.mycompany.Tget_mini_web.dao.ProductDao;
import com.mycompany.Tget_mini_web.dto.BoardDto;
import com.mycompany.Tget_mini_web.dto.ProductDto;
import com.mycompany.Tget_mini_web.service.BoardService;
import com.mycompany.Tget_mini_web.service.ProductService;

//import jdk.internal.org.jline.utils.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
	ProductDao productDao;
	@Autowired
	BoardDao BoardDao;
	
	@Autowired
	ProductService productService;
	@Autowired
	BoardService boradService;

	
	// 상품 리스트
	@RequestMapping("")
		public String index(Model model) {
		 
		// 페이징 정보를 얻어서 서비스쪽으로 넘기고  Service에서 게시물 목록 요청
		List<ProductDto> productList = productService.getShoppingProductList();
		model.addAttribute("productList", productList);
		List<BoardDto> boardList = boradService.getBListHit();
		model.addAttribute("boardList", boardList);
		  
		return "home";
	}
	
	
}

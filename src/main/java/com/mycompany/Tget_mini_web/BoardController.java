package com.mycompany.Tget_mini_web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/*
	게시판 컨트롤
	삽입 / 삭제 / 수정 구현
	page 분리 (10개 목록 리스트 나열, 이후론 페이지 추가)
	
*/

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	@RequestMapping("")
	public String index() {
		log.info("board.index() 실행");
		return "board/index";
	}
}

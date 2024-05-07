package com.mycompany.Tget_mini_web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.Tget_mini_web.dto.BoardDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;
import com.mycompany.Tget_mini_web.service.BoardService;


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
	@Autowired
	private BoardService service;

	@RequestMapping("")
	public String index() {
		log.info("board.index() 실행");
		return "board/index";
	}

	@RequestMapping("writeBoardForm")
	public String writeBoardForm() {
		log.info("board.writeBoardForm() 실행");
		return "board/writeBoardForm";
	}

	@PostMapping("/writeBoard")
	public String writeBoard(BoardDto boardDto) {
		if (boardDto.getBimg() != null && !boardDto.getBimg().isEmpty()) {
			// DTO 추가 설정
			try {
				boardDto.setBimgdata(boardDto.getBimg().getBytes());
			} catch (Exception e) {
			}
		}
		boardDto.setMid("admin");
		service.writeBoard(boardDto);

		return "redirect:/board";
	}

	@GetMapping("")
	public String boardList(String pageNo, Model model, HttpSession session) {

		if (pageNo == null) {
			pageNo = (String) session.getAttribute("pageNo");
			// 세션에 저장되어 있지 않을 경우"1"로 강제 세팅
			if (pageNo == null) {
				pageNo = "1";
			}
		}
		// 세션에 pageNo 저장
		session.setAttribute("pageNo", pageNo);
		// 문자열을 정수로 반환
		int intPageNo = Integer.parseInt(pageNo);

		// Pager 객체 생성
		int rowsPagingTarget = service.getTotalRows();
		PagerDto pagerDto = new PagerDto(10, 10, rowsPagingTarget, intPageNo);

		// Service에서 게시물 목록 요청
		List<BoardDto> boardList = service.getBoardList(pagerDto);

		model.addAttribute("pagerDto",  pagerDto);
		model.addAttribute("boardList", boardList);
		return "board/index";

	}

}

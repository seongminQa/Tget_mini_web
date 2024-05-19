package com.mycompany.Tget_mini_web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.BoardDao;
import com.mycompany.Tget_mini_web.dto.BoardDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;
import com.mycompany.Tget_mini_web.dto.ProductDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class BoardService {
	@Resource 
	private BoardDao boardDao;
	
	public void writeBoard(BoardDto boardDto) {
		// 비즈니스 로직 처리
		int rowNum = boardDao.insert(boardDto);
		log.info("rowNum:" + rowNum+ "bno:"+boardDto.getBno());
		
	}

	public int getTotalRows() {
		int totalRows = boardDao.count();
		return totalRows;
	}
	public List<BoardDto> getBoardList(PagerDto pagerDto) {
		List<BoardDto> boardList = boardDao.selectByPage(pagerDto);
		return boardList;
		
	}
	public BoardDto getBoard(int bno) {
		BoardDto board = boardDao.selectByBno(bno);
		return board;
	}

	public byte[] getAttachData(int bno) {
		BoardDto boardDto = boardDao.selectAttachData(bno);
		return boardDto.getBimg();
	}

	public void updateBoard(BoardDto boardDto) {
		int rowNum = boardDao.update(boardDto);
	}

	public void removeBoard(int bno) {
		boardDao.deleteByBno(bno);
	}
	
	public void myBoardPage(PagerDto pagerDto) {
		// 비즈니스 로직 처리
		boardDao.selectByMyPage(pagerDto);
		log.info("myBoardPage 실행");
		
	}
	public void plusHitCnt(int bno) {
		boardDao.plusCnt(bno);
	}

	public List<BoardDto> getBoardList() {
		List<BoardDto> boardList = boardDao.selectByBoardList();
		return boardList;
	}

	public List<BoardDto> getBListHit() {
		List<BoardDto> bListHit = boardDao.selectByHitcount();
		return bListHit;
	}


	

}

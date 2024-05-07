package com.mycompany.Tget_mini_web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.BoardDao;
import com.mycompany.Tget_mini_web.dto.BoardDto;

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

}

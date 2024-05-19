package com.mycompany.Tget_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.BoardDto;
import com.mycompany.Tget_mini_web.dto.PagerDto;

@Mapper
public interface BoardDao {
	public int insert(BoardDto boardDto);
	public int count();
	public List<BoardDto> selectByPage(PagerDto pagerDto);
	public BoardDto selectByBno(int bno);
	public BoardDto selectAttachData(int bno);
	public int update(BoardDto boardDto);
	public void deleteByBno(int bno);
	//
	public List<BoardDto> selectByMyPage(PagerDto pagerDto);

	public void plusCnt(int bno);
	public List<BoardDto> selectByBoardList();
	public List<BoardDto> selectByHitcount();
}

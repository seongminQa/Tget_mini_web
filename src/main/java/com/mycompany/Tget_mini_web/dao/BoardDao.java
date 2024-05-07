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

}

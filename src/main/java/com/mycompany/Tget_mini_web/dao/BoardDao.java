package com.mycompany.Tget_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.BoardDto;

@Mapper
public interface BoardDao {

	public int insert(BoardDto boardDto);

}

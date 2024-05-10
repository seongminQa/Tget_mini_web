package com.mycompany.Tget_mini_web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.ReviewDto;

@Mapper
public interface ReviewDao {

	int insert(ReviewDto reviewDto);

	

}

package com.mycompany.Tget_mini_web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.Tget_mini_web.dto.ReviewDto;

@Mapper
public interface ReviewDao {

	public int insert(ReviewDto reviewDto);
	public int delete(ReviewDto reviewDto);
	public List<ReviewDto> selectByReviewList(int pno);

	

}

package com.mycompany.Tget_mini_web.service;

import java.util.List;


import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;


import com.mycompany.Tget_mini_web.dao.ReviewDao;
import com.mycompany.Tget_mini_web.dto.ProductDto;
import com.mycompany.Tget_mini_web.dto.ReviewDto;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewService {
	@Resource 
	private ReviewDao reviewDao;
	
	public void writeReview(ReviewDto reviewDto) {
		// TODO Auto-generated method stub
		int rowNum = reviewDao.insert(reviewDto);
		log.info("rowNum:" + rowNum+ "rno:"+reviewDto.getRno());
	}
	public List<ReviewDto> getReviewList(int pno) {
		// TODO Auto-generated method stub
		List<ReviewDto> reviewList = reviewDao.selectByReviewList(pno);
		log.info(reviewList.toString());
		return reviewList;
	}

}

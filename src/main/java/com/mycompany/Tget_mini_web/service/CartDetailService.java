package com.mycompany.Tget_mini_web.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mycompany.Tget_mini_web.dao.CartDetailDao;
import com.mycompany.Tget_mini_web.dto.CartDetailDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CartDetailService {
	@Resource
	private CartDetailDao cartDetailDao;
	
	public void cartDetailSignUp(CartDetailDto cartDetailDto) {
		cartDetailDao.insertCartDetail(cartDetailDto);
	}
	
	
	
}
